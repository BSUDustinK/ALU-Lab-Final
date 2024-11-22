module top(
    input [15:0] sw,
    input btnC,
    input btnU,
    input clk,
    
    output [15:0] led,
    output [6:0] seg,
    output [3:0] an
);
wire [7:0] displayY;
wire [3:0] anode;
wire div_clock;

operations ALU(
    .reset(btnU),    
    .doAction(btnC), 
    .operationAddr(sw[3:0]), 
    .dataIn(sw[15:8]),
    
    .outA(led[15:8]), //Output
    .outB(led[7:0]), //Output 
    .outY(displayY[7:0]) //Output
);
clock_div div(
    .clock(clk),
    .reset(btnU),
    .div_clock(div_clock)

);
seven_seg_scanner scanner(
    .div_clock(div_clock),
    .reset(btnU),
    .anode(anode[3:0]) //in
);
seven_seg_decoder decoder(
    .Y(displayY[7:0]),
    .operation(sw[3:0]),
    .anode(anode[3:0]),
    .segs(seg[6:0])
);
assign an = anode;
endmodule
