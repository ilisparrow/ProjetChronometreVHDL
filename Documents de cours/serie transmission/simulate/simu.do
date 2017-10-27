echo "=== Modelsim Simulation Script for the MUX4_TB Exercise ==="
vlib work
vcom ../source/paraserie.vhd
vcom ../source/paraserie_tb.vhd
echo "Compilation apparently succeeded..."
echo "Launching the Simulation......"
vsim -novopt paraserie_tb
add wave -noupdate -divider BENCH
add wave *
add wave -noupdate -divider UUT
add wave sim:/paraserie_tb/M/*
echo "=== Simulation starting now ==="
run -all
wave zoomfull