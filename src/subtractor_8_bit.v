module subtractor_8_bit #(

// PARAMETERS :

parameter SUBTRACTOR_QUANTITY = 8,
parameter A_WIDTH = 8,
parameter B_WIDTH = 8,
parameter Subtract_WIDTH = 9,
parameter Cout_WIDTH = 8,
parameter Bout_WIDTH = 8

)(

// INPUTS :


input wire [A_WIDTH-1:0] A, // 8 Bitlik A girişi
input wire [B_WIDTH-1:0] B, // 8 Bitlik B girişi
input wire SUB,


// OUTPUTS :


output wire [Subtract_WIDTH-1:0]Subtract, // FullAdderların her birinin çıkışından çıkacak olan 8 bitlik çıkarma sonuçları
output wire Carry


);

 wire [Cout_WIDTH-1:0] Cout; // 8 Bit Cout
 wire [Bout_WIDTH-1:0] Bout; // 8 Bit Bout
	
genvar i;
 
generate // Full Addera giren B bitini SUB ile XOR yapmak için oluşturulan for döngüsü
     for(i = 0; i <= Bout_WIDTH; i = i + 1) begin 
	   assign Bout[i] = (SUB ^ B[i]);
	 end 
 endgenerate

 generate //Full Adderları bağlama
    for(i = 0; i < SUBTRACTOR_QUANTITY ; i = i + 1) begin 
	
	if(i == 0) begin
	
	full_adder FA (.A(A[i]), .B(Bout[i]), .Cin(0 ^ SUB), .S(Subtract[i]), .Cout(Cout[i]));
	 
	end
		
	else begin	
	
	full_adder FA (.A(A[i]), .B(Bout[i]), .Cin(Cout[i-1]), .S(Subtract[i]), .Cout(Cout[i])); 
	
	end
	
	end
 endgenerate
 
 assign Carry = SUB ^ Cout[SUBTRACTOR_QUANTITY-1];
 assign Subtract[Subtract_WIDTH-1] = Carry;
 
 endmodule