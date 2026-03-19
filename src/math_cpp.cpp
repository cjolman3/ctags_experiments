#include "math_cpp.h"
#include <cstdio>

int cpp_add(int a, int b) {
    return a + b;
}

int cpp_multiply(int a, int b) {
    return a * b;
}

int cpp_fibonacci(int n) {
    if (n <= 1) return n;
    int a = 0, b = 1;
    for (int i = 2; i <= n; i++) {
        int c = a + b;
        a = b;
        b = c;
    }
    return b;
}

/* Calls back into Ada via pragma Export symbols */
void cpp_demo(void) {
    printf("[C++] Calling back into Ada via exported symbols...\n");

    int sq = ada_square(7);
    printf("[C++] ada_square(7)    = %d\n", sq);

    int fact = ada_factorial(6);
    printf("[C++] ada_factorial(6) = %d\n", fact);

    int combined = cpp_add(ada_square(3), ada_factorial(4));
    printf("[C++] cpp_add(ada_square(3), ada_factorial(4)) = %d\n", combined);
}
