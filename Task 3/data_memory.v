`timescale 1ns / 1ps
module data_memory
  (input [63:0] Write_Data,
   input [63:0] Addr,
   input clk, Mem_Write, Mem_Read,
   output reg [63:0] Read_Data,
   output [63:0] v1,
   output [63:0] v2,
   output [63:0] v3,
   output [63:0] v4,
   output [63:0] v5,
   output [63:0] v6,
   output [63:0] v7,
   output [63:0] v8
);

  reg [7:0] Mem_Array [255:0];
  integer i;

  initial begin
    for (i = 0; i < 256; i = i + 1)
      Mem_Array[i] = 0;

    Mem_Array[0] = 8'd70;
    Mem_Array[8] = 8'd20;
    Mem_Array[16] = 8'd30;
    Mem_Array[24] = 8'd50;
    Mem_Array[32] = 8'd10;
    Mem_Array[40] = 8'd60;
    Mem_Array[48] = 8'd10;
  end

  assign v1 = {Mem_Array[7], Mem_Array[6], Mem_Array[5], Mem_Array[4],
               Mem_Array[3], Mem_Array[2], Mem_Array[1], Mem_Array[0]};
  assign v2 = {Mem_Array[15], Mem_Array[14], Mem_Array[13], Mem_Array[12],
               Mem_Array[11], Mem_Array[10], Mem_Array[9], Mem_Array[8]};
  assign v3 = {Mem_Array[23], Mem_Array[22], Mem_Array[21], Mem_Array[20],
               Mem_Array[19], Mem_Array[18], Mem_Array[17], Mem_Array[16]};
  assign v4 = {Mem_Array[31], Mem_Array[30], Mem_Array[29], Mem_Array[28],
               Mem_Array[27], Mem_Array[26], Mem_Array[25], Mem_Array[24]};
  assign v5 = {Mem_Array[39], Mem_Array[38], Mem_Array[37], Mem_Array[36],
               Mem_Array[35], Mem_Array[34], Mem_Array[33], Mem_Array[32]};
  assign v6 = {Mem_Array[47], Mem_Array[46], Mem_Array[45], Mem_Array[44],
               Mem_Array[43], Mem_Array[42], Mem_Array[41], Mem_Array[40]};
  assign v7 = {Mem_Array[55], Mem_Array[54], Mem_Array[53], Mem_Array[52],
               Mem_Array[51], Mem_Array[50], Mem_Array[49], Mem_Array[48]};
  assign v8 = {Mem_Array[63], Mem_Array[62], Mem_Array[61], Mem_Array[60],
               Mem_Array[59], Mem_Array[58], Mem_Array[57], Mem_Array[56]};

  always @(*) begin
    if (Mem_Read) begin
      Read_Data[7:0]    = Mem_Array[Addr + 0];
      Read_Data[15:8]   = Mem_Array[Addr + 1];
      Read_Data[23:16]  = Mem_Array[Addr + 2];
      Read_Data[31:24]  = Mem_Array[Addr + 3];
      Read_Data[39:32]  = Mem_Array[Addr + 4];
      Read_Data[47:40]  = Mem_Array[Addr + 5];
      Read_Data[55:48]  = Mem_Array[Addr + 6];
      Read_Data[63:56]  = Mem_Array[Addr + 7];
    end
  end

  always @(posedge clk) begin
    if (Mem_Write) begin
      Mem_Array[Addr + 0] = Write_Data[7:0];
      Mem_Array[Addr + 1] = Write_Data[15:8];
      Mem_Array[Addr + 2] = Write_Data[23:16];
      Mem_Array[Addr + 3] = Write_Data[31:24];
      Mem_Array[Addr + 4] = Write_Data[39:32];
      Mem_Array[Addr + 5] = Write_Data[47:40];
      Mem_Array[Addr + 6] = Write_Data[55:48];
      Mem_Array[Addr + 7] = Write_Data[63:56];
    end
  end
endmodule


