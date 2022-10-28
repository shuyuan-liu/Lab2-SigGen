module rom #(
    parameter ADDR_WIDTH = 8,
              DATA_WIDTH = 8
)(
    input  logic                   clk,
    input  logic[(ADDR_WIDTH-1):0] addr1,
    input  logic[(ADDR_WIDTH-1):0] addr2,
    output logic[(DATA_WIDTH-1):0] dout1,
    output logic[(DATA_WIDTH-1):0] dout2
);

logic [(DATA_WIDTH-1):0] rom_content [(2**ADDR_WIDTH-1):0];

initial begin
    $display("Loading ROM content...");
    $readmemh("sinerom.mem", rom_content);
end

always_ff @(posedge clk) begin
    dout1 <= rom_content[addr1];
    dout2 <= rom_content[addr2];
end

endmodule
