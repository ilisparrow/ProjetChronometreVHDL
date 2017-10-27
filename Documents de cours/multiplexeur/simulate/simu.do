echo "=== Modelsim Simulation Script for the MUX4_TB Exercise ==="
vlib work
vcom ../source/multiplexeur.vhd
vcom ../source/multiplexeurtb.vhd
echo "Compilation apparently succeeded..."
echo "Launching the Simulation......"
vsim -novopt multiplexeur_tb
add wave -noupdate -divider BENCH
add wave *
echo "=== Simulation starting now ==="
run -all
wave zoomfull