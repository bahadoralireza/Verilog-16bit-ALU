`timescale 1ns/1ns
module tb_alu_structural();
    reg  signed [15:0] inM, inN;
    reg         [2:0]  opc;
    reg                inC;
    wire signed [15:0] outF;
    
    alu_structural dut (
        .inM(inM),
        .inN(inN),
        .opc(opc),
        .inC(inC),
        .outF(outF)
    );
    
    initial begin
        // Directed Tests (Part 2-a)
        inM = 10;  inN = 5;  inC = 1;  opc = 3'b000; #200; //16        
        inM = 10;  inN = 9;  inC = 0;  opc = 3'b001; #200; //13
        inM = 5;   inN = 0;  inC = 0;  opc = 3'b010; #200; //6
        inM = 5;   inN = 0;  inC = 0;  opc = 3'b011; #200; //15
        inM = 16'hAAAA;  inN = 16'h5555;  inC = 0;  opc = 3'b100; #200; //0x0000
        inM = 16'hAAAA;  inN = 16'h5555;  inC = 0;  opc = 3'b101; #200; //0xFFFF
        inM = 16'hAAAA;  inN = 0;  inC = 0;  opc = 3'b110; #200; //0x5555
        inM = 10;  inN = 5;  inC = 0;  opc = 3'b111; #200; //0
        
        repeat (50) begin
            inM = $random();
            inN = $random();
            inC = $random() % 2;
            opc = $random() % 8;
            #200;
        end
    end
endmodule