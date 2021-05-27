module test_bench(clk);

parameter clockCycleTime = 100;
parameter numberOfLayers = 2;

input clk;

// 
reg RST , load;

// Ram Data
reg[15:0] captured_data;
wire write;
reg[15:0] ramBase;

wire[15:0] ramAddress;
wire[7:0] ramData;

file_handler file_handler_module(load,clk,ramBase, RST, captured_data, write, ramAddress , ramData);

integer parameter_file; 
integer  i,j;
integer tmp;

initial begin

    // read bias files 
    load = 1;
    
    // load dense 

    // layer 1
    parameter_file = $fopen("parameters/biastestBin.txt", "r");
    while (!$feof(parameter_file) ) begin
        tmp =$fscanf(parameter_file, "%d\n", captured_data);
        #100;
        ramBase = ramBase+2;
    end

    parameter_file = $fopen("parameters/weightTestBin.txt", "r");
    while (!$feof(parameter_file) ) begin
        tmp =$fscanf(parameter_file, "%b\n", captured_data);
        #100;
        ramBase = ramBase+2;
    end

    // layer 2
    parameter_file = $fopen("parameters/biastestBin.txt", "r");
    while (!$feof(parameter_file) ) begin
        tmp =$fscanf(parameter_file, "%b\n", captured_data);
        #100;
        ramBase = ramBase+2;
    end

    parameter_file = $fopen("parameters/weightTestBin.txt", "r");
    while (!$feof(parameter_file) ) begin
        tmp =$fscanf(parameter_file, "%b\n", captured_data);
        #100;
        ramBase = ramBase+2;
    end

    // done loading can prcess now 
    load=0;
    $display("done loading CNN Parameters \n");

end

endmodule