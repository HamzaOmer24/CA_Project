module IFID
  (
    input clk,
    input reset,
    input [31:0] Inst,
    input [63:0] var,
    input Flush, 
    input IFID_Write, 
    output reg [31:0] Inst_Out,//instruction out,
    output reg [63:0] Var_Out
  );
  always @(posedge clk)
    begin
      if (reset == 1'b1 || Flush == 1'b1)
        begin
          Inst_Out = 32'b0;
          Var_Out = 64'b0;
        end
      else if (IFID_Write == 1'b0)
        begin
          Inst_Out = Inst;
          Var_Out = var;
        end
    end
endmodule