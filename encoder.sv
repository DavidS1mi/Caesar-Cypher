`timescale 1ns / 1ps

module encoder(
input logic [7:0] data_in,
input logic [7:0] shift,
output logic [7:0] data_out 
    );
    always_comb begin
        if (data_in >= 8'h41 && data_in <= 8'h5A) begin
            if (data_in + shift > 8'h5A) begin
                data_out = data_in + shift - 8'd26; 
            end else begin
                data_out = data_in + shift;
            end
            
        end else begin
            data_out = data_in;
        end
    end

endmodule
