echo "=== Modelsim Simulation Script for the MUX4_TB Exercise ==="
vlib work
vcom ../source/compteur.vhd
vcom ../source/afficheur.vhd
vcom ../source/chrono.vhd
vcom ../source/chrono_tb.vhd
echo "Compilation apparently succeeded..."
echo "Launching the Simulation......"
vsim -novopt chrono_tb
add wave -noupdate -divider BENCH
add wave *
echo "=== Simulation starting now ==="
run -all
wave zoomfull