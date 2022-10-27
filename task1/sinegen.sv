module sinegen #(
    parameter ADDR_WIDTH = 8,
              DATA_WIDTH = 8
)(
    input  logic                   clk,
    input  logic                   rst,
    input  logic                   en,
    input  logic[(DATA_WIDTH-1):0] step_size,
    output logic[(DATA_WIDTH-1):0] dout
);

logic[(ADDR_WIDTH-1):0] rom_addr;

counter addr_counter(
    .clk(clk),
    .rst(rst),
    .en(en),
    .step_size(step_size),
    .count(rom_addr)
);

rom sine_table(
    .clk(clk),
    .addr(rom_addr),
    .dout(dout)
);

endmodule
