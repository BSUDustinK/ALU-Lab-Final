module clock_div
#(
    parameter DIVIDE_BY =17
)
(
    input clock,
    input reset,
    output reg div_clock
);  

//Divided by 17
    wire [DIVIDE_BY-1:0] net;
    wire [DIVIDE_BY-1:0] slowerClock;
    dff inst(
        .reset(reset),
        .clock(clock),
        .D(net[0]),
        .Q(slowerClock[0]),
        .NotQ(net[0])
    );
    
    genvar i;
    generate
        for(i=0; i<DIVIDE_BY-1; i= i+1)begin
            dff inst(
                .reset(reset),
                .clock(slowerClock[i]),
                .D(net[i+1]), 
                .Q(slowerClock[i+1]),
                .NotQ(net[i+1])
            );    
        end
    endgenerate

    //Div Clock assignment
    always@(*) begin
        div_clock <= slowerClock[DIVIDE_BY-1];
    end

endmodule

