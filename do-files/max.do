vsim work.max
add wave -position end  sim:/max/outing2
add wave -position end  sim:/max/temp_reg
add wave -position end  sim:/max/i
add wave -position end  sim:/max/c
add wave -position end  sim:/max/max
add wave -position end  sim:/max/classified
force -freeze sim:/max/max 1 1, 0 {50 ps} -r 100

force -freeze {sim:/max/outing2[9]} 4'h0000 0
force -freeze {sim:/max/outing2[8]} 4'h000A 0
force -freeze {sim:/max/outing2[7]} 4'h000F 0
force -freeze {sim:/max/outing2[6]} 4'h000D 0
force -freeze {sim:/max/outing2[5]} 4'h0004 0
force -freeze {sim:/max/outing2[4]} 4'h0009 0
force -freeze {sim:/max/outing2[3]} 4'h0001 0
force -freeze {sim:/max/outing2[2]} 4'h000C 0
force -freeze {sim:/max/outing2[1]} 4'h0002 0
force -freeze {sim:/max/outing2[0]} 4'h000B 0
run
force -freeze {sim:/max/outing2[7]} 4'h0000 0
run