`timescale 1ns / 1ps

module top();
logic [7:0] data_sent;
logic [7:0] data_out;
logic [7:0] data_received;

encoder encoder(
.data_in(data_sent),
.shift(8'd3),
.data_out(data_out)
);

encoder decoder(
.data_in(data_out),
.shift(8'd26-8'd3),
.data_out(data_received)
);



endmodule
