package body Concurrent_Math is

   protected body Safe_Accumulator is

      procedure Add (Value : Integer) is
      begin
         Acc := Acc + Value;
      end Add;

      procedure Reset is
      begin
         Acc := 0;
      end Reset;

      function Total return Integer is
      begin
         return Acc;
      end Total;

      entry Wait_Positive when Acc > 0 is
      begin
         null;
      end Wait_Positive;

   end Safe_Accumulator;

   task body Fib_Worker is
      N_Val : Integer;

      function Compute_Fib (N : Integer) return Integer is
         A, B, C : Integer;
      begin
         if N <= 1 then return N; end if;
         A := 0; B := 1;
         for I in 2 .. N loop
            C := A + B;
            A := B;
            B := C;
         end loop;
         return B;
      end Compute_Fib;

   begin
      accept Start (N : Integer) do
         N_Val := N;
      end Start;
      accept Get_Result (R : out Integer) do
         R := Compute_Fib (N_Val);
      end Get_Result;
   end Fib_Worker;

end Concurrent_Math;
