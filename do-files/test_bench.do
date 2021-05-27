vsim work.test_bench 

add wave -position insertpoint  \
sim:/test_bench/clk \
sim:/test_bench/Layer1 \
sim:/test_bench/Layer2 \
sim:/test_bench/FC_Module/Layer1_Bias \
sim:/test_bench/FC_Module/Layer2_Bias \
sim:/test_bench/FC_Module/Layer1_W \
sim:/test_bench/FC_Module/Layer2_W \
sim:/test_bench/FC_Module/Layer2_Out \
sim:/test_bench/max \
sim:/test_bench/classified 

force -freeze sim:/test_bench/clk 1 0, 0 {50 ps} -r 100



run -all