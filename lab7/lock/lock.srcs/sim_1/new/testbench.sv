`timescale 1ns / 1ps
module testbench;

reg[3:0] inputs;
reg mode;
reg clk, rst;
reg acc, rej;
reg alert;
reg [2:0] state;

task clock_cycle;
    begin
        clk = 1;
        #500;
        clk = 0;
        #500;
    end
endtask

task try_input;
    input [15:0] test_value;
    integer i;
    begin
        for (i = 0; i < 4; i = i + 1) begin
            inputs = test_value[i*4 +: 4];
            clock_cycle;
        end
    end
    mode = 1;
    clock_cycle; // 确认输入
endtask

task change_password;
    input [15:0] test_value;
    integer i;
    begin
        for (i = 0; i < 4; i = i + 1) begin
            inputs = test_value[i*4 +: 4];
            clock_cycle;
        end
    end
    mode = 0;
    clock_cycle; // 确认输入
endtask

initial begin
    // 初始化
    clk = 0;
    rst = 0;
    mode = 0;
    #500;
    // 管理员密码: FFFF, 密码: FFFF（初始为管理员密码）
    
    // 验证
    try_input(16'hABCD); // 第一次尝试 ABCD
    try_input(16'hFFFF); // 第二次正确输入 FFFF
    
    // 修改
    change_password(16'h1234); // 修改密码为 1234
    
    // 验证
    try_input(16'h4321); // 第一次尝试 4321
    try_input(16'hABCD); // 第二次尝试 ABCD
    try_input(16'h9876); // 第三次尝试 9876
    try_input(16'h1234); // 尝试用密码 1234 解封
    
    // 修改
    change_password(16'hABAB); // 尝试修改密码为 ABAB
    
    // 验证
    try_input(16'hFFFF); // 尝试用管理员密码 FFFF 解封
    clock_cycle;
    
end

lock lk (.inputs(inputs), .mode(mode), .CLK(clk), .RST(rst), .acc(acc), .rej(rej), .alert(alert), .state(state));

endmodule
