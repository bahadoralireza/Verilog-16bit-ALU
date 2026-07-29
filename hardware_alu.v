// Structural ALU with Hardware Sharing
module alu_structural(
    input  signed [15:0] inM, inN,
    input         [2:0]  opc,
    input                inC,
    output signed [15:0] outF
);

    // Shared Hardware Components
    // 1. Shared Adder - used for ADD, DIV3, INC, MUL3
    wire signed [15:0] adder_output;
    assign adder_output = inM + inN + inC;
    
    // 2. Shifter + Adder for MUL3: inM * 3 = (inM << 1) + inM
    wire signed [15:0] mul3_output;
    assign mul3_output = (inM << 1) + inM;
    
    // 3. Approximate DIV3 using shifts: inN / 3 ≈ (inN >> 2) + (inN >> 4) + (inN >> 6)
    wire signed [15:0] div3_output;
    assign div3_output = (inN >>> 2) + (inN >>> 4) + (inN >>> 6);
    
    // 4. Logic Unit
    wire signed [15:0] and_output;
    wire signed [15:0] or_output;
    wire signed [15:0] not_output;
    
    assign and_output = inM & inN;
    assign or_output  = inM | inN;
    assign not_output = ~inM;
    
    // 5. Increment: inM + 1
    wire signed [15:0] inc_output;
    assign inc_output = inM + 16'd1;

    // Output Multiplexer (MUX) - Selects result based on opcode
    assign outF = (opc == 3'b000) ? adder_output :
                  (opc == 3'b001) ? inM + div3_output :
                  (opc == 3'b010) ? inc_output :
                  (opc == 3'b011) ? mul3_output :
                  (opc == 3'b100) ? and_output :
                  (opc == 3'b101) ? or_output :
                  (opc == 3'b110) ? not_output :
                  16'd0;
endmodule