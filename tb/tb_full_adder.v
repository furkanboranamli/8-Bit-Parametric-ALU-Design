module tb_full_adder();

reg A_TB        ;  
reg B_TB        ;  
reg Cin_TB      ; 

wire S_TB       ;
wire Cout_TB    ;


full_adder uut(

.A(A_TB),
.B(B_TB),
.Cin(Cin_TB),
.S(S_TB),
.Cout(Cout_TB)
);
initial begin                                                        

A_TB = 1'b0;        B_TB = 1'b0;         Cin_TB = 1'b0; #10; 
A_TB = 1'b0;        B_TB = 1'b0;         Cin_TB = 1'b1; #10;   
A_TB = 1'b0;        B_TB = 1'b1;         Cin_TB = 1'b0; #10; 
A_TB = 1'b0;        B_TB = 1'b1;         Cin_TB = 1'b1; #10;  
A_TB = 1'b1;        B_TB = 1'b0;         Cin_TB = 1'b0; #10; 
A_TB = 1'b1;        B_TB = 1'b0;         Cin_TB = 1'b1; #10;   
A_TB = 1'b1;        B_TB = 1'b1;         Cin_TB = 1'b0; #10; 
A_TB = 1'b1;        B_TB = 1'b1;         Cin_TB = 1'b1; #10;  
  
$finish;

end




endmodule



