#include <iostream>
#include <cstdlib>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vsinegen.h"
#include "vbuddy.cpp"

int main(int argc, char* argv[])
{
    Verilated::commandArgs(argc, argv);
    Verilated::traceEverOn(true);

    auto top = new Vsinegen;
    auto logger = new VerilatedVcdC;
    top->trace(logger, 99);
    logger->open("sinegen.vcd");

    if (!vbdOpen()) {
        std::cerr << "Failed to open connection to Vbuddy; exiting" << std::endl;
        exit(EXIT_FAILURE);
    }
    vbdHeader("Lab 2: SineGen");

    top->clk = 0;
    top->step_size = 0x01;
    for (int cycle = 0; cycle < 1000; cycle++) {
        top->rst = (cycle <= 1);
        top->en = (cycle >= 3);

        for (int i = 0; i < 2; i++) {
            top->eval();
            logger->dump(2 * cycle + i);
            top->clk = !top->clk;
        }

        vbdPlot(top->dout, 0, 255);
        vbdCycle(cycle + 1);

        if (Verilated::gotFinish() || vbdGetkey() == 'q') {
            std::cout << "Exiting" << std::endl;
            exit(EXIT_SUCCESS);
        }
    }

    vbdClose();
    logger->close();
    exit(EXIT_SUCCESS);
}
