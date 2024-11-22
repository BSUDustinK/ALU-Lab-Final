module full_adder(
    input [7:0] A,
    input [7:0] B,
    output reg [7:0] Yout
    );
wire [7:0] C;
wire [7:0] Y;
//wire [7:0] Ycomp;

assign Y[0] = A[0] ^ B[0];
assign C[0] = A[0] & B[0];
genvar i;
generate
    for(i=1; i<8; i=i+1)begin
        assign Y[i] = A[i] ^ B[i] ^ C[i-1];
        assign C[i] = (A[i] & B[i]) | (A[i] & C[i-1]) | (B[i] & C[i-1]); 
    end
endgenerate

always@(*)begin
    Yout <= Y;
end
endmodule