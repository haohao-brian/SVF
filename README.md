<img src="./docs/images/svf_logo_2.png" width="15%"><img src="./docs/images/svf_logo_3.png" width="85%">

SVF provides reusable abstractions, graphs, and solvers for analyzing LLVM IR.

## News
* <b>[MSli](https://github.com/SVF-tools/SVF/wiki/MTA-MSli), an on-demand program slicing tool for multithreaded programs, is now available in [SVF/MTA](https://github.com/SVF-tools/SVF/tree/master/svf/include/MTA). </b>
* <b>SVF now supports [LLVM-22](https://github.com/SVF-tools/SVF/pull/1876) (Contributed by [Giorgio](https://github.com/dg1474)). </b>
* <b>SVF now supports [LLVM-21](https://github.com/SVF-tools/SVF/pull/1815) (Contributed by [cjsrxzdyzds](https://github.com/cjsrxzdyzds)). </b>
* <b>SVF now supports new [build system](https://github.com/SVF-tools/SVF/pull/1703) (Thank [Johannes](https://github.com/Johanmyst) for his help!). </b>
* <b> [SVF-Python](https://github.com/SVF-tools/SVF-Python) is now available, enabling developers to write static analyzers in Python by leveraging the SVF library (Contributed by [Jiawei Wang](https://github.com/bjjwwang)). </b>
* <b>New course [Software Security Analysis](https://github.com/SVF-tools/Software-Security-Analysis) for learning code analysis and verification with SVF for fun and expertise! </b>
* <b>SVF now supports LLVM-16.0.0 with opaque pointers (Contributed by [Xiao Cheng](https://github.com/jumormt)). </b>
* <b>Modernize SVF's CMake (Contributed by [Johannes](https://github.com/Johanmyst)). </b>

<details>
<summary>Older news</summary>

* <b>SVF now supports LLVM-13.0.0 (Thank [Shengjie Xu](https://github.com/xushengj) for his help!). </b>
* <b>[Object clustering](https://github.com/SVF-tools/SVF/wiki/Object-Clustering) published in our [OOPSLA paper](https://yuleisui.github.io/publications/oopsla21.pdf) is now available in SVF </b>
* <b>[Hash-Consed Points-To Sets](https://github.com/SVF-tools/SVF/wiki/Hash-Consed-Points-To-Sets) published in our [SAS paper](https://yuleisui.github.io/publications/sas21.pdf) is now available in SVF </b>
* <b> Learning or teaching Software Analysis? Check out [SVF-Teaching](https://github.com/SVF-tools/SVF-Teaching)! </b>
* <b>SVF now supports LLVM-12.0.0 (Thank [Xiyu Yang](https://github.com/sherlly/) for her help!). </b>
* <b>[VSFS](https://github.com/SVF-tools/SVF/wiki/VSFS) published in our [CGO paper](https://yuleisui.github.io/publications/cgo21.pdf) is now available in SVF </b>
* <b>[TypeClone](https://github.com/SVF-tools/SVF/wiki/TypeClone) published in our [ECOOP paper](https://yuleisui.github.io/publications/ecoop20.pdf) is now available in SVF </b>
* <b>SVF now uses a single script for its build. Just type [`source ./build.sh`](https://github.com/SVF-tools/SVF/blob/master/build.sh) in your terminal, that's it!</b>
* <b>SVF now supports LLVM-10.0.0! </b>
* <b>We thank [bsauce](https://github.com/bsauce) for writing a user manual of SVF ([link1](https://www.jianshu.com/p/068a08ec749c) and [link2](https://www.jianshu.com/p/777c30d4240e)) in Chinese </b>
* <b>SVF now supports LLVM-9.0.0 (Thank [Byoungyoung Lee](https://github.com/SVF-tools/SVF/issues/142) for his help!). </b>
* <b>SVF now supports a set of [field-sensitive pointer analyses](https://yuleisui.github.io/publications/sas2019a.pdf). </b>
* <b>[Use SVF as an external lib](https://github.com/SVF-tools/SVF-example) for your own project (Contributed by [Hongxu Chen](https://github.com/HongxuChen)). </b>
* <b>SVF now supports LLVM-7.0.0. </b>
* <b>SVF now supports Docker. [Try SVF in Docker](https://github.com/SVF-tools/SVF/wiki/Try-SVF-in-Docker)! </b>
* <b>SVF now supports [LLVM-6.0.0](https://github.com/svf-tools/SVF/pull/38) (Contributed by [Jack Anthony](https://github.com/jackanth)). </b>
* <b>SVF now supports [LLVM-4.0.0](https://github.com/svf-tools/SVF/pull/23) (Contributed by Jared Carlson. Thank [Jared](https://github.com/jcarlson23) and [Will](https://github.com/dtzWill) for their in-depth [discussions](https://github.com/svf-tools/SVF/pull/18) about updating SVF!) </b>
* <b>SVF now supports analysis for C++ programs.</b>

</details>

## Documentation

| About SVF       | Setup  Guide         | User Guide  | Developer Guide  |
| ------------- |:-------------:| -----:|-----:|
| ![About](https://github.com/svf-tools/SVF/blob/master/docs/images/help.png?raw=true)| ![Setup](https://github.com/svf-tools/SVF/blob/master/docs/images/tools.png?raw=true)  | ![User](https://github.com/svf-tools/SVF/blob/master/docs/images/users.png?raw=true)  |  ![Developer](https://github.com/svf-tools/SVF/blob/master/docs/images/database.png?raw=true)
| Introducing SVF -- [what it does](https://github.com/svf-tools/SVF/wiki/About#what-is-svf) and [how we design it](https://github.com/svf-tools/SVF/wiki/SVF-Design#svf-design)      | A step by step [setup guide](https://github.com/svf-tools/SVF/wiki/Setup-Guide#getting-started) to build SVF | Command-line options to [run SVF](https://github.com/svf-tools/SVF/wiki/User-Guide#quick-start), get [analysis outputs](https://github.com/svf-tools/SVF/wiki/User-Guide#analysis-outputs), and test SVF with [an example](https://github.com/svf-tools/SVF/wiki/Analyze-a-Simple-C-Program) or [PTABen](https://github.com/SVF-tools/PTABen) | Detailed [technical documentation](https://github.com/svf-tools/SVF/wiki/Technical-documentation) and how to [write your own analyses](https://github.com/svf-tools/SVF/wiki/Write-your-own-analysis-in-SVF) in SVF or [use SVF as a lib](https://github.com/SVF-tools/SVF-example) for your tool, and the [course](https://github.com/SVF-tools/Software-Security-Analysis) on SVF  |

<b>SVF</b>'s doxygen document is available [here](https://svf-tools.github.io/SVF-doxygen/html).

## Features and Publications

<b>SVF</b> ([CC'16](https://dl.acm.org/doi/10.1145/2892208.2892235)) is able to perform
* [AE](https://github.com/SVF-tools/SVF/tree/master/svf/include/AE) (<b>abstract execution</b>): cross-domain execution ([ICSE'24](https://dl.acm.org/doi/10.1145/3597503.3639220)), selective widening ([OOPSLA'25](https://dl.acm.org/doi/10.1145/3763083)), recursion analysis ([ECOOP'25](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2025.34)), typestate analysis ([FSE'24](https://dl.acm.org/doi/10.1145/3643749));
* [WPA](https://github.com/SVF-tools/SVF/tree/master/svf/include/WPA) (<b>whole program analysis</b>): field-sensitive ([SAS'19](https://link.springer.com/chapter/10.1007/978-3-030-32304-2_3)), flow-sensitive ([CGO'21](https://ieeexplore.ieee.org/document/9370334), [OOPSLA'21](https://dl.acm.org/doi/10.1145/3485547)) analysis;
* [DDA](https://github.com/SVF-tools/SVF/tree/master/svf/include/DDA) (<b>demand-driven analysis</b>): flow-sensitive, context-sensitive points-to analysis ([FSE'16](https://dl.acm.org/doi/10.1145/2950290.2950296), [TSE'18](https://doi.org/10.1109/TSE.2018.2869336));
* [MSSA](https://github.com/SVF-tools/SVF/tree/master/svf/include/MSSA) (<b>memory SSA form construction</b>): memory regions, side-effects, SSA form ([JSS'18](https://doi.org/10.1016/j.jss.2018.09.038));
* [SABER](https://github.com/SVF-tools/SVF/tree/master/svf/include/SABER) (<b>memory error checking</b>): memory leaks and double-frees ([ISSTA'12](https://dl.acm.org/doi/10.1145/2338965.2336784), [TSE'14](https://doi.org/10.1109/TSE.2014.2302311), [ICSE'18](https://dl.acm.org/doi/10.1145/3180155.3180178));
* [MTA](https://github.com/SVF-tools/SVF/tree/master/svf/include/MTA) (<b>analysis of multithreaded programs</b>): value-flows for multithreaded programs ([CGO'16](https://dl.acm.org/doi/10.1145/2854038.2854043)), on-demand program slicing ([ISSTA'26](https://joelyyoung.github.io/pdf/issta26.pdf));
* [CFL](https://github.com/SVF-tools/SVF/tree/master/svf/include/CFL) (<b>context-free-reachability analysis</b>): standard CFL solver, graph and grammar ([OOPSLA'22](https://dl.acm.org/doi/10.1145/3563343), [PLDI'23](https://dl.acm.org/doi/10.1145/3591233));
* [SVFIR](https://github.com/SVF-tools/SVF/tree/master/svf/include/SVFIR) and [MemoryModel](https://github.com/SVF-tools/SVF/tree/master/svf/include/MemoryModel) (<b>SVFIR</b>): SVFIR, memory abstraction and points-to data structure ([SAS'21](https://link.springer.com/chapter/10.1007/978-3-030-88806-0_2));
* [Graphs](https://github.com/SVF-tools/SVF/tree/master/svf/include/Graphs): <b> generating a variety of graphs</b>, including call graph, ICFG, class hierarchy graph, constraint graph, value-flow graph for static analyses and code embedding ([OOPSLA'20](https://dl.acm.org/doi/10.1145/3428301), [TOSEM'21](https://dl.acm.org/doi/10.1145/3436877))

<p>We release the SVF source code with the hope of benefiting the open-source community. If you find SVF helpful, please kindly acknowledge the use of the tool or the relevant publications above. </p>

<a id="c-to-pag-svg"></a>

## C → PAG SVG：指定自己的 C 檔，一步一步產圖

本節提供可重複使用的 [PAG 腳本](tools/pag-svg/pag.sh)。指定一份 C 程式，
腳本會產生相對應的 LLVM IR、PAG 的 DOT，以及可用瀏覽器開啟的 SVG。
換另一份 C 檔時，只需要換輸入路徑。

```text
your-program.c
  → Clang：input.raw.ll
  → opt / mem2reg：input.ll
  → WPA / -dump-pag：pag.dot
  → Graphviz：pag.svg
```

WPA 是 SVF 的分析工具，負責輸出圖的節點與邊；Graphviz 負責把 DOT 排版成 SVG。
此處使用固定版本的 `@viz-js/viz`（Graphviz WebAssembly），不需要另外安裝 `dot`。

### 1. Clone 倉庫

```bash
git clone https://github.com/haohao-brian/SVF.git
cd SVF
```

後續指令都在這個新下載的 `SVF` 資料夾中執行。

### 2. 準備工具並建置 WPA

需要 Git、Bash、CMake 3.23 以上、C/C++ 建置工具，以及 Node.js 22 以上和 npm。
macOS 可先用 Homebrew 安裝 `cmake`、`node`，並確認 Xcode Command Line Tools 已安裝；
其他平台的系統套件需求請見 [SVF Setup Guide](https://github.com/SVF-tools/SVF/wiki/Setup-Guide)。

使用倉庫原有的建置腳本。先切換到 Bash，讓後面的 `source` 使用 Bash 語法：

```bash
bash
source ./build.sh
```

第一次會準備相依套件並編譯 SVF。這份倉庫的建置腳本目前預設使用 LLVM 21；
若你已設定 `LLVM_DIR` 或 `Z3_DIR`，建置腳本會使用指定的安裝位置。
`source ./build.sh` 完成後會設定目前 shell 的 LLVM 與 SVF 環境。

若已經建置好，在新的 Bash 終端工作階段只需要：

```bash
source ./setup.sh
```

自訂安裝的使用者應先把 `LLVM_DIR` 設為建置這份 WPA 時所用的 LLVM 安裝根目錄。
**Clang、opt 與 WPA 必須搭配相容的 LLVM 版本**，不要把系統 Apple Clang 產生的 IR
直接混用到另一版本的 WPA。

### 3. 安裝 SVG 排版套件

```bash
npm ci --prefix tools/pag-svg --ignore-scripts
```

這會依照 `tools/pag-svg/package-lock.json` 安裝繪圖套件，無須在倉庫根目錄執行 npm install。

### 4. 用隨附範例產生 PAG

```bash
bash tools/pag-svg/pag.sh tools/pag-svg/examples/swap.c
```

腳本會顯示編譯、分析、轉圖三個階段，成功後印出 SVG 與 IR 的完整位置。
這份範例的結果位於：

```text
tools/pag-svg/examples/swap-pag/pag.svg
```

在 macOS 開啟：

```bash
open tools/pag-svg/examples/swap-pag/pag.svg
```

在有桌面環境的 Linux 開啟：

```bash
xdg-open tools/pag-svg/examples/swap-pag/pag.svg
```

也可以直接把 SVG 拖進瀏覽器。伺服器上產生的 SVG 可以複製到自己的電腦閱讀。

### 5. 換成自己的 C 程式

將範例路徑換成你的實際檔案路徑即可。假設你的桌面有 `example.c`：

```bash
bash tools/pag-svg/pag.sh "$HOME/Desktop/example.c"
```

輸出預設在原始檔旁的 `example-pag/`，圖就是 `example-pag/pag.svg`。
路徑有空白時請保留引號。

也可以用第二個參數指定輸出位置：

```bash
bash tools/pag-svg/pag.sh "$HOME/Desktop/example.c" ./my-pag
```

需要 include 搜尋路徑或巨集定義時，把 Clang 參數放在 `--` 後面：

```bash
bash tools/pag-svg/pag.sh "$HOME/Desktop/example.c" ./my-pag -- -I./include -DMODE=1
```

### 6. 對照這次產生的原始碼、IR 和圖

| 檔案 | 意義 |
| --- | --- |
| `source.c` | 本次分析的 C 原始碼副本 |
| `source-path.txt` | 輸入檔案的原始位置 |
| `input.raw.ll` | Clang 輸出的文字 LLVM IR |
| `input.ll` | 經過 mem2reg、實際交給 WPA 分析的 IR |
| `pag.dot` | WPA 輸出的 PAG；原始輸出檔名為 `svfir_initial.dot` |
| `pag.svg` | 排版後可以閱讀的 PAG |
| `analysis.log` | WPA 的分析紀錄 |
| `toolchain.txt` | 本次使用的工具位置與 Clang / opt 版本 |

讀圖時，請搭配**同一輸出資料夾**的 `source.c` 和 `input.ll`。
兩個都叫 `swap.c` 的檔案不一定是同一份程式；更換程式或 LLVM / SVF 版本後，
節點編號、IR 名稱和圖形也可能改變。

隨附範例在交換指標後，會用 `(*a == 'B' && *b == 'A')` 檢查結果。
若你分析的程式只有 `return 0`，就不會有這段條件判斷產生的區塊。
圖上 `f` 表示所屬函式、`bb` 表示基本區塊；`line` 是除錯資訊中的原始碼行號，
不是區塊裡第幾條指令。`line: 0` 表示該位置沒有指定具體原始碼行號。

成功重跑時會更新輸出檔案。每次分析都使用新的暫存工作資料夾，以免拿舊 DOT 當新結果；
如果中途失敗，既有輸出仍是前一次成功的結果，請先處理終端顯示的錯誤。

### 自訂工具位置與適用範圍

通常在建置後 `source ./setup.sh` 即可。已有其他建置時，可以明確指定工具：

```bash
LLVM_BIN=/path/to/matching-llvm/bin \
WPA=/path/to/matching-svf/bin/wpa \
NODE=/path/to/node \
EXTAPI=/path/to/matching-svf/lib/extapi.bc \
bash tools/pag-svg/pag.sh /path/to/program.c /path/to/output
```

上述 `/path/to/...` 請替換為自己的實際路徑。`LLVM_BIN` 優先於 `LLVM_DIR/bin`；
兩者皆未設定時使用 PATH 中的 Clang / opt。`WPA` 未設定時，會尋找本倉庫的
`Release-build/bin/wpa`、`build/bin/wpa`、`Debug-build/bin/wpa`，再尋找 PATH。
`NODE` 未設定時使用 PATH 中的 `node`。
腳本也會尋找 WPA 執行檔旁 `../lib/extapi.bc` 的外部函式模型；若使用 wrapper 或自訂
安裝位置，可以用 `EXTAPI` 指定**同一份 SVF 建置**產生的 `extapi.bc`。
找不到時，WPA 仍會使用自己的標準搜尋規則。

本腳本適合可獨立編譯的**單一 C translation unit**，不會執行 C 程式本身。
多檔案專案需額外整合建置設定與 LLVM IR；外部函式的實作也需要提供給分析工具。
本教學輸出一般 PAG，並未執行 TZ-DATASHIELD 的敏感資料標註、切片或 compartment 分組。

查看完整參數：

```bash
bash tools/pag-svg/pag.sh --help
```
