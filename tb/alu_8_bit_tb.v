// =============================================================
//  8-BIT ALU - TESTBENCH
//
//  Akış : Bir sayı çifti al → SEL=0 (topla) → SEL=1 (çıkar)
//         → SEL=2 (karşılaştır) → SEL=3 (kare al)
//         → Sonraki çifte geç → tekrar et
// =============================================================

`timescale 1ns/1ps

module alu_8_bit_tb;

parameter WIDTH      = 8;
parameter CLK_PERIOD = 10;

// ─── DUT Girişleri ───────────────────────────────────────────
reg [WIDTH-1:0] A;
reg [WIDTH-1:0] B;
reg             Cin;
reg [2:0]       ALU_SEL;

// ─── DUT Çıkışları ───────────────────────────────────────────
wire [WIDTH:0]       ALU_OUT;
wire                 Carry_Out;
wire                 A_greater;
wire                 A_less;
wire                 A_equal;
wire [2*WIDTH-1:0]   Sonuc1;
wire [2*WIDTH-1:0]   Sonuc2;

// ─── DUT ─────────────────────────────────────────────────────
alu_8_bit #(.WIDTH(WIDTH)) DUT (
    .A         (A),
    .B         (B),
    .Cin       (Cin),
    .ALU_SEL   (ALU_SEL),
    .ALU_OUT   (ALU_OUT),
    .Carry_Out (Carry_Out),
    .A_greater (A_greater),
    .A_less    (A_less),
    .A_equal   (A_equal),
    .Sonuc1    (Sonuc1),
    .Sonuc2    (Sonuc2)
);

// ─── Test Görevi ─────────────────────────────────────────────
task test_cift;
    input [7:0] a_in;
    input [7:0] b_in;
    begin
        $display("─────────────────────────────────────────────────");
        $display("  A = %0d  |  B = %0d", a_in, b_in);
        $display("─────────────────────────────────────────────────");

        // SEL=0 : TOPLAMA
        A = a_in; B = b_in; Cin = 0; ALU_SEL = 3'b000;
        #CLK_PERIOD;
        $display("  SEL=0 | TOPLAMA       : %0d + %0d = %0d  (Carry=%0b)",
                  a_in, b_in, ALU_OUT, Carry_Out);

        // SEL=1 : ÇIKARMA
        ALU_SEL = 3'b001;
        #CLK_PERIOD;
        $display("  SEL=1 | CIKARMA       : %0d - %0d = %0d  (Borrow=%0b)",
                  a_in, b_in, ALU_OUT[WIDTH-1:0], Carry_Out);

        // SEL=2 : KARŞILAŞTIRMA
        ALU_SEL = 3'b010;
        #CLK_PERIOD;
        $display("  SEL=2 | KARSILASTIRMA : A>B=%0b  A<B=%0b  A==B=%0b",
                  A_greater, A_less, A_equal);

        // SEL=3 : KARE ALMA
        ALU_SEL = 3'b011;
        #CLK_PERIOD;
        $display("  SEL=3 | KARE ALMA     : %0d^2 = %0d  |  %0d^2 = %0d",
                  a_in, Sonuc1, b_in, Sonuc2);
    end
endtask

// ─── Test Akışı ──────────────────────────────────────────────
initial begin
    A = 0; B = 0; Cin = 0; ALU_SEL = 0;

    $display("=================================================");
    $display("        8-BIT ALU TESTBENCH BASLADI             ");
    $display("=================================================");
    #CLK_PERIOD;

    test_cift(8'd25,  8'd26 );   // Çift 1
    test_cift(8'd50,  8'd50 );   // Çift 2 : eşit
    test_cift(8'd10,  8'd80 );   // Çift 3 : A < B
    test_cift(8'd200, 8'd100);   // Çift 4 : carry/borrow
    test_cift(8'hFF,  8'hFF );   // Çift 5 : maksimum
    test_cift(8'd0,   8'd0  );   // Çift 6 : sıfırlar

    $display("=================================================");
    $display("        8-BIT ALU TESTBENCH TAMAMLANDI          ");
    $display("=================================================");
    #CLK_PERIOD;
    $finish;
end

initial begin
    $dumpfile("alu_8_bit_tb.vcd");
    $dumpvars(0, alu_8_bit_tb);
end

endmodule