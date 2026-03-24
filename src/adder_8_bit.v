module adder_8_bit #(
    parameter ADDER_QUANTITY = 8,
    parameter A_WIDTH = 8,
    parameter B_WIDTH = 8,
    parameter SUM_WIDTH = 9
)(
    input  wire [A_WIDTH-1:0] A,
    input  wire [B_WIDTH-1:0] B,
    input  wire Cin,
    output wire [SUM_WIDTH-1:0] Sum,
    output wire Carry
);

  wire [ADDER_QUANTITY:0] C;

assign C[0] = Cin;

genvar i;
generate
    for (i = 0; i < ADDER_QUANTITY; i = i + 1) begin
        full_adder FA (
            .A(A[i]),
            .B(B[i]),
            .Cin(C[i]),
            .S(Sum[i]),
            .Cout(C[i+1])
        );
    end
endgenerate

assign Carry = C[ADDER_QUANTITY];
assign Sum[SUM_WIDTH-1] = Carry;
   
   
   
   
endmodule







