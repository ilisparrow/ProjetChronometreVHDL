echo "=== Modelsim Simulation Script for the FSM Exercise ==="
vlib work
vcom ../source/fsm.vhd
vcom ../source/fsm_tb.vhd
echo "Compilation apparently succeeded..."
echo "Launching the Simulation......"
vsim -novopt FSM_TB
add wave -noupdate -divider BENCH
add wave *
add wave -noupdate -divider UUT
add wave sim:/fsm_tb/UUT/*
echo "=== Simulation starting now ==="
run -all
wave zoomfull