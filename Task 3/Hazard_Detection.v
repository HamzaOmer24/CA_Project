module Hazard_Detection
  (
    input Mem_Read,
    input [4:0] rd,
    input [31:0] Inst,
    output reg Stall
  );
  
  initial
    begin
      Stall = 1'b0;
    end
  
  always @(*)
    begin
      if (Mem_Read == 1'b1 && ((rd == Inst[19:15]) || (rd == Inst[24:20])))
        Stall = 1'b1;
      else
        Stall = 1'b0;
    end
endmodule
