module data_memory(

    input clk,

    input mem_read,
    input mem_write,

    input [31:0] address,
    input [31:0] write_data,

    output [31:0] read_data

);
reg [31:0] memory [0:255];

wire [7:0] index;
assign index = address[9:2];

always @(posedge clk) begin
    if (mem_write)
        memory[index] <= write_data;
end

assign read_data = mem_read ? memory[index] : 32'd0;
endmodule