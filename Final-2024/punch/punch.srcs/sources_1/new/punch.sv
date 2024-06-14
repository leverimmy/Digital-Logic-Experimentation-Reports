module LFSR_random_generator( 
    input wire clk, 
    input wire reset, 
    output wire [7:0] random_out 
    ); 
    // LFSR的反馈多项式为 x^8 + x^6 + x^5 + x^4 + 1 
    reg [7:0] lfsr; 
    always_ff @(posedge clk or posedge reset) begin 
        if (reset) begin 
        // 当复位信号为高时，将LFSR重置 
            lfsr <= 8'b1; 
        end else begin 
        // 计算新的LFSR值 
            lfsr <= {lfsr[6:0], lfsr[7] ^ lfsr[5] ^ lfsr[4] ^ lfsr[3]}; 
        end 
    end 
    // 将LFSR的值输出作为随机数
    assign random_out = lfsr; 
endmodule

module punch(
    input wire CLK,
    input wire RST,
    input wire Submit,
    input wire [3:0] Switch,
    output reg [3:0] Obj,
    output reg [3:0] Score
    );
    
    reg [7:0] random_number;
    reg [30:0] cnt_total;
    reg [30:0] cnt_submit;
    
    LFSR_random_generator lfst_g(.clk(CLK), .reset(RST), .random_out(random_number));
    
    always_ff @(posedge CLK or posedge RST or posedge Submit) begin
        if (RST) begin
            Score <= 0;
            Obj <= 0;
            cnt_total <= 0;
        end else if (Submit) begin
            cnt_submit <= cnt_submit + 1;
            if (Obj == Switch && cnt_submit == 1) begin
                Score <= Score + 1;
            end
        end else begin
            cnt_total <= cnt_total + 1;
            if (cnt_total == 2999999) begin
                cnt_total <= 0;
                cnt_submit <= 0;
                Obj <= random_number[7:4];
            end
        end
    end
    
endmodule
