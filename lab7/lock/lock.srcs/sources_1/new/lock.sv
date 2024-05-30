module lock(
    input wire[3:0] inputs,
    input wire mode,
    input wire CLK,
    input wire RST,
    output reg acc,
    output reg rej,
    output reg alert,
    output reg[2:0] state
);

    parameter[15:0] root_pwd = 16'hFFFF;
    reg[15:0] pwd = root_pwd;
    reg[15:0] token;
    reg[2:0] next_state;
    reg[2:0] cnt;
    
    always_ff @(posedge CLK or posedge RST) begin
        if (RST) begin
            state <= 0;
            acc = 0;
            rej = 0;
        end else begin
            case (state)
                0: token[3:0] <= inputs;
                1: token[7:4] <= inputs;
                2: token[11:8] <= inputs;
                3: token[15:12] <= inputs;
                default: ;
            endcase
            state <= next_state;
            
            if (state == 4) begin
                if (mode) begin // 如果是验证
                    if (!alert) begin // 密码锁没有被锁定
                        if (token == pwd || token == root_pwd) begin
                            acc = 1;
                            rej = 0;
                            cnt = 0;
                        end else begin // 密码错误
                            acc = 0;
                            rej = 1;
                            cnt = cnt + 1;
                        end
                    end else begin // 密码锁被锁定
                        if (token == root_pwd) begin
                            acc = 1;
                            rej = 0;
                            cnt = 0;
                        end else begin
                            acc = 0;
                            rej = 0;
                        end
                    end
                end else begin // 如果是设置
                    if (!alert) begin // 密码锁没有被锁定
                        pwd = token;
                    end
                end
            end else begin
                acc = 0;
                rej = 0;
            end
        end
    end
    
    always_comb begin
        case (state)
            0: next_state <= 1;
            1: next_state <= 2;
            2: next_state <= 3;
            3: next_state <= 4;
            4: next_state <= 0;
            default: next_state <= 0;
        endcase
    end
    
    always_comb begin
        if (cnt >= 3)
            alert <= 1;
        else
            alert <= 0;
    end

endmodule
