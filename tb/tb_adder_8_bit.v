module tb_adder_8_bit();


reg  [7:0] A_TB;
reg  [7:0] B_TB;
reg        Cin_TB;

wire [8:0] Sum_TB;  
wire       Carry_TB;


adder_8_bit uut(

  .A(A_TB)   ,
  .B(B_TB)   ,
  .Cin(Cin_TB) ,
  .Sum(Sum_TB) ,
  .Carry(Carry_TB)
   

);

initial begin
    A_TB = 0;
    B_TB = 0;
    Cin_TB = 0;

    #10;

    repeat (20) begin
        A_TB   = $random;
        B_TB   = $random;
        Cin_TB = $random;
        #10;
    end

    $finish;
end



endmodule







