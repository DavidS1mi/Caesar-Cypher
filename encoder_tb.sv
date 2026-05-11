`timescale 1ns / 1ps

module encoder_tb();

    logic [7:0] data_in;
    logic [7:0] shift;
    logic [7:0] data_out;
    logic [7:0] data_received;

    encoder dut_encrypt (
        .data_in(data_in),
        .shift(shift),
        .data_out(data_out)
    );

    encoder dut_decrypt (
        .data_in(data_out),
        .shift(8'd26 - shift),
        .data_out(data_received)
    );

    initial begin

        shift = 8'd3;
        
        data_in = "A"; #10;
        data_in = "Z"; #10;
        data_in = "M"; #10;
        
        shift = 8'd5;
        data_in = "B"; #10;
        
        shift = 8'd3;
        data_in = " "; #10;
        data_in = "a"; #10;

        $stop;
    end

endmodule