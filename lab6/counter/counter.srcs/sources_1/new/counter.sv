module counter (
    input wire CLK,             // 计数开关
    input wire RST,             // 复位开关
    output reg [6:0] High,      // 高位数码管输出
    output reg [6:0] Low        // 低位数码管输出
    );

    reg [3:0] cnt_H;
    reg [3:0] cnt_L;

    always_ff @(posedge CLK or posedge RST) begin
        if (RST) begin // 按下复位开关，清零
            cnt_H <= 0;
            cnt_L <= 0;
        end else begin
            cnt_L <= cnt_L + 1;
            if (cnt_L == 9) begin // 低位到高位的进位
                cnt_H <= cnt_H + 1;
                cnt_L <= 0;
                if (cnt_H == 5) begin // 溢出清零
                    cnt_H <= 0;
                end
            end
        end
    end

    decoder u1 (
        .sw(cnt_H),
        .seg(High)
    );

    decoder u2 (
        .sw(cnt_L),
        .seg(Low)
    );

endmodule
