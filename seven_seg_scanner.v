module seven_seg_scanner(
    input div_clock,
    input reset,
    output reg [3:0] anode
);
    integer i;
       
    always@(posedge div_clock,posedge reset) begin
    if(reset)begin
     i = 0; 
     end   
    else begin i <= (i+1)%4;
    case(i)
        0: anode <= {1'b1,1'b1,1'b1,1'b0};
        1: anode <= {1'b1,1'b1,1'b1,1'b1}; //disabled 2nd anode
        2: anode <= {1'b1,1'b0,1'b1,1'b1};
        3: anode <= {1'b0,1'b1,1'b1,1'b1};
    endcase
    end
    end

endmodule
//SHOULD WORK AS INTENDED