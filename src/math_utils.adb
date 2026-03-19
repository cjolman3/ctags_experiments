with Ada.Text_IO; use Ada.Text_IO;

package body Math_Utils is

   function Square (X : Integer) return Integer is
   begin
      return X * X;
   end Square;

   function Factorial (N : Natural) return Integer is
      Result : Integer := 1;
   begin
      for I in 2 .. N loop
         Result := Result * I;
      end loop;
      return Result;
   end Factorial;

   function Power (Base, Exp : Natural) return Integer is
      Result : Integer := 1;
   begin
      for I in 1 .. Exp loop
         Result := Result * Base;
      end loop;
      return Result;
   end Power;

   function Gcd (A, B : Positive) return Positive is
      X : Positive := A;
      Y : Positive := B;
      T : Positive;
   begin
      while Y /= X loop
         if X > Y then
            T := X - Y;
            X := Y;
            Y := T;
         else
            T := Y - X;
            Y := X;
            X := T;
         end if;
      end loop;
      return X;
   end Gcd;

   procedure Print_Result (Label : String; Value : Integer) is
   begin
      Put_Line ("[Ada] " & Label & " = " & Integer'Image (Value));
   end Print_Result;

end Math_Utils;
