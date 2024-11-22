module twos_compliment(
    input [7:0] In,
    output [7:0] Out
);
wire [7:0]addOne;
wire Carry[7:0];

genvar i;                              
for(i=0;i<8;i=i+1)begin                         
    assign addOne[i] = ~In[i];                     
end

full_adder addonemore(
    .A(addOne[7:0]),
    .B(8'b00000001),
    .Yout(Out[7:0])
);

endmodule
