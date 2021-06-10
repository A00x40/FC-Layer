module test_bench(clk);

parameter clockCycleTime = 100;
input clk;
reg Layer1 , Layer2 , max;
wire[3:0] classified;
FC FC_Module(clk,Layer1,Layer2,max,classified);

initial begin
 
    Layer1=0;
    Layer2=0;
    max=0;
    #100
    Layer1=1;
    #100
    Layer1=0;
    Layer2=1;
    #100
    Layer1=0;
    Layer2=0;
    max=1;
    #100
    max=0;
    $stop;

end

endmodule