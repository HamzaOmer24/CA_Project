//TASK 3 TESTBENCH:
 
`timescale 1ns / 1ps
module tb_RISC_V_processor;
   reg clk;
   reg reset;
   wire [63:0] v1, v2, v3, v4, v5, v6, v7;
   RISC_V_Processor r3(
       .clk(clk),
       .reset(reset),
        .v1(v1),
        .v2(v2),
        .v3(v3),
        .v4(v4),
        .v5(v5),
        .v6(v6),
        .v7(v7),
        .v8(v8)
           );
   initial begin
       clk = 0;
       forever #5 clk = ~clk;
   end
   initial begin
       reset = 1;
       #20 reset = 0;
   end
endmodule
