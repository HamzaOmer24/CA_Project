`timescale 1ns / 1ps
//module tb_RISC_V_processor;
//   reg clk;
//   reg reset;
//   wire [63:0] pc_out;
//   wire [63:0] adder1_out;
//   wire [63:0] adder2_out;
//   wire [63:0] pc_in;
//   wire zero;
//   wire [31:0] instruction;
//   wire [6:0] opcode;
//   wire [4:0] rd;
//   wire [2:0] funct3;
//   wire [4:0] rs1;
//   wire [4:0] rs2;
//   wire [6:0] funct7;
//   wire [63:0] writedata;
//   wire [63:0] readdata1;
//   wire [63:0] readdata2;
//   wire branch, memread, memtoreg, memwrite, alusrc, regwrite;
//   wire [1:0] aluop;
//   wire [63:0] immdata;
//   wire [63:0] mux2out;
//   wire [3:0] operation;
//   wire [63:0] aluout;
//   wire [63:0] datamemoryreaddata;
//   wire [63:0] element1, element2, element3, element4, element5, element6, element7;
//   wire [63:0] ifidpc_out;
//   wire [31:0] ifidinst;
//   wire [4:0] idexrs1, idexrs2, idexrd;
//   wire idexmemwrite, idexregwrite;
//   wire [63:0] memwbreaddataout, memwbaluout;
//   RISC_V_processor r2(
//       .clk(clk),
//       .reset(reset),
//       .pc_out(pc_out),
//       .adder1_out(adder1_out),
//       .adder2_out(adder2_out),
//       .pc_in(pc_in),
//       .zero(zero),
//       .instruction(instruction),
//       .opcode(opcode),
//       .rd(rd),
//       .funct3(funct3),
//       .rs1(rs1),
//       .rs2(rs2),
//       .funct7(funct7),
//       .writedata(writedata),
//       .readdata1(readdata1),
//       .readdata2(readdata2),
//       .branch(branch),
//       .memread(memread),
//       .memtoreg(memtoreg),
//       .memwrite(memwrite),
//       .alusrc(alusrc),
//       .regwrite(regwrite),
//       .aluop(aluop),
//       .immdata(immdata),
//       .mux2out(mux2out),
//       .operation(operation),
//       .aluout(aluout),
//       .datamemoryreaddata(datamemoryreaddata),
//       .element1(element1),
//       .element2(element2),
//       .element3(element3),
//       .element4(element4),
//       .element5(element5),
//       .element6(element6),
//       .element7(element7),
//       .ifidpc_out(ifidpc_out),
//       .ifidinst(ifidinst),
//       .idexrs1(idexrs1),
//       .idexrs2(idexrs2),
//       .idexrd(idexrd),
//       .idexmemwrite(idexmemwrite),
//       .idexregwrite(idexregwrite),
//       .memwbreaddataout(memwbreaddataout),
//       .memwbaluout(memwbaluout)
//   );
//   initial begin
//       clk = 0;
//       forever #5 clk = ~clk;
//   end
//   initial begin
//       reset = 1;
//       #20 reset = 0;
//   end
//endmodule

module tb_RISC_V_processor();
    // Inputs
    reg clk;
    reg reset;

    // Outputs from processor
    wire [63:0] pc_out;
    wire [63:0] adder1_out;
    wire [63:0] adder2_out;
    wire [63:0] pc_in;
    wire zero;
    wire [31:0] instruction;
    wire [6:0] opcode;
    wire [4:0] rd;
    wire [2:0] funct3;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [6:0] funct7;
    wire [63:0] writedata;
    wire [63:0] readdata1;
    wire [63:0] readdata2;
    wire branch;
    wire memread;
    wire memtoreg;
    wire memwrite;
    wire alusrc;
    wire regwrite;
    wire [1:0] aluop;
    wire [63:0] immdata;
    wire [63:0] mux2out;
    wire [3:0] operation;
    wire [63:0] aluout;
    wire [63:0] datamemoryreaddata;

    // Memory elements
    wire [63:0] element1, element2, element3, element4, element5, element6, element7;

    // Pipeline registers
    wire [63:0] ifidpc_out;
    wire [31:0] ifidinst;
    wire [4:0] idexrs1, idexrs2, idexrd;
    wire idexmemwrite, idexregwrite;

    // WB stage
    wire [63:0] memwbreaddataout, memwbaluout;

    // Instantiate the processor
    RISC_V_processor r2 (
        .clk(clk),
        .reset(reset),
        .pc_out(pc_out),
        .adder1_out(adder1_out),
        .adder2_out(adder2_out),
        .pc_in(pc_in),
        .zero(zero),
        .instruction(instruction),
        .opcode(opcode),
        .rd(rd),
        .funct3(funct3),
        .rs1(rs1),
        .rs2(rs2),
        .funct7(funct7),
        .writedata(writedata),
        .readdata1(readdata1),
        .readdata2(readdata2),
        .branch(branch),
        .memread(memread),
        .memtoreg(memtoreg),
        .memwrite(memwrite),
        .alusrc(alusrc),
        .regwrite(regwrite),
        .aluop(aluop),
        .immdata(immdata),
        .mux2out(mux2out),
        .operation(operation),
        .aluout(aluout),
        .datamemoryreaddata(datamemoryreaddata),
        .element1(element1),
        .element2(element2),
        .element3(element3),
        .element4(element4),
        .element5(element5),
        .element6(element6),
        .element7(element7),
        .ifidpc_out(ifidpc_out),
        .ifidinst(ifidinst),
        .idexrs1(idexrs1),
        .idexrs2(idexrs2),
        .idexrd(idexrd),
        .idexmemwrite(idexmemwrite),
        .idexregwrite(idexregwrite),
        .memwbreaddataout(memwbreaddataout),
        .memwbaluout(memwbaluout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        reset = 1;
        #20;
        reset = 0;

        // Allow simulation to run for a while
        #200;
    end

endmodule
