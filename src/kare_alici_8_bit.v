module kare_alici_8_bit #(

parameter WIDTH = 8



)(


input wire [WIDTH-1:0]A,
input wire [WIDTH-1:0]B,


output reg [2*WIDTH-1:0]Sonuc1,
output reg [2*WIDTH-1:0]Sonuc2



);


integer i;


always @(*) begin

Sonuc1 = 0;
Sonuc2= 0;

for(i = 0; i < WIDTH; i = i + 1)begin

if(A[i]) begin

Sonuc1 = Sonuc1 + (A << i);

end
end

for(i = 0; i < WIDTH; i = i + 1)begin

if(B[i]) begin

Sonuc2 = Sonuc2 + (B << i);

end
end


end

endmodule