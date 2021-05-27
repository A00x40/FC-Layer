module test_bench(clk);

parameter clockCycleTime = 100;
input clk;
reg Layer1 , Layer2;

FC FC_Module(clk,Layer1,Layer2);

initial begin
 
    Layer1=0;
    Layer2=0;
    #100
    $stop;

end

endmodule