module comparator_8_bit #(

parameter WIDTH = 8


)(

input wire [WIDTH-1:0] A,
input wire [WIDTH-1:0] B,

output wire A_greater,
output wire A_less   ,
output wire A_equal  

);

assign A_greater = (A > B)    ;
assign A_less =    (A < B)    ;
assign A_equal =   (A == B)   ;


endmodule