module FC_LAYER2 (X,W,B,Y,clk,RST);
	parameter X_size = 84; //120*16
	parameter W_size = 84*10; //120*16
	parameter Y_size = 10; //84*16
	
	input [15:0] X [X_size-1:0];
	input [15:0] W [W_size-1:0];
	input [15:0] B [Y_size-1:0];
	output reg [15:0] Y [Y_size-1:0];
	
	input clk;
	input RST;
	
	reg signed [15:0] Mul;
	reg signed [31:0] temp;
	reg signed [15:0] signed_x;
	reg signed [15:0] signed_w;
    	reg signed [16:0] summ;
    
    integer i,j;
    
    
    
	always @ (clk)
	begin
		if (RST == 1)
		begin
		summ = 0;
		for(j=0;j<10;j=j+1)
		begin
		
			for (i=0;i<84;i=i+1)
			begin
			     assign signed_x = X[i];
			     assign signed_w = W[(i*10) + j];
			     assign temp = signed_x * signed_w;
				 
			     if (temp[30:27] || temp[30:27] ) //if overflow in the MS 4 bits
				 
				 begin
				 
				    Mul[15]=temp[31]; //sign bit
				    Mul[14:11]= 4'b1111; // max
			     	    Mul[10:0]=temp[22:12]; // fraction bits
			     	
				 end

				 
			     else
				 
				 begin
				 
				    Mul[15]=temp[31];//sign bit
				    Mul[14:0]=temp[26:12];//middle bits around the dec. point
			     
			     	 end

                   summ=summ+Mul;    				
		end
			
		summ=summ+B[j];
		Y[j]= summ[16:1];
		summ=0;

		end	

		end
	
	end
	
endmodule