// 使用时钟模块上的 1M 时钟，将计数器改成秒表；使用开关模块上的拨动开关控制秒表启动/暂停

module detector (
    input wire CLK,                 // 保存开关
    input wire RST,                 // 复位开关
    input wire Mode,                // 模式开关
    input wire [5:0] Input,         // 数据输入
    output reg [6:0] Display,       // 高位数码管输出
    output reg LED1,
    output reg LED2
    );

    reg [5:0] seq;
    reg [30:0] cnt_total;

    always_ff @(posedge CLK or posedge RST) begin
        if (Mode) begin // 数据输入模式
            if (RST) begin // 按下复位开关，清零
                seq <= 6'b111111;
            end else if (CLK) begin
                seq <= Input;
            end

        end else begin // 数据显示模式
            if (CLK) begin
                cnt_total <= cnt_total + 1;
                LED1 <= seq[cnt_total];
            end

        end
    end

endmodule
