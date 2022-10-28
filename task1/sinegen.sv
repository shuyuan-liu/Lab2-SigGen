module sinegen #(
    parameter ADDR_WIDTH = 8,
              DATA_WIDTH = 8
)(
    input  logic                   clk,
    input  logic                   rst,
    input  logic                   en,
    input  logic[(DATA_WIDTH-1):0] step_size,
    input  logic[(DATA_WIDTH-1):0] offset,
    output logic[(DATA_WIDTH-1):0] dout1,
    output logic[(DATA_WIDTH-1):0] dout2
);

logic[(ADDR_WIDTH-1):0] rom_addr;
logic[(ADDR_WIDTH-1):0] rom_addr_with_offset;

counter addr_counter(
    .clk(clk),
    .rst(rst),
    .en(en),
    .step_size(step_size),
    .count(rom_addr)
);

adder offset_adder(
    .a(rom_addr),
    .b(offset),
    .sum(rom_addr_with_offset)
);

rom sine_table(
    .clk(clk),
    .addr1(rom_addr),
    .addr2(rom_addr_with_offset),
    .dout1(dout1),
    .dout2(dout2)
);

endmodule
