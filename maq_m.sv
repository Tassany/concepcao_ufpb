module maq_m (
input maq_m_clock,
input maq_m_reset,
output [3:0] maq_m_lsd,
output [2:0] maq_m_msd,
output maq_m_inc_hora);

always_ff @(posedge maq_m_clock or negedge maq_m_reset)
	if (!maq_m_reset)
		maq_m_lsd <= 4'd0;
	else
	 	if (maq_m_lsd == 4'd9)
			maq_m_lsd <= 4'd0;
		else
			maq_m_lsd <= maq_m_lsd + 4'd1;			
			
always_ff @(posedge maq_m_clock or negedge maq_m_reset)
	if (!maq_m_reset)
		maq_m_msd <= 3'd0;
	else
		if (maq_m_lsd == 4'd9 && maq_m_msd == 3'd5)
			maq_m_msd <= 3'd0;
		else
			if (maq_m_lsd==4'd9)
				maq_m_msd <= maq_m_msd + 3'd1;
			else
				maq_m_msd <= maq_m_msd;
				
always_comb
	maq_m_inc_hora <= (maq_m_msd == 3'd5 && maq_m_lsd == 4'd9);
	
	
endmodule
 
