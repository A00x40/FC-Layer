module FC(clk,Layer1,Layer2,max, classified);

input clk;
input Layer1 , Layer2 , max;
output reg [3:0] classified;

reg[15:0] Layer1_Bias[83:0];
reg[15:0] Layer2_Bias[9:0];

reg[15:0] Layer1_W[0:10079];  // 120 * 84 - 1
reg[15:0] Layer2_W[0:839];    // 84 * 10 - 1


reg[15:0] Layer2_Out[9:0];
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
    
    // done loading can prcess now 
    $display("done loading CNN Parameters \n");
end

always @(max) begin
    temp_reg = 0;
    c = 0;
    for (i=0;i<10;i=i+1)  begin
        if ( Layer2_Out[i] > temp_reg) begin
            c = i;
            temp_reg =  Layer2_Out[i];
        end
    end
    classified = c;
    
end
    
endmodule