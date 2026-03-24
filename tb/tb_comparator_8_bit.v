module tb_comparator_8_bit();

reg [7:0]A_tb;
reg [7:0]B_tb;

wire A_greater_tb;
wire A_less_tb;
wire A_equal_tb;

comparator_8_bit uut(

    .A(A_tb)              ,
    .B(B_tb)              ,
    .A_greater(A_greater_tb)    ,
    .A_less(A_less_tb)    ,
    .A_equal(A_equal_tb)    

);


initial begin

A_tb = 0;
B_tb = 0;

#10;



repeat(20) begin


 A_tb = $random;
 B_tb = $random;



#10;
end

$finish;

end


endmodule