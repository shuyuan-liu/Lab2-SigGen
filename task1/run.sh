#!/usr/bin/sh

rm -r obj_dir
rm *.vcd

verilator -Wall --cc --trace --exe sinegen.sv counter.sv rom.sv sinegen_tb.cpp
make -j7 -C obj_dir -f Vsinegen.mk
ls /dev/ttyUSB* > vbuddy.cfg
./obj_dir/Vsinegen
