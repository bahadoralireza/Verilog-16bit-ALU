`timescale 1ns/1ns

module tb;
reg signed [15:0] inM;
reg signed [15:0] inN;
reg inC;
reg [2:0] opc;
wire signed [15:0] outF;

alu_behavioral dut (
    .inM(inM),
    .inN(inN),
    .inC(inC),
    .opc(opc),
    .outF(outF)
);

integer i;
initial begin
    // Directed Tests
    inM = 10;  inN = 5;  inC = 1;  opc = 3'b000; #200; // 16
    inM = 10;  inN = 9;  inC = 0;  opc = 3'b001; #200; // 13
    inM = 10;  inN = 0;  inC = 0;  opc = 3'b010; #200; // 11
    inM = 10;  inN = 0;  inC = 0;  opc = 3'b011; #200; // 30
    inM = 12;  inN = 10; inC = 0;  opc = 3'b100; #200; // 8
    inM = 12;  inN = 10; inC = 0;  opc = 3'b101; #200; // 14
    inM = 12;  inN = 0;  inC = 0;  opc = 3'b110; #200;
    inM = 12;  inN = 0;  inC = 0;  opc = 3'b111; #200;
    // Random Tests
    repeat(100) begin
        inM = $random;
        inN = $random;
        inC = $random;
        opc = $random % 8;
        #200;
    end
end

endmodule