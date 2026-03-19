with Ada.Text_IO;    use Ada.Text_IO;
with Math_Utils;
with Cpp_Bridge;
with Concurrent_Math;

procedure Main is
   Acc    : Concurrent_Math.Safe_Accumulator;
   Worker : Concurrent_Math.Fib_Worker;
   Fib_R  : Integer;
begin
   Put_Line ("=== Ada/C++ ctags test project ===");
   New_Line;

   -- Ada math
   Put_Line ("-- Ada Math --");
   Math_Utils.Print_Result ("Square(9)",       Math_Utils.Square (9));
   Math_Utils.Print_Result ("Factorial(7)",    Math_Utils.Factorial (7));
   Math_Utils.Print_Result ("Power(2, 10)",    Math_Utils.Power (2, 10));
   Math_Utils.Print_Result ("Gcd(48, 18)",     Math_Utils.Gcd (48, 18));
   New_Line;

   -- C++ functions called from Ada (via pragma Import)
   Put_Line ("-- C++ Math (called from Ada via pragma Import) --");
   Math_Utils.Print_Result ("cpp_add(13, 29)",      Cpp_Bridge.Cpp_Add (13, 29));
   Math_Utils.Print_Result ("cpp_multiply(6, 7)",   Cpp_Bridge.Cpp_Multiply (6, 7));
   Math_Utils.Print_Result ("cpp_fibonacci(10)",    Cpp_Bridge.Cpp_Fibonacci (10));
   New_Line;

   -- C++ calling back into Ada (via pragma Export)
   Put_Line ("-- C++ calling back into Ada (via pragma Export) --");
   Cpp_Bridge.Cpp_Demo;
   New_Line;

   -- Protected object accumulator
   Put_Line ("-- Concurrent: protected accumulator --");
   Acc.Add (10);
   Acc.Add (25);
   Acc.Add (5);
   Acc.Wait_Positive;   -- guard: Acc > 0, passes immediately
   Math_Utils.Print_Result ("Accumulator total", Acc.Total);
   Acc.Reset;
   Math_Utils.Print_Result ("After Reset", Acc.Total);
   New_Line;

   -- Task rendezvous: async fibonacci
   Put_Line ("-- Concurrent: task rendezvous fibonacci(10) --");
   Worker.Start (10);
   Worker.Get_Result (Fib_R);
   Math_Utils.Print_Result ("Fib_Worker result", Fib_R);
end Main;
