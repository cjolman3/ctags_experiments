-- Bridge package: Ada <-> C++ via C linkage.
-- ctags regex picks up the quoted C names from pragma Import/Export,
-- so jumping to e.g. "cpp_add" lands here AND on the C++ definition.
package Cpp_Bridge is

   -- Imported from C++ (math_cpp.cpp)
   function Cpp_Add (A, B : Integer) return Integer;
   pragma Import (C, Cpp_Add, "cpp_add");

   function Cpp_Multiply (A, B : Integer) return Integer;
   pragma Import (C, Cpp_Multiply, "cpp_multiply");

   function Cpp_Fibonacci (N : Integer) return Integer;
   pragma Import (C, Cpp_Fibonacci, "cpp_fibonacci");

   procedure Cpp_Demo;
   pragma Import (C, Cpp_Demo, "cpp_demo");

   -- Exported to C++ (bodies in cpp_bridge.adb)
   function Ada_Square (X : Integer) return Integer;
   pragma Export (C, Ada_Square, "ada_square");

   function Ada_Factorial (N : Integer) return Integer;
   pragma Export (C, Ada_Factorial, "ada_factorial");

end Cpp_Bridge;
