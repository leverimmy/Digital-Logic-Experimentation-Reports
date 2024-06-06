module traffic(
    input wire CLK,
    input wire RST,
    input wire Switch,
    input wire Rush,
    output reg[3:0] Car,
    output reg[1:0] Ped,
    output reg LED1,
    output reg LED2
    );
    
    reg [30:0] cnt_total;
    reg mode, first_time;
    
    always_ff @(posedge CLK or posedge RST) begin
        if (RST) begin // 按下复位开关，清零
            Car <= 9;
            Ped <= 0;
            cnt_total <= 0;
            mode <= 0;
            first_time <= 1;
            LED1 <= 1;
            LED2 <= 0;
        end else if (Switch) begin
            cnt_total <= cnt_total + 1;
            if (cnt_total == 999999) begin
                cnt_total <= 0;
                
                if (Rush && Car < 7) begin // 这是为什么？为什么不是 <6 呢？
                    mode <= 1;
                end else begin
                    mode <= 0;
                end
                
                if (mode == 0) begin
                    if (Car == 0) begin // 行人通行
                        if (Ped == 1) begin
                            Ped <= 0;
                            LED1 <= 1;
                            LED2 <= 0;
                            Car <= 9;
                        end else begin
                            Ped <= Ped - 1;
                            LED1 <= 0;
                            LED2 <= 1;
                        end
                    end else begin // 机动车通行
                        first_time <= 1;
                        if (Car == 1) begin
                            Car <= 0;
                            LED1 <= 0;
                            LED2 <= 1;
                            Ped <= 3;
                        end else begin
                            Car <= Car - 1;
                            LED1 <= 1;
                            LED2 <= 0;
                        end
                    end
                end else begin // 暂停
                    if (first_time) begin
                        Ped <= 3;
                        first_time <= 0;
                    end
                    if (Ped > 0) begin
                        Ped <= Ped - 1;
                    end
                    LED1 <= 0;
                    LED2 <= 1;
                end
            end
        end
    end
endmodule
