module alu_behavioral2(
    input signed [15:0] inM, inN,
    input inC,
    input [2:0] opc,
    output reg signed [15:0] outF);

    always@(inM, inN, inC, opc) begin
	outF = 16'b0;
        case(opc)
            3'b000: outF = inM + inN + inC;
            3'b001: outF = inM + (inN / 3);
            3'b010: outF = inM + 16'b1;
            3'b011: outF = inM * 3;
            3'b100: outF = inM & inN;
            3'b101: outF = inM | inN;
            3'b110: outF = ~inM;
            default: outF = 16'd0;
        endcase
    end
endmodule