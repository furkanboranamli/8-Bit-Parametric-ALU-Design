module tb_subtractor_8_bit();

reg [7:0]A_tb;
reg [7:0]B_tb;
reg SUB_tb;
wire [8:0]Subtract_tb;
wire Carry_tb;


subtractor_8_bit uut(

                        .A(A_tb)      ,
                        .B(B_tb)      ,
                        .SUB(SUB_tb)    ,
						.Subtract(Subtract_tb) ,
                        .Carry(Carry_tb)
                     );



initial begin


A_tb = 0;
B_tb = 0;
SUB_tb = 0;
#10;

repeat (20) begin

A_tb = $random;
B_tb = $random;
SUB_tb = $random;

#10;

end

$finish;

end 



endmodule