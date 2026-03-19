with Math_Utils;

package body Cpp_Bridge is

   function Ada_Square (X : Integer) return Integer is
   begin
      return Math_Utils.Square (X);
   end Ada_Square;

   function Ada_Factorial (N : Integer) return Integer is
   begin
      return Math_Utils.Factorial (N);
   end Ada_Factorial;

end Cpp_Bridge;
