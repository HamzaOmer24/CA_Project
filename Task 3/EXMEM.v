module EXMEM(
  input clk, reset,
  input [63:0] Adder_Out,          // adder output
  input [63:0] ALU_Result,         // 64-bit ALU output
  input Zero_In,                   // ALU Zero flag
  input [63:0] Write_Data_In,      // Write data from previous stage
  input [4:0] rd_In,               // Destination register
  input Branch_In, Mem_Read_In, MemToReg_In, Mem_Write_In, Reg_Write_in, // Control signals
  input flush,                     // Pipeline flush
  input addermuxselect_in,         // Mux select input

  output reg [63:0] Adderout,
  output reg zero,
  output reg [63:0] result_out_alu,
  output reg [63:0] writedata_out,
  output reg [4:0] rd,
  output reg Branch, Memread, Memtoreg, Memwrite, Regwrite,
  output reg addermuxselect
);

  always @(posedge clk) begin
    if (reset == 1'b1 || flush == 1'b1) begin
      Adderout = 64'b0;
      zero = 1'b0;
      result_out_alu = 64'b0;
      writedata_out = 64'b0;
      rd = 5'b0;
      Branch = 1'b0;
      Memread = 1'b0;
      Memtoreg = 1'b0;
      Memwrite = 1'b0;
      Regwrite = 1'b0;
      addermuxselect = 1'b0;
    end else begin
      Adderout = Adder_Out;
      zero = Zero_In;
      result_out_alu = ALU_Result;
      writedata_out = Write_Data_In;
      rd = rd_In;
      Branch = Branch_In;
      Memread = Mem_Read_In;
      Memtoreg = MemToReg_In;
      Memwrite = Mem_Write_In;
      Regwrite = Reg_Write_in;
      addermuxselect = addermuxselect_in;
    end
  end

endmodule
