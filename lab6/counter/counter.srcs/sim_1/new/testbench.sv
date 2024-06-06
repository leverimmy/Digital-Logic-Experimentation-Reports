`timescale 1ns / 1ps
module testbench;

reg clk;
reg rst;
reg[6:0] high;          // 输出：数码管高位
reg[6:0] low;           // 输出：数码管低位

initial begin
    clk = 0;
    rst = 0;
    #500
    rst = 1;            // 给一个上升沿清零
    #500
    rst = 0;            // RST 重新为 0
    #500
    for (integer i = 0; i < 200; i++) begin
        #500 clk = ~clk;
    end
end

counter c (.CLK(clk), .RST(rst), .High(high), .Low(low));

endmodule
