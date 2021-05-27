module FC(clk,Layer1,Layer2);

input clk;
input Layer1 , Layer2;

reg[15:0] Layer1_Bias[0:119];
reg[15:0] Layer2_Bias[0:83];

reg[15:0] Layer1_W[0:10079];  // 120 * 84 - 1
reg[15:0] Layer2_W[0:839];    // 84 * 10 - 1


initial begin

    // load dense 
    // layer 1
    $readmemb("parameters/biastestBin.txt", Layer1_Bias);
    $readmemb("parameters/weightTestBin.txt", Layer1_W);
    
    // done loading can prcess now 
    $display("done loading CNN Parameters \n");
end
    
endmodule