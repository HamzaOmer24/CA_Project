module Pipeline_Flush
  (
    input Branch,
    output reg Flush
  );
  
  initial
    begin
      Flush = 1'b0;
    end
  
  always @(*)
    begin
      if (Branch == 1'b1)
        Flush = 1'b1;
      else
        Flush = 1'b0;
    end
  
endmodule
