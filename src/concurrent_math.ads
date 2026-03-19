package Concurrent_Math is

   -- Protected object: thread-safe accumulator
   protected type Safe_Accumulator is
      procedure Add (Value : Integer);
      procedure Reset;
      function Total return Integer;
      entry Wait_Positive;
   private
      Acc : Integer := 0;
   end Safe_Accumulator;

   -- Task type: computes fibonacci asynchronously via rendezvous
   task type Fib_Worker is
      entry Start (N : Integer);
      entry Get_Result (R : out Integer);
   end Fib_Worker;

end Concurrent_Math;
