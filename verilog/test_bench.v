module test_bench(clk);

parameter clockCycleTime = 100;
input clk;
reg Layer1 , Layer2 , max;
wire[3:0] classified;
FC FC_Module(clk,Layer1,Layer2,max,classified);

initial begin
 
    Layer1=0;
    Layer2=0;
    force FC_Module.Layer2_Out[0] = 16'b0;
    force FC_Module.Layer2_Out[1] = 1'b1;
    max=0;
    #100
    max=1;
    #100
    max=0;
    $stop;

end

endmodule