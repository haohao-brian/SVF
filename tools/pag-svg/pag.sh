#!/usr/bin/env bash
# Compile one C source file and render its SVF program assignment graph.
set -euo pipefail

usage() {
  cat <<'HELP'
Usage: bash tools/pag-svg/pag.sh SOURCE.c [OUTPUT_DIR] [-- CLANG_FLAGS...]

Example: bash tools/pag-svg/pag.sh /path/to/example.c
Example: bash tools/pag-svg/pag.sh /path/to/example.c /path/to/graphs -- -I/path/to/include -DMODE=1

Default output: a SOURCE-pag directory next to SOURCE.c.
Outputs: source.c, input.raw.ll, input.ll, pag.dot, pag.svg, analysis.log.
Re-running updates these generated files. Supports one C translation unit;
whole projects need their build settings and linked LLVM IR.

Tools: LLVM_BIN (clang/opt directory), or LLVM_DIR (installation prefix);
       WPA (wpa executable), NODE (Node.js executable), EXTAPI (extapi.bc).
Defaults: the sourced SVF environment / PATH and this checkout's build folders.
Setup: npm ci --prefix tools/pag-svg --ignore-scripts
HELP
}

if [[ $# -eq 0 ]]; then usage >&2; exit 2; fi
if [[ $1 == -h || $1 == --help ]]; then usage; exit 0; fi
source_arg=$1
shift
[[ -f "$source_arg" && "$source_arg" == *.c ]] || {
  printf 'Expected an existing .c file: %s\n' "$source_arg" >&2; exit 2;
}
source_dir=$(cd -- "$(dirname -- "$source_arg")" && pwd -P)
source_file="$source_dir/$(basename -- "$source_arg")"
output_dir="${source_file%.c}-pag"
if [[ $# -gt 0 && $1 != -- ]]; then output_dir=$1; shift; fi
if [[ $# -gt 0 ]]; then
  [[ $1 == -- ]] || { usage >&2; exit 2; }
  shift
fi

tool_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
repo_dir=$(cd -- "$tool_dir/../.." && pwd -P)
llvm_bin=${LLVM_BIN:-${LLVM_DIR:+$LLVM_DIR/bin}}
clang_request=${llvm_bin:+$llvm_bin/clang}
opt_request=${llvm_bin:+$llvm_bin/opt}
wpa_request=${WPA:-}
if [[ -z "$wpa_request" ]]; then
  for candidate in "$repo_dir/Release-build/bin/wpa" "$repo_dir/build/bin/wpa" "$repo_dir/Debug-build/bin/wpa"; do
    if [[ -x "$candidate" ]]; then wpa_request=$candidate; break; fi
  done
fi
resolve_tool() {
  local found
  found=$(command -v "$1") || {
    printf 'Required tool not found: %s. See the C-to-PAG section in README.md.\n' "$1" >&2
    return 1
  }
  # Resolve paths before changing directory to run WPA.
  printf '%s/%s\n' "$(cd -- "$(dirname -- "$found")" && pwd -P)" "$(basename -- "$found")"
}
clang_bin=$(resolve_tool "${clang_request:-clang}")
opt_bin=$(resolve_tool "${opt_request:-opt}")
wpa_bin=$(resolve_tool "${wpa_request:-wpa}")
node_bin=$(resolve_tool "${NODE:-node}")
wpa_args=(-ander -dump-pag)
extapi_file=${EXTAPI:-}
if [[ -z "$extapi_file" && -f "$(dirname -- "$wpa_bin")/../lib/extapi.bc" ]]; then
  extapi_file="$(dirname -- "$wpa_bin")/../lib/extapi.bc"
fi
if [[ -n "$extapi_file" ]]; then
  [[ -f "$extapi_file" ]] || { printf 'External API model not found: %s\n' "$extapi_file" >&2; exit 2; }
  extapi_file="$(cd -- "$(dirname -- "$extapi_file")" && pwd -P)/$(basename -- "$extapi_file")"
  wpa_args+=("-extapi=$extapi_file")
fi
clang_version=$("$clang_bin" --version)
opt_version=$("$opt_bin" --version)
clang_major=$(printf '%s\n' "$clang_version" | sed -nE 's/.*clang version ([0-9]+).*/\1/p' | head -n 1)
opt_major=$(printf '%s\n' "$opt_version" | sed -nE 's/.*LLVM version ([0-9]+).*/\1/p' | head -n 1)
if [[ "$clang_version" == *"Apple clang"* || -z "$clang_major" || "$clang_major" != "$opt_major" ]]; then
  printf 'Use matching upstream LLVM clang/opt, from the LLVM installation used to build WPA.\nSet LLVM_BIN or source setup.sh with the correct LLVM_DIR.\n' >&2
  exit 2
fi
[[ -d "$tool_dir/node_modules/@viz-js/viz" ]] || {
  printf 'Install the renderer first: npm ci --prefix "%s" --ignore-scripts\n' "$tool_dir" >&2
  exit 2
}
mkdir -p -- "$output_dir"
output_dir=$(cd -- "$output_dir" && pwd -P)
[[ ! "$source_file" -ef "$output_dir/source.c" ]] || {
  printf 'Choose an output directory separate from the input source.c.\n' >&2; exit 2;
}

# Use a fresh working directory so a failed run cannot reuse an old DOT file.
work_dir=$(mktemp -d "$output_dir/.pag-work.XXXXXX")
trap 'rm -rf -- "$work_dir"' EXIT
printf '1/3 Compile: %s\n' "$source_file"
"$clang_bin" "$@" -O0 -g -Xclang -disable-O0-optnone \
  -fno-discard-value-names -emit-llvm -S "$source_file" -o "$work_dir/input.raw.ll"
"$opt_bin" -S -passes=mem2reg "$work_dir/input.raw.ll" -o "$work_dir/input.ll"

printf '2/3 Build PAG with WPA\n'
if ! (cd -- "$work_dir" && "$wpa_bin" "${wpa_args[@]}" input.ll > analysis.log 2>&1); then
  cat "$work_dir/analysis.log" >&2
  exit 1
fi
[[ -s "$work_dir/svfir_initial.dot" ]] || {
  cat "$work_dir/analysis.log" >&2
  printf 'WPA did not produce svfir_initial.dot.\n' >&2; exit 1;
}
mv -- "$work_dir/svfir_initial.dot" "$work_dir/pag.dot"
printf '3/3 Render SVG\n'
"$node_bin" "$tool_dir/render-pag.mjs" "$work_dir/pag.dot" "$work_dir/pag.svg"

# Keep the source snapshot and the matching IR alongside this graph.
cp -- "$source_file" "$work_dir/source.c"
printf '%s\n' "$source_file" > "$work_dir/source-path.txt"
printf 'Clang: %s\n%s\nOpt: %s\n%s\nWPA: %s\n' "$clang_bin" "$clang_version" "$opt_bin" "$opt_version" "$wpa_bin" > "$work_dir/toolchain.txt"
for artifact in toolchain.txt source.c source-path.txt input.raw.ll input.ll pag.dot pag.svg analysis.log; do
  cp -- "$work_dir/$artifact" "$output_dir/$artifact"
done
printf '\nPAG SVG: %s/pag.svg\nLLVM IR: %s/input.ll\n' "$output_dir" "$output_dir"
