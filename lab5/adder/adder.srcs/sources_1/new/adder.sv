module full_adder(A, B , Cin, F, Cout);
    input wire A, B, Cin;
    output wire F, Cout;

    assign F = A ^ B ^ Cin;
    assign Cout = (A & B) | (Cin & (A ^ B));
endmodule

module adder (
    input wire[3:0] A,
    input wire[3:0] B,
    input wire Cin,
    output wire [3:0] seg0,    // 输出：七段数码管低位
    output wire [1:0] seg1     // 输出：七段数码管高位
);

    wire[2:0] C;	// 进位
    wire[5:0] F;	// 输出结果

    full_adder adder0 (
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .F(F[0]),
        .Cout(C[0])
    );

    full_adder adder1 (
        .A(A[1]),
        .B(B[1]),
        .Cin(C[0]),
        .F(F[1]),
        .Cout(C[1])
    );

    full_adder adder2 (
        .A(A[2]),
        .B(B[2]),
        .Cin(C[1]),
        .F(F[2]),
        .Cout(C[2])
    );

    full_adder adder3 (
        .A(A[3]),
        .B(B[3]),
        .Cin(C[2]),
        .F(F[3]),
        .Cout(F[4])
    );
    
    assign seg1 = F / 10;
    assign seg0 = F % 10;

endmodule