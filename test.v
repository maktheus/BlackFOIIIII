module debounce_testbench;

    reg clk;
    reg hit;
    wire keyDebouncedHit;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        hit = 0;
        #10 hit = 1;
        #20 hit = 0;
        #30 hit = 1;
        #40 hit = 0;
        #50 hit = 1;
        #60 hit = 0;
        #70 hit = 1;
        #80 hit = 0;
        #90 hit = 1;
    end

    debounce debounceInst (
        .clock(clk),
        .in(hit),
        .out(keyDebouncedHit),
    );
    
    initial begin
        $monitor("At time %t, hit = %b, keyDebouncedHit = %b", $time, hit, keyDebouncedHit);
    end

endmodule
