// 设计实现超前进位的四位加法器，将结果采用十进制表示，并使用自带译码的七段数码管显示结果

module PG(Xi, Yi, Pi, Gi);
    input wire Xi, Yi;
    output wire Pi, Gi;

    assign Pi = Xi | Yi;
    assign Gi = Xi & Yi;
endmodule

module adder_1_3 (
    input wire[3:0] A,
    input wire[3:0] B,
    input wire Cin,
    output reg [3:0] seg0,    // 输出：七段数码管低位
    output reg [1:0] seg1     // 输出：七段数码管高位
    );

    wire[3:0] P;    // 进位传递函数
    wire[3:0] G;    // 进位生成函数
    
    PG pg0 (.Xi(A[0]), .Yi(B[0]), .Pi(P[0]), .Gi(G[0]));
    PG pg1 (.Xi(A[1]), .Yi(B[1]), .Pi(P[1]), .Gi(G[1]));
    PG pg2 (.Xi(A[2]), .Yi(B[2]), .Pi(P[2]), .Gi(G[2]));
    PG pg3 (.Xi(A[3]), .Yi(B[3]), .Pi(P[3]), .Gi(G[3]));
    
    wire[2:0] C;	// 进位
    wire[4:0] F;	// 输出结果
    
    assign C[0] = G[0] | (P[0] & Cin);
    assign C[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
    assign C[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);
    assign F[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & Cin);
    
    assign F[0] = A[0] ^ B[0] ^ Cin;
    assign F[1] = A[1] ^ B[1] ^ C[0];
    assign F[2] = A[2] ^ B[2] ^ C[1];
    assign F[3] = A[3] ^ B[3] ^ C[2];
    
    // 至此，F[4:0] 表示一个 [0, 31] 的整数
    // seg1 为高位 [0, 3]，seg0 为低位 [0, 9]
    
    assign seg1 = F / 10;
    assign seg0 = F % 10;
    
endmodule