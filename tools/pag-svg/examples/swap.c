/* A small pointer-swap exercise based on the SVF tutorial.
 * The character objects stay in place; only the pointers are exchanged.
 */
void swap(char **p, char **q) {
    char *t = *p;
    *p = *q;
    *q = t;
}

int main(void) {
    char a1 = 'A';
    char b1 = 'B';
    char *a = &a1;
    char *b = &b1;
    swap(&a, &b);
    return (*a == 'B' && *b == 'A') ? 0 : 1;
}
