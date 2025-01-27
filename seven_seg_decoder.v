module seven_seg_decoder(
    input [7:0] Y,
    input [3:0] operation,
    input [3:0] anode,
    output reg [6:0] segs
);

    reg [3:0] selected_sig;
    
    always@(*) begin
       case (anode)
          4'b1110: selected_sig <= operation;  //Right Value of operation selector
          4'b1101: selected_sig <= 15;  //Right Center NO DISPLAY F should not display 
          4'b1011: selected_sig <= Y[3:0];       //Left Center Lower four bits of Y
          4'b0111: selected_sig <= Y[7:4];       //Left Upper four bits of Y
       endcase
           case(selected_sig)
                //            GFEDCBA
                0: segs  <= 7'b1000000;        
                1: segs  <= 7'b1111001;        
                2: segs  <= 7'b0100100;        
                3: segs  <= 7'b0110000;        
                4: segs  <= 7'b0011001;        
                5: segs  <= 7'b0010010;        
                6: segs  <= 7'b0000010;        
                7: segs  <= 7'b1111000;        
                8: segs  <= 7'b0000000;
                9: segs  <= 7'b0010000;        
                10: segs <= 7'b0001000;        
                11: segs <= 7'b0000011;        
                12: segs <= 7'b1000110;        
                13: segs <= 7'b0100001;        
                14: segs <= 7'b0000110;        
                15: segs <= 7'b0001110;       
            endcase
    end
endmodule