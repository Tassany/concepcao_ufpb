module maq_h (
input maq_h_clock,
input maq_h_reset,
output [3:0] maq_h_lsd,
output [1:0] maq_h_msd);

always_ff @(posedge maq_h_clock or negedge maq_h_reset)
	if (!maq_h_reset)
		maq_h_lsd <= 4'd0;
	else
		if (maq_h_lsd == 4'd3 && maq_h_msd == 2'd2) 
				maq_h_lsd <= 4'd0;
		else
			if (maq_h_lsd == 4'd9)
				maq_h_lsd <= 4'd0;
			else
				maq_h_lsd <= maq_h_lsd + 4'd1;			
			
always_ff @(posedge maq_h_clock or negedge maq_h_reset)
	if (!maq_h_reset)
		maq_h_msd <= 2'd0;
	else
		if (maq_h_lsd == 4'd3 && maq_h_msd == 2'd2) 
				maq_h_msd <= 2'd0;
		else
			if (maq_h_lsd==4'd9)
				maq_h_msd <= maq_h_msd + 2'd1;
			else
				maq_h_msd <= maq_h_msd;
				
	
	
endmodule
 
