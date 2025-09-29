`timescale 1ns / 1ps

module tb_fifo_sync;

    parameter DATA_WIDTH = 8;
    parameter DEPTH = 4;

    reg clk, rst_n;
    reg wr_en, rd_en;
    reg [DATA_WIDTH-1:0] din;
    wire [DATA_WIDTH-1:0] dout;
    wire full, empty;

    // Instantiate FIFO
    fifo_sync #(
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH(DEPTH)
    ) fifo_inst (
        .clk(clk),
        .rst_n(rst_n),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .din(din),
        .dout(dout),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 10ns period

    initial begin
        // Initialize signals
        rst_n = 0; wr_en = 0; rd_en = 0; din = 0;
        #20 rst_n = 1;

        // Write until full
        $display("---- Writing FIFO ----");
        repeat (DEPTH+2) begin
            wr_en = 1; rd_en = 0; din = $random % 256;
            #10;
            $display("Time=%0t | DIN=%0h | FULL=%b | COUNT=%0d", $time, din, full, fifo_inst.count);
        end

        wr_en = 0;

        // Read until empty
        $display("---- Reading FIFO ----");
        repeat (DEPTH+2) begin
            wr_en = 0; rd_en = 1;
            #10;
            $display("Time=%0t | DOUT=%0h | EMPTY=%b | COUNT=%0d", $time, dout, empty, fifo_inst.count);
        end

        rd_en = 0;

        // Mixed write and read
        $display("---- Mixed Operations ----");
        wr_en = 1; rd_en = 0; din = 8'hAA; #10;
        wr_en = 1; rd_en = 1; din = 8'hBB; #10;
        wr_en = 0; rd_en = 1; #10;

        $finish;
    end

endmodule
