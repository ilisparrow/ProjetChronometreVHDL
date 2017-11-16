echo "=== Modelsim Simulation Script for the MUX4_TB Exercise ==="
vlib work
vcom ../source/afficheur.vhd
vcom ../source/afficheur_tb.vhd
echo "Compilation apparently succeeded..."
echo "Launching the Simulation......"
vsim -novopt afficheur_tb
add wave -noupdate -divider BENCH
add wave *
echo "=== Simulation starting now ==="
run -all
echo "entre deux"
wave zoomfull