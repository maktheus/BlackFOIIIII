`timescale 1ns / 1ps

module testbench;
    reg clk;
    reg hit;
    reg stay;
    reg reset;
    wire win;
    wire lose;
    wire tie;
    reg [5:0] addr;
    wire [6:0] SomaDasCartasDoDealer;
    wire [6:0] SomaDasCartasDoJogador;
    wire [3:0] data;

    blackJackStateMachineModule u1 (
        .clk(clk),
        .hit(hit),
        .stay(stay),
        .reset(reset),
        .win(win),
        .lose(lose),
        .tie(tie),
        .addr(addr),
        .SomaDasCartasDoDealer(SomaDasCartasDoDealer),
        .SomaDasCartasDoJogador(SomaDasCartasDoJogador),
        .data(data)
    );

    // clock generator
    always begin
        #5 clk = ~clk; // Assume a 10ns clock period.
    end

    // Test case
    initial begin
        // Initialize signals
        clk = 0;
        hit = 0;
        stay = 0;
        reset = 0;
        addr = 0;
        
        // Wait for some time
        #15;
        
        // Test case: Game start
        reset = 1;
        #10;
        reset = 0;
        hit = 1;
        #10;
        
        // Draw two cards for player and dealer
        hit = 0;
        addr = 2;
        #10;

        // Test case: Player wins
        hit = 1;
        #10;
        hit = 0;
        addr = 3;

        // Test case: Player loses
        hit = 1;
        #10;
        hit = 0;
        addr = 4;

        // Test case: Player ties
        hit = 1;
        #10;
        hit = 0;
        addr = 5;
        

        // Finish the simulation
        #100;
        $finish;
    end

endmodule
