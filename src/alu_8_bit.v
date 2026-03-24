// =============================================================
//  8-BIT ALU - TOP MODULE
//  Alt Modüller : adder_8_bit, subtractor_8_bit,
//                 comparator_8_bit, kare_alici_8_bit
//
//  ALU_SEL :
//   3'b000  -> Toplama       : ALU_OUT = A + B
//   3'b001  -> Çıkarma       : ALU_OUT = A - B
//   3'b010  -> Karşılaştırma : ALU_OUT[2:0] = {A>B, A<B, A==B}
//   3'b011  -> Kare Alma     : Sonuc1 = A^2  |  Sonuc2 = B^2
//   default -> Çıkış sıfır
// =============================================================

module alu_8_bit #(
    parameter WIDTH = 8
)(
    // Girişler
    input  wire [WIDTH-1:0] A,
    input  wire [WIDTH-1:0] B,
    input  wire             Cin,
    input  wire [2:0]       ALU_SEL,

    // Genel çıkış
    output reg  [WIDTH:0]   ALU_OUT,
    output reg              Carry_Out,

    // Karşılaştırıcı çıkışları
    output wire             A_greater,
    output wire             A_less,
    output wire             A_equal,

    // Kare alıcı çıkışları
    output wire [2*WIDTH-1:0] Sonuc1,   // A^2
    output wire [2*WIDTH-1:0] Sonuc2    // B^2
);

// ─── İç teller ───────────────────────────────────────────────
wire [WIDTH:0]  add_sum;
wire            add_carry;
wire [WIDTH:0]  sub_result;
wire            sub_carry;

// ─── Adder ───────────────────────────────────────────────────
adder_8_bit #(
    .ADDER_QUANTITY (WIDTH),
    .A_WIDTH        (WIDTH),
    .B_WIDTH        (WIDTH),
    .SUM_WIDTH      (WIDTH+1)
) u_adder (
    .A     (A),
    .B     (B),
    .Cin   (Cin),
    .Sum   (add_sum),
    .Carry (add_carry)
);

// ─── Subtractor ──────────────────────────────────────────────
subtractor_8_bit #(
    .SUBTRACTOR_QUANTITY (WIDTH),
    .A_WIDTH             (WIDTH),
    .B_WIDTH             (WIDTH),
    .Subtract_WIDTH      (WIDTH+1),
    .Cout_WIDTH          (WIDTH),
    .Bout_WIDTH          (WIDTH)
) u_subtractor (
    .A        (A),
    .B        (B),
    .SUB      (1'b1),
    .Subtract (sub_result),
    .Carry    (sub_carry)
);

// ─── Comparator ──────────────────────────────────────────────
comparator_8_bit #(
    .WIDTH (WIDTH)
) u_comparator (
    .A         (A),
    .B         (B),
    .A_greater (A_greater),
    .A_less    (A_less),
    .A_equal   (A_equal)
);

// ─── Kare Alıcı ──────────────────────────────────────────────
kare_alici_8_bit #(
    .WIDTH (WIDTH)
) u_kare (
    .A      (A),
    .B      (B),
    .Sonuc1 (Sonuc1),
    .Sonuc2 (Sonuc2)
);

// ─── ALU Seçim Mantığı ───────────────────────────────────────
always @(*) begin
    ALU_OUT   = {(WIDTH+1){1'b0}};
    Carry_Out = 1'b0;

    case (ALU_SEL)
        3'b000: begin  // TOPLAMA
            ALU_OUT   = add_sum;
            Carry_Out = add_carry;
        end
        3'b001: begin  // ÇIKARMA
            ALU_OUT   = sub_result;
            Carry_Out = sub_carry;
        end
        3'b010: begin  // KARŞILAŞTIRMA
            ALU_OUT   = {6'b0, A_greater, A_less, A_equal};
            Carry_Out = 1'b0;
        end
        3'b011: begin  // KARE ALMA (Sonuc1/Sonuc2 tellerinden okunur)
            ALU_OUT   = {(WIDTH+1){1'b0}};
            Carry_Out = 1'b0;
        end
        default: begin
            ALU_OUT   = {(WIDTH+1){1'b0}};
            Carry_Out = 1'b0;
        end
    endcase
end

endmodule