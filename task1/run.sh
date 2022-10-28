#!/usr/bin/sh

rm -rf obj_dir
rm -f *.vcd

verilator -Wall --cc --trace --exe sinegen.sv counter.sv rom_2_port.sv adder.sv sinegen_tb.cpp
make -j7 -C obj_dir -f Vsinegen.mk
ls /dev/ttyUSB* > vbuddy.cfg
./obj_dir/Vsinegen
