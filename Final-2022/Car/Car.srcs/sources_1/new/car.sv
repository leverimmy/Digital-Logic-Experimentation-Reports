module car(
    input wire Switch,
    input wire CLK,
    input wire RST,
    output reg [3:0] Velo,
    output reg [2:0] Mode,
    input wire Chg,
    input wire Brk
    );
    
    reg [30:0] cnt_total;
    
    always_ff @(posedge CLK or posedge RST) begin
        if (RST) begin // 按下复位开关，清零
            Velo <= 0;
            Mode <= 1;
            cnt_total <= 0;
        end else begin
            cnt_total <= cnt_total + 1;
            if (cnt_total == 999999) begin
                cnt_total <= 0;
                if (Brk) begin
                    if (Velo > 0) begin
                        if (Velo == Mode * 2 - 2)
                            Mode <= Mode - 1;
                        Velo <= Velo - 1;
                    end
                end else if (Switch) begin // 自动换挡
                    if (Velo < 9)
                        Velo = Velo + 1;
                    Mode <= Velo / 2 + 1;
                end else begin // 手动换挡
                    if (Chg && Mode < 5)
                        Mode <= Mode + 1;
                    if (Velo < Mode * 2 - 1 && Velo < 9)
                        Velo <= Velo + 1;
                end
            end
        end
    end
endmodule
