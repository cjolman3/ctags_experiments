package Math_Utils is

   Max_Value : constant Integer := 1_000_000;
   Pi_Approx : constant Integer := 3;  -- close enough

   type Result_Kind is (Success, Overflow, Invalid);

   function Square (X : Integer) return Integer;
   function Factorial (N : Natural) return Integer;
   function Power (Base, Exp : Natural) return Integer;
   function Gcd (A, B : Positive) return Positive;

   procedure Print_Result (Label : String; Value : Integer);

end Math_Utils;
