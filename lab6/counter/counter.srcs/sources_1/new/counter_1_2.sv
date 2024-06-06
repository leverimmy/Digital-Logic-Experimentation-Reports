// 使用时钟模块上的 1M 时钟，将计数器改成秒表；使用开关模块上的拨动开关控制秒表启动/暂停

module counter_1_2 (
    input wire CLK,             // 计数开关
    input wire RST,             // 复位开关
    input wire Switch,          // 启动/暂停开关
    output reg [6:0] High,      // 高位数码管输出
    output reg [6:0] Low        // 低位数码管输出
    );

    reg [3:0] cnt_H;
    reg [3:0] cnt_L;
    reg [30:0] cnt_total;

    always_ff @(posedge CLK or posedge RST) begin
        if (RST) begin // 按下复位开关，清零
            cnt_H <= 0;
            cnt_L <= 0;
            cnt_total <= 0;
        end else if (Switch) begin // 如果启动
            cnt_total <= cnt_total + 1;
            if (cnt_total == 999999) begin // 1MHz -> 1Hz 的计数转换
                cnt_L <= cnt_L + 1;
                cnt_total <= 0;
                if (cnt_L == 9) begin // 低位到高位的进位
                    cnt_H <= cnt_H + 1;
                    cnt_L <= 0;
                    if (cnt_H == 5) begin // 溢出清零
                        cnt_H <= 0;
                    end
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
