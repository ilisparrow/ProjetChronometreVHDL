echo "=== Modelsim Simulation Script for the MUX4_TB Exercise ==="
vlib work
vcom ../source/unite_logique.vhd
vcom ../source/unite_logique_tb.vhd
echo "Compilation apparently succeeded..."
echo "Launching the Simulation......"
vsim -novopt unite_logique_tb
add wave -noupdate -divider BENCH
add wave *
echo "=== Simulation starting now ==="
run -all
wave zoomfull