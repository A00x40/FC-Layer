module max(max,outing2,classified);

input max;
input [15:0] outing2 [9:0];
output reg [3:0] classified;

reg[15:0] temp_reg;
integer c , i;

always @(max) 
    begin
    temp_reg = 0;
    c = 0;
    for (i=0;i<10;i=i+1)
	begin
        if ( outing2[i] > temp_reg)
		begin
            	c = i;
            	temp_reg =  outing2[i];
	        end
	end
    classified = c;
    //$display("%d",classified);
end
endmodule