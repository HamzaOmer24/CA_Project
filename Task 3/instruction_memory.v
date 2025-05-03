`timescale 1ns / 1ps
module instruction_memory(
  input [63:0] I_Addr,
  output reg [31:0] Inst
);
  reg [7:0] I_Mem[87:0];

  initial begin
    {I_Mem[3], I_Mem[2], I_Mem[1], I_Mem[0]} = 32'h00000913; //1
    {I_Mem[7], I_Mem[6], I_Mem[5], I_Mem[4]} = 32'h00000433; //2
    {I_Mem[11], I_Mem[10], I_Mem[9], I_Mem[8]} = 32'h04b40863; //3
    {I_Mem[15], I_Mem[14], I_Mem[13], I_Mem[12]} = 32'h00800eb3; //4
    {I_Mem[19], I_Mem[18], I_Mem[17], I_Mem[16]} = 32'h000409b3; //5
    {I_Mem[23], I_Mem[22], I_Mem[21], I_Mem[20]} = 32'h013989b3; //6
    {I_Mem[27], I_Mem[26], I_Mem[25], I_Mem[24]} = 32'h013989b3; //7
    {I_Mem[31], I_Mem[30], I_Mem[29], I_Mem[28]} = 32'h013989b3; //8
    {I_Mem[35], I_Mem[34], I_Mem[33], I_Mem[32]} = 32'h02be8663; //9
    {I_Mem[39], I_Mem[38], I_Mem[37], I_Mem[36]} = 32'h001e8e93; //10
    {I_Mem[43], I_Mem[42], I_Mem[41], I_Mem[40]} = 32'h00898993; //11
    {I_Mem[47], I_Mem[46], I_Mem[45], I_Mem[44]} = 32'h00093d03; //12
    {I_Mem[51], I_Mem[50], I_Mem[49], I_Mem[48]} = 32'h0009bd83; //13
    {I_Mem[55], I_Mem[54], I_Mem[53], I_Mem[52]} = 32'h01bd4463; //14
    {I_Mem[59], I_Mem[58], I_Mem[57], I_Mem[56]} = 32'hfe0004e3; //15
    {I_Mem[63], I_Mem[62], I_Mem[61], I_Mem[60]} = 32'h01a002b3; //16
    {I_Mem[67], I_Mem[66], I_Mem[65], I_Mem[64]} = 32'h01b93023; //17
    {I_Mem[71], I_Mem[70], I_Mem[69], I_Mem[68]} = 32'h0059b023; //18
    {I_Mem[75], I_Mem[74], I_Mem[73], I_Mem[72]} = 32'hfc000ce3; //19
    {I_Mem[79], I_Mem[78], I_Mem[77], I_Mem[76]} = 32'h00140413; //20
    {I_Mem[83], I_Mem[82], I_Mem[81], I_Mem[80]} = 32'h00890913; //21
    {I_Mem[87], I_Mem[86], I_Mem[85], I_Mem[84]} = 32'hfa000ae3; //22
  end

  always @(I_Addr) begin
    Inst[7:0] = I_Mem[I_Addr + 0];
    Inst[15:8] = I_Mem[I_Addr + 1];
    Inst[23:16] = I_Mem[I_Addr + 2];
    Inst[31:24] = I_Mem[I_Addr + 3];
  end
endmodule