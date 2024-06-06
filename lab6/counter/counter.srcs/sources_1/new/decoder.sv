module decoder (
    // 数组 [r:l] 表示 a[r], a[r - 1], ..., a[l]
    // [x:0] 比 [0:x] 更普遍
    // 多维数组可以写为 [r2:l2][r1:l1]
    input wire [3:0] sw,    // 输入：开关
    output reg [6:0] seg    // 输出：七段数码管
    );

    // 适用于组合逻辑电路的 always 语句，重复执行
    always_comb begin
        case (sw)
            // sw 看作是 4 位 16 进制的值 0~F
            // seg 分别被赋值为 7 位 2 进制的值，对应译码器的功能表
            4'h0: seg = 7'b1111110;
            4'h1: seg = 7'b0110000;
            4'h2: seg = 7'b1101101;
            4'h3: seg = 7'b1111001;
            4'h4: seg = 7'b0110011;
            4'h5: seg = 7'b1011011;
            4'h6: seg = 7'b1011111;
            4'h7: seg = 7'b1110000;
            4'h8: seg = 7'b1111111;
            4'h9: seg = 7'b1110011;
            4'hA: seg = 7'b1110111;
            4'hB: seg = 7'b0011111;
            4'hC: seg = 7'b1001110;
            4'hD: seg = 7'b0111101;
            4'hE: seg = 7'b1001111;
            4'hF: seg = 7'b1000111;
            default: seg = 7'b0; // 其余情况则不显示
        endcase
    end
endmodule