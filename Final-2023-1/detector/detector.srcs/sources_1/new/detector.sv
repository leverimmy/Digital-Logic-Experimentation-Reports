module detector (
    input wire CLK,                 // 保存开关
    input wire RST,                 // 复位开关
    input wire Mode,                // 模式开关
    input wire [5:0] Input,         // 数据输入
    output reg [2:0] Display,       // 数码管输出
    output reg LED1,
    output reg LED2
    );
    
    reg [5:0] seq;
    reg [30:0] cnt_total;
    
    always_ff @(posedge CLK or posedge RST) begin
        if (RST) begin // 按下复位开关，清零
            seq <= 31;
            cnt_total <= 0;
            LED1 <= 0;
            LED2 <= 0;
        end else begin
            if (Mode) begin // 数据输入模式
                seq <= Input;
                cnt_total <= 0;
                LED1 <= 0;
                LED2 <= 0;
            end else begin // 数据显示模式
                if (cnt_total < 6) begin
                    LED1 = seq[cnt_total];
                    if (cnt_total >= 2 && seq[cnt_total - 2] == 1 && seq[cnt_total - 1] == 1 && seq[cnt_total] == 1) begin
                        Display <= cnt_total;
                        LED2 <= 1;
                    end
                    cnt_total = cnt_total + 1;
                end else if (cnt_total == 6) begin
                    LED1 <= 0;
                end
            end
        end
    end

endmodule
