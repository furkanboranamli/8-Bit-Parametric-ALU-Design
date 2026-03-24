module tb_kare_alici_8_bit();

reg [7:0]A_tb;
reg [7:0]B_tb;

wire [15:0]Sonuc1_tb;
wire [15:0]Sonuc2_tb;





kare_alici_8_bit uut(

  .A(A_tb),
  .B(B_tb),
  .Sonuc1(Sonuc1_tb),
  .Sonuc2(Sonuc2_tb)


);


initial begin

#10;

repeat (20) begin

A_tb = $random;
B_tb = $random;


#10;

end



$finish;

end


endmodule


