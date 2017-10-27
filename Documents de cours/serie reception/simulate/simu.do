echo "=== Modelsim Simulation Script for the MUX4_TB Exercise ==="
vlib work
vcom ../source/seriepara.vhd
vcom ../source/seriepara_tb.vhd
echo "Compilation apparently succeeded..."
echo "Launching the Simulation......"
vsim -novopt seriepara_tb
add wave -noupdate -divider BENCH
add wave *
add wave -noupdate -divider UUT
add wave sim:/seriepara_tb/M/*
echo "=== Simulation starting now ==="
run -all
wave zoomfull