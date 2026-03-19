#ifndef MATH_CPP_H
#define MATH_CPP_H

#ifdef __cplusplus
extern "C" {
#endif

/* Functions implemented in math_cpp.cpp, imported by Ada */
int  cpp_add(int a, int b);
int  cpp_multiply(int a, int b);
int  cpp_fibonacci(int n);
void cpp_demo(void);

/* Functions implemented in Ada (cpp_bridge.adb), called from C++ */
int ada_square(int x);
int ada_factorial(int n);

#ifdef __cplusplus
}
#endif

#endif /* MATH_CPP_H */
