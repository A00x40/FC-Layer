vsim work.test_bench 

add wave -position insertpoint  \
sim:/test_bench/clk \
sim:/test_bench/captured_data

force -freeze sim:/test_bench/clk 1 0, 0 {50 ps} -r 100

run 
run
run
run
run