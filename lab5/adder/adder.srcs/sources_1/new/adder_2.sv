// 使用 SystemVerilog 自带的加法运算实现四位全加器

module adder_2 (
    input wire[3:0] A,
    input wire[3:0] B,
    input wire Cin,
    output wire [3:0] seg0,    // 输出：七段数码管低位
    output wire [1:0] seg1     // 输出：七段数码管高位
);

    wire[4:0] F;
    assign F = {1'b0, A} + {1'b0, B} + Cin;
    
    // 至此，F[4:0] 表示一个 [0, 31] 的整数
    // seg1 为高位 [0, 3]，seg0 为低位 [0, 9]
    
    assign seg1 = F / 10;
    assign seg0 = F % 10;

endmodule
