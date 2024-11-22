module operations(
input reset,    //BtnU
input doAction, //BtnC
input [3:0] operationAddr, //SW 
input [7:0] dataIn, //SW

output [7:0] outY, 
output [7:0] outA,
output [7:0] outB
);
reg [7:0] temp;
reg [7:0] Y;
reg [7:0] A;
reg [7:0] B;
wire [7:0] compA;
wire [7:0] compB;
wire [7:0] fullAdder;
wire [7:0] fullSub;

twos_compliment compAop(
    .In(A),
    .Out(compA)
);
twos_compliment compBop(   
    .In(B),             
    .Out(compB)
);                      

full_adder add(
.A(A),
.B(B),
.Yout(fullAdder)
);

full_adder sub(
.A(A),         
.B(compB),         
.Yout(fullSub)  
);             

always@(posedge doAction, posedge reset)begin
    if(reset)begin 
        A<=0;
        B<=0;
        Y<=0;
    end else if(doAction)begin 
        case(operationAddr)
            0: Y <= fullAdder;    
            1: Y <= fullSub;   
            2: Y <= (A << 1);
            3: Y <= (A >> 1);
            4: Y <= (A == B) ? 0 : (A > B) ? 1 : -1;
            5: Y <= (A && B);
            6: Y <= (A || B);
            7: Y <= (A ^ B);    
            8: Y <= !(A & B);   
            9: Y <= !(A | B);   
            10: Y <= !(A ^ B);  
            11: Y <= ~A;
            12: Y <= compA;
            13: A <= Y;
            14: begin
                temp <= B;
                B <= A;
                A <= temp;
                end
            15: A <= dataIn;
        endcase
    end
end
assign outA = A;
assign outB = B;
assign outY = Y;
endmodule