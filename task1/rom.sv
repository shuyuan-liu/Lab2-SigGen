module rom #(
    parameter ADDR_WIDTH = 8,
              DATA_WIDTH = 8
)(
    input  logic                   clk,
    input  logic[(ADDR_WIDTH-1):0] addr,
    output logic[(DATA_WIDTH-1):0] dout
);

logic [(DATA_WIDTH-1):0] rom_content [(2**ADDR_WIDTH-1):0];

initial begin
    $display("Loading ROM content...");
    $readmemh("sinerom.mem", rom_content);
end

always_ff @(posedge clk) begin
    dout <= rom_content[addr];
end

endmodule
