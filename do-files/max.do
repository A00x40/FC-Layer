vsim work.max_test_bench 

add wave -position insertpoint  \
sim:/max_test_bench/maxSignal \
sim:/max_test_bench/outing2  \
sim:/max_test_bench/classified \

force -freeze sim:/max_test_bench/maxSignal 1 1, 0 {50 ps} -r 100

run -all

