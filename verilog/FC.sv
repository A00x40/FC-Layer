module FC(clk,Layer1,Layer2,max, classified);

input clk;
input Layer1 , Layer2, max;
output reg [3:0] classified;

reg [15:0] Layer1_X [119:0];

reg[15:0] Layer1_Bias[83:0];
reg[15:0] Layer2_Bias[9:0];

reg[15:0] Layer1_W[10079:0];  // 120 * 84 - 1
reg[15:0] Layer2_W[839:0];    // 84 * 10 - 1

reg [15:0] outing [83:0];
reg [15:0] outing2 [9:0];

reg[15:0] temp_reg;
integer c , i;

initial begin

    // load dense 
	
    // layer 1
    $readmemb("parameters/biasesdense_1_Bin.txt", Layer1_Bias);
    $readmemb("parameters/weightsdense_1_Bin.txt", Layer1_W);
    // layer 2
    $readmemb("parameters/biasesdense_2_Bin.txt", Layer2_Bias);
    $readmemb("parameters/weightsdense_2_Bin.txt", Layer2_W);
    //load X
    $readmemb("parameters/Xdense.txt", Layer1_X);
    // done loading can prcess now 
    $display("done loading FC Parameters \n");

end

FC_LAYER FCLAYER1 (.X(Layer1_X),.W(Layer1_W),.B(Layer1_Bias),.Y(outing),.clk(clk),.RST(Layer1));
FC_LAYER2 FCLAYER2 (.X(outing),.W(Layer2_W),.B(Layer2_Bias),.Y(outing2),.clk(clk),.RST(Layer2));

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
    $display("%d",classified);
end
endmodule