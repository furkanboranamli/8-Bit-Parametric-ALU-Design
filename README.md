***ENGLISH***


# 8-Bit ALU — Verilog Implementation

This project implements an 8-bit Arithmetic Logic Unit (ALU) in Verilog. The ALU is designed as a top module that integrates four submodules, each responsible for a specific operation.

## Submodules

**adder_8_bit** is a ripple carry adder built from full adder instances. It takes two 8-bit inputs and a carry-in, producing a 9-bit sum and a carry-out.

**subtractor_8_bit** performs binary subtraction using the two's complement method. It is also built from full adder instances and uses a SUB control signal to invert the B input before addition.

**comparator_8_bit** compares two 8-bit unsigned values and produces three output flags: A_greater, A_less, and A_equal.

**kare_alici_8_bit** computes the square of both inputs independently using a shift-and-add algorithm, producing two 16-bit results: Sonuc1 for A² and Sonuc2 for B².

## Top Module — alu_8_bit

The top module connects all four submodules under a single interface. The active operation is selected via the 3-bit ALU_SEL signal.

| ALU_SEL | Operation |
|---------|-----------|
| 3'b000 | Addition (A + B) |
| 3'b001 | Subtraction (A - B) |
| 3'b010 | Comparison (A vs B) |
| 3'b011 | Square (A² and B²) |

## Simulation

A testbench is included that tests all four operations sequentially for multiple input pairs. For each pair, SEL is applied from 0 to 3 in order before moving to the next pair. The simulation was run using Vivado.

## Parametric Design

All modules in this project are designed parametrically. Each module defines its own parameters — for example, adder_8_bit has separate A_WIDTH, B_WIDTH, SUM_WIDTH, and ADDER_QUANTITY parameters, while subtractor_8_bit similarly has A_WIDTH, B_WIDTH, Subtract_WIDTH, Cout_WIDTH, and Bout_WIDTH. The comparator and square modules use a single WIDTH parameter. This approach offers several advantages. Each module's bit widths can be adjusted independently without modifying any internal logic. The same modules can be reused in different projects with different configurations without rewriting any code. Parametric design also makes the code more readable and maintainable, and reduces the risk of errors when scaling the design up or down.

## Dependencies

The adder and subtractor submodules depend on a **full_adder** module which must be included in the project. The full adder takes A, B, and Cin as inputs and produces S (sum) and Cout (carry-out). The comparator and square modules operate independently without requiring full_adder.





***TURKISH***


# 8-Bit ALU — Verilog ile Tasarım

Bu proje, Verilog kullanılarak tasarlanmış 8-bit bir Aritmetik Mantık Birimidir (ALU). ALU, her biri belirli bir işlemi gerçekleştiren dört alt modülün bir top modül altında birleştirilmesiyle oluşturulmuştur.

## Alt Modüller

**adder_8_bit**, full adder örneklerinden oluşturulmuş bir ripple carry toplayıcıdır. İki adet 8-bit giriş ve bir carry-in alarak 9-bit toplam ve carry-out üretir.

**subtractor_8_bit**, ikiye tümleyen yöntemiyle binary çıkarma işlemi gerçekleştirir. Full adder örneklerinden oluşur ve B girişini terslemek için SUB kontrol sinyalini kullanır.

**comparator_8_bit**, iki adet 8-bit işaretsiz değeri karşılaştırır ve üç çıkış bayrağı üretir: A_greater, A_less ve A_equal.

**kare_alici_8_bit**, her iki girişin karesini kaydır ve topla algoritmasıyla bağımsız olarak hesaplar. A² için Sonuc1 ve B² için Sonuc2 olmak üzere iki adet 16-bit sonuç üretir.

## Top Modül — alu_8_bit

Top modül, dört alt modülün tamamını tek bir arayüz altında birbirine bağlar. Aktif işlem, 3-bit ALU_SEL sinyali ile seçilir.

| ALU_SEL | İşlem |
|---------|-------|
| 3'b000 | Toplama (A + B) |
| 3'b001 | Çıkarma (A - B) |
| 3'b010 | Karşılaştırma (A ile B) |
| 3'b011 | Kare Alma (A² ve B²) |

## Simülasyon

Birden fazla giriş çifti için dört işlemin sırayla test edildiği bir testbench eklenmiştir. Her çift için SEL sinyali 0'dan 3'e sırasıyla uygulanır ve ardından bir sonraki çifte geçilir. Simülasyon Vivado üzerinde gerçekleştirilmiştir.

## Parametrik Tasarım

Bu projedeki tüm modüller parametrik olarak tasarlanmıştır. Her modül kendi parametrelerini tanımlar. Örneğin adder_8_bit modülünde A_WIDTH, B_WIDTH, SUM_WIDTH ve ADDER_QUANTITY parametreleri ayrı ayrı tanımlanmışken, subtractor_8_bit modülünde benzer şekilde A_WIDTH, B_WIDTH, Subtract_WIDTH, Cout_WIDTH ve Bout_WIDTH parametreleri bulunur. Karşılaştırıcı ve kare alıcı modüller ise tek bir WIDTH parametresi kullanır. Bu yaklaşımın çeşitli avantajları vardır. Her modülün bit genişlikleri, iç mantık üzerinde herhangi bir değişiklik yapılmadan bağımsız olarak ayarlanabilir. Aynı modüller, herhangi bir kod yeniden yazılmadan farklı konfigürasyonlarla farklı projelerde tekrar kullanılabilir. Parametrik tasarım aynı zamanda kodun okunabilirliğini ve bakımını kolaylaştırır, tasarımı büyütürken veya küçültürken hata riskini de azaltır.

## Gerekli Modüller

Toplayıcı ve çıkarıcı alt modülleri, projeye dahil edilmesi gereken bir **full_adder** modülüne bağımlıdır. Full adder, A, B ve Cin girişlerini alarak S (toplam) ve Cout (carry-out) çıkışları üretir. Karşılaştırıcı ve kare alıcı modüller ise full adder gerektirmeden bağımsız olarak çalışır.
