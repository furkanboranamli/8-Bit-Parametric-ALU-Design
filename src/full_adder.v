module full_adder (

//INPUTS:

input       A,
input       B,
input       Cin,      

//OUTPUTS:

output      S,
output      Cout

);

wire [2:0]w_wire;

assign w_wire[0] = A ^ B;
assign w_wire[1] = A & B;
assign w_wire[2] = w_wire[0] & Cin;
assign S = w_wire[0] ^ Cin;
assign Cout = w_wire[2] | w_wire[1];



endmodule