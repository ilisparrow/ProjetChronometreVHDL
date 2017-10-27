echo "=== Modelsim Simulation Script for the MUX4_TB Exercise ==="
vlib work
vcom ../source/comp1.vhd
vcom ../source/comp2.vhd
vcom ../source/structural.vhd
vcom ../source/structural_tb.vhd
echo "Compilation apparently succeeded..."
echo "Launching the Simulation......"
vsim -novopt structural_tb
add wave -noupdate -divider BENCH
add wave *
echo "=== Simulation starting now ==="
run -all
wave zoomfull