module max_test_bench(maxSignal);

parameter clockCycleTime = 100;

input maxSignal;
reg [15:0] outing2 [9:0];
wire [3:0] classified;

max maxDUT(maxSignal,outing2,classified);

initial begin
    outing2[9] = 4'h0; 
    outing2[8] = 4'hA; 
    outing2[7] = 4'hF; 
    outing2[6] = 4'hD; 
    outing2[5] = 4'h4; 
    outing2[4] = 4'h9; 
    outing2[3] = 4'h1; 
    outing2[2] = 4'hC; 
    outing2[1] = 4'h2; 
    outing2[0] = 4'hB; 
    #100
    outing2[7] = 4'h0;  
    #100
    outing2[0] = 4'hF;  
    #100
    $stop;

end

endmodule