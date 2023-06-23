module memoryRom (
            input clk,
            input [5:0] addr,
            output reg [3:0] data,
            output reg shuffle_ready
            );

            localparam IDLE = 2'b00, READ = 2'b01, WRITE = 2'b10;

            reg [5:0] shuffle_addr = 6'b0;
            reg [5:0] lfsr = 6'b001011; // lfsr initial state, should be non-zero
            reg [3:0] memory [0:51];
            reg [3:0] memory_shuffle_addr, memory_lfsr;
            reg [1:0] state = IDLE;
            //assign led = shuffle_complete;
				
            initial begin
                memory[0] = 4'd1;  // As
                memory[1] = 4'd2;  // 2
                memory[2] = 4'd3;  // 3
                memory[3] = 4'd4;  // 4
                memory[4] = 4'd5;  // 5
                memory[5] = 4'd6;  // 6
                memory[6] = 4'd7;  // 7
                memory[7] = 4'd8;  // 8
                memory[8] = 4'd9;  // 9
                memory[9] = 4'd10; // 10
                memory[10] = 4'd10; // J
                memory[11] = 4'd10; // Q
                memory[12] = 4'd10; // K
                memory[13] = 4'd1;  // As
                memory[14] = 4'd2;  // 2
                memory[15] = 4'd3;  // 3
                memory[16] = 4'd4;  // 4
                memory[17] = 4'd5;  // 5
                memory[18] = 4'd6;  // 6
                memory[19] = 4'd7;  // 7
                memory[20] = 4'd8;  // 8
                memory[21] = 4'd9;  // 9
                memory[22] = 4'd10; // 10
                memory[23] = 4'd10; // J
                memory[24] = 4'd10; // Q
                memory[25] = 4'd10; // K
                memory[26] = 4'd1;  // As
                memory[27] = 4'd2;  // 2
                memory[28] = 4'd3;  // 3
                memory[29] = 4'd4;  // 4
                memory[30] = 4'd5;  // 5
                memory[31] = 4'd6;  // 6
                memory[32] = 4'd7;  // 7
                memory[33] = 4'd8;  // 8
                memory[34] = 4'd9;  // 9
                memory[35] = 4'd10; // 10
                memory[36] = 4'd10; // J
                memory[37] = 4'd10; // Q
                memory[38] = 4'd10; // K
                memory[39] = 4'd1;  // As
                memory[40] = 4'd2;  // 2
                memory[41] = 4'd3;  // 3
                memory[42] = 4'd4;  // 4
                memory[43] = 4'd5;  // 5
                memory[44] = 4'd6;  // 6
                memory[45] = 4'd7;  // 7
                memory[46] = 4'd8;  // 8
                memory[47] = 4'd9;  // 9
                memory[48] = 4'd10; // 10
                memory[49] = 4'd10; // J
                memory[50] = 4'd10; // Q
                memory[51] = 4'd10; // K
    end

        always @(posedge clk) begin
                case(state)
                    IDLE: begin
                        shuffle_addr <= shuffle_addr + 1;
                        if (shuffle_addr == 6'd51) begin
                            shuffle_addr <= 6'b0;
                            shuffle_ready <= 1;
                        end else begin
                            shuffle_ready <= 0;
                            state <= READ;
                        end
                    end
                    READ: begin
                        memory_shuffle_addr <= memory[shuffle_addr];
                        memory_lfsr <= memory[lfsr[5:0]];
                        state <= WRITE;
                    end
                    WRITE: begin
                        memory[shuffle_addr] <= memory_lfsr;
                        memory[lfsr[5:0]] <= memory_shuffle_addr;
                        lfsr <= {lfsr[4:0], lfsr[4]^lfsr[4]}; // a simple lfsr implementation
                        state <= IDLE;
                    end
                endcase
            end

    always @(posedge clk) begin
        data <= memory[addr];
    end 
endmodule

module twoSevenSegmentsDisplayModule (
            input [6:0]data,
            output reg [6:0] firstDigit,
            output reg [6:0] secondDigit
            );

                always @(*) begin
                    case (data)
                        6'd0: begin
                            firstDigit = 7'b1000000;
                            secondDigit = 7'b1000000;
                        end
                        6'd1: begin
                            firstDigit = 7'b1000000;
                            secondDigit = 7'b1111001;
                        end
                        6'd2: begin
                            firstDigit = 7'b1000000;
                            secondDigit = 7'b0100100;
                        end
                        6'd3: begin
                            firstDigit = 7'b1000000;
                            secondDigit = 7'b0110000;
                        end
                        6'd4: begin
                            firstDigit = 7'b1000000;
                            secondDigit = 7'b0011001;
                        end
                        6'd5: begin
                            firstDigit = 7'b1000000;
                            secondDigit = 7'b0010010;
                        end
                        6'd6: begin
                            firstDigit = 7'b1000000;
                            secondDigit = 7'b0000010;
                        end
                        6'd7: begin
                            firstDigit = 7'b1000000;
                            secondDigit = 7'b1111000;
                        end
                        6'd8: begin
                            firstDigit = 7'b1000000;
                            secondDigit = 7'b0000000;
                        end
                        6'd9: begin
                            firstDigit = 7'b1000000;
                            secondDigit = 7'b0010000;
                        end
                        6'd10: begin
                            firstDigit = 7'b1111001;
                            secondDigit = 7'b1000000;
                        end
                            6'd11: begin
                            firstDigit = 7'b1111001;
                            secondDigit = 7'b1111001;
                        end
                        6'd12: begin
                            firstDigit = 7'b1111001;
                            secondDigit = 7'b0100100;
                        end
                        6'd13: begin
                            firstDigit = 7'b1111001;
                            secondDigit = 7'b0110000;
                        end
                        6'd14: begin
                            firstDigit = 7'b1111001;
                            secondDigit = 7'b0011001;
                        end
                        6'd15: begin
                            firstDigit = 7'b1111001;
                            secondDigit = 7'b0010010;
                        end
                        6'd16: begin
                            firstDigit = 7'b1111001;
                            secondDigit = 7'b0000010;
                        end
                        6'd17: begin
                            firstDigit = 7'b1111001;
                            secondDigit = 7'b1111000;
                        end
                        6'd18: begin
                            firstDigit = 7'b1111001;
                            secondDigit = 7'b0000000;
                        end
                        6'd19: begin
                            firstDigit = 7'b1111001;
                            secondDigit = 7'b0010000;
                        end
                        6'd20: begin
                            firstDigit = 7'b0100100;
                            secondDigit = 7'b1000000;
                        end
                        6'd21: begin
                            firstDigit = 7'b0100100;
                            secondDigit = 7'b1111001;
                        end
                        6'd22: begin
                            firstDigit = 7'b0100100;
                            secondDigit = 7'b0100100;
                        end
                        6'd23: begin
                            firstDigit = 7'b0100100;
                            secondDigit = 7'b0110000;
                        end
                        6'd24: begin
                            firstDigit = 7'b0100100;
                            secondDigit = 7'b0011001;
                        end
                        6'd25: begin
                            firstDigit = 7'b0100100;
                            secondDigit = 7'b0010010;
                        end
                        6'd26: begin
                            firstDigit = 7'b0100100;
                            secondDigit = 7'b0000010;
                        end
                        6'd27: begin
                            firstDigit = 7'b0100100;
                            secondDigit = 7'b1111000;
                        end
                        6'd28: begin
                            firstDigit = 7'b0100100;
                            secondDigit = 7'b0000000;
                        end
                        6'd29: begin
                            firstDigit = 7'b0100100;
                            secondDigit = 7'b0010000;
                        end
                        6'd30: begin
                            firstDigit = 7'b0110000;
                            secondDigit = 7'b1000000;
                        end
                        6'd31: begin
                            firstDigit = 7'b0110000;
                            secondDigit = 7'b1111001;
                        end
                        6'd32: begin
                            firstDigit = 7'b0110000;
                            secondDigit = 7'b0100100;
                        end
                        6'd33: begin
                            firstDigit = 7'b0110000;
                            secondDigit = 7'b0110000;
                        end
                        6'd34: begin
                            firstDigit = 7'b0110000;
                            secondDigit = 7'b0011001;
                        end
                        6'd35: begin
                            firstDigit = 7'b0110000;
                            secondDigit = 7'b0010010;
                        end
                        6'd36: begin
                            firstDigit = 7'b0110000;
                            secondDigit = 7'b0000010;
                        end
                        6'd37: begin
                            firstDigit = 7'b0110000;
                            secondDigit = 7'b1111000;
                        end
                        6'd38: begin
                            firstDigit = 7'b0110000;
                            secondDigit = 7'b0000000;
                        end
                        6'd39: begin
                            firstDigit = 7'b0110000;
                            secondDigit = 7'b0010000;
                        end
                        6'd40: begin
                            firstDigit = 7'b0011001;
                            secondDigit = 7'b1000000;
                        end
                        
                        // Continue with additional cases if needed
                        default: begin
                            firstDigit = 7'b0000000;
                            secondDigit = 7'b0000000;
                        end
                    endcase
                end
endmodule




module debounce(input pb_1, clk, output pb_out);
    wire slow_clk_en;
    wire Q1, Q2, Q2_bar, Q0, pulse;

    clock_enable u1(clk, slow_clk_en);
    my_dff_en d0(clk, slow_clk_en, pb_1, Q0);
    my_dff_en d1(clk, slow_clk_en, Q0, Q1);
    my_dff_en d2(clk, slow_clk_en, Q1, Q2);

    assign Q2_bar = ~Q2;
    assign pulse = Q1 & Q2_bar;

    my_pulse_generator pg(clk, pulse, pb_out);
endmodule

// Slow clock enable for debouncing button 
module clock_enable(input Clk_100M, output slow_clk_en);
    reg [26:0] counter = 0;

    always @(posedge Clk_100M) begin
        counter <= (counter >= 449999) ? 0 : counter + 1;
    end

    assign slow_clk_en = (counter == 449999) ? 1'b1 : 1'b0;
endmodule

// D-flip-flop with clock enable signal for debouncing module 
module my_dff_en(input DFF_CLOCK, input clock_enable, input D, output reg Q = 0);
    always @(posedge DFF_CLOCK) begin
        if (clock_enable == 1) 
            Q <= D;
    end
endmodule

// Pulse generator module
module my_pulse_generator(input clk, input pulse, output reg pb_out);
    reg prev_pulse = 0;

    always @(posedge clk) begin
        if (pulse && !prev_pulse) begin
            pb_out <= 1'b1;
        end else begin
            pb_out <= 1'b0;
        end

        prev_pulse <= pulse;
    end
endmodule


module blackJackStateMachineModule (
        input clk,
        input hit,
        input stay,
        input reset,
        output win,
        output lose,
        output tie,
        output reg [5:0] addr,
        output reg [6:0] SomaDasCartasDoDealer,
        output reg [6:0] SomaDasCartasDoJogador,
        input [3:0] data
    );
    reg [6:0] SomaDasCartasDoDealerNotVisable;

    
    // Define the state enumeration
    localparam
        ST_IDLE = 6'd0,
        ST_START =  6'd1,
        ST_TURN_JOGADOR = 6'd2, 
        ST_DONE =   6'd3,
        ST_WIN =   6'd4,   
        ST_LOSE =  6'd5,
        ST_SUM_JOGADOR = 6'd6,
        ST_SUM_DEALER = 6'd7,
        ST_TURN_DEALER = 6'd8,
        ST_GIVE_CARD_DEALER = 6'd9,
        ST_GIVE_CARD_JOGADOR = 6'd10,
        ST_TIE = 6'd11,
        ST_GIVE_CARD_DEALER_TWO = 6'd12,
        ST_GIVE_CARD_JOGADOR_TWO = 6'd13;

    
    reg [6:0] state, next_state;
    reg [5:0] addr_temp;

    assign win = (state == ST_WIN) ? 1'b1 : 1'b0;
    assign lose = (state == ST_LOSE) ? 1'b1 : 1'b0;
    assign tie = (state == ST_TIE) ? 1'b1 : 1'b0;

    always @(posedge clk) begin
        addr <= addr_temp;
        state <= next_state;

        if(reset) begin
            addr <= 0;
            SomaDasCartasDoJogador <= 0;
            SomaDasCartasDoDealerNotVisable <= 0;
            SomaDasCartasDoDealer <= 0;
            state <= ST_IDLE;
        end
        else if(state == ST_SUM_JOGADOR) begin
            SomaDasCartasDoJogador <= SomaDasCartasDoJogador + data;
        end
        else if(state == ST_SUM_DEALER) begin
            SomaDasCartasDoDealerNotVisable <= SomaDasCartasDoDealerNotVisable + data;
        end
        else if(state == ST_GIVE_CARD_DEALER) begin
            SomaDasCartasDoDealerNotVisable <= SomaDasCartasDoDealerNotVisable + data;
        end
        else if(state == ST_GIVE_CARD_JOGADOR) begin
            SomaDasCartasDoJogador <= SomaDasCartasDoJogador + data;
        end
        else if(state == ST_GIVE_CARD_DEALER_TWO) begin
            SomaDasCartasDoDealerNotVisable <= SomaDasCartasDoDealerNotVisable + data;
        end 
        else if(state == ST_GIVE_CARD_JOGADOR_TWO) begin
            SomaDasCartasDoJogador <= SomaDasCartasDoJogador + data;
        end
        else if(state == ST_DONE) begin
            SomaDasCartasDoDealer = SomaDasCartasDoDealerNotVisable;
        end
        else if(state == ST_LOSE) begin
        SomaDasCartasDoDealer = SomaDasCartasDoDealerNotVisable;
        end
        else if(state == ST_WIN) begin
        SomaDasCartasDoDealer = SomaDasCartasDoDealerNotVisable;
        end
        else if(state == ST_TIE) begin
            SomaDasCartasDoDealer = SomaDasCartasDoDealerNotVisable;
        end
    end

    always @* begin
        // Default values
        next_state = state;
        addr_temp = addr;

        case (state)
            ST_IDLE: begin
                if (hit) begin
                    next_state = ST_GIVE_CARD_JOGADOR;
                end
            end

            ST_GIVE_CARD_JOGADOR: begin
                next_state = ST_GIVE_CARD_DEALER;
                addr_temp = addr + 1;
            end

            ST_GIVE_CARD_DEALER: begin
                next_state = ST_GIVE_CARD_DEALER_TWO;
                addr_temp = addr + 1;
            end

            ST_GIVE_CARD_DEALER_TWO: begin
                next_state = ST_GIVE_CARD_JOGADOR_TWO;
                addr_temp = addr +1;
            end

            ST_GIVE_CARD_JOGADOR_TWO: begin
                next_state = ST_TURN_JOGADOR;
                addr_temp = addr +1;
            end

            ST_TURN_JOGADOR: begin
                if(SomaDasCartasDoJogador > 21) begin
                    next_state = ST_LOSE;
                end
                else if (hit) begin
                    next_state = ST_SUM_JOGADOR;
                    addr_temp = addr + 1;
               end 
               else if (stay) begin
                    next_state = ST_TURN_DEALER;
               end
            end

            ST_TURN_DEALER: begin
               if(SomaDasCartasDoDealerNotVisable < 17) begin
                    next_state = ST_SUM_DEALER;
                    addr_temp = addr + 1;
               end
               else if(SomaDasCartasDoDealerNotVisable > 21) begin
                    next_state = ST_WIN;
               end
               else if(SomaDasCartasDoDealerNotVisable >= 17 && SomaDasCartasDoDealerNotVisable <= 21) begin
                    next_state = ST_DONE;
               end
            end

            ST_SUM_JOGADOR: begin
                next_state = ST_TURN_JOGADOR;
            end

            ST_SUM_DEALER: begin
                next_state = ST_TURN_DEALER;
            end
            
            ST_DONE: begin
                if(SomaDasCartasDoJogador > 21) begin
                    next_state = ST_LOSE;
                end
                else if(SomaDasCartasDoDealerNotVisable > 21) begin
                    next_state = ST_WIN;
                end
                else if(SomaDasCartasDoJogador > SomaDasCartasDoDealerNotVisable) begin
                    next_state = ST_WIN;
                end
                else if(SomaDasCartasDoJogador < SomaDasCartasDoDealerNotVisable) begin
                    next_state = ST_LOSE;
                end
                else if(SomaDasCartasDoJogador == SomaDasCartasDoDealerNotVisable) begin
                    next_state = ST_TIE;
                end
            end

            ST_TIE: begin
                next_state =ST_TIE;
            end
            
            ST_WIN: begin
                next_state = ST_WIN;
            end

            ST_LOSE: begin
                next_state = ST_LOSE;
            end

            default: begin
                next_state = ST_IDLE;
            end
        endcase
    end
endmodule


module ddd(
    input   clk,
    input   hit,
    input   stay,
    input   reset,
    output wire led1,
    output wire led2,
    output wire led3,
    output  [6:0] firstDigit,
    output  [6:0] secondDigit,
    output  [6:0] thirdDigit,
    output  [6:0] fourthDigit
);

    wire  [3:0] data;
    wire  [5:0] addr;
    wire [6:0] SomaDasCartasDoJogador;
    wire [6:0] SomaDasCartasDoDealer;
    wire keyDebouncedHit;
    wire keyDebouncedStay;
    wire keyDebouncedReset;

    debounce debounceInst (
        .clk(clk),
        .pb_1(hit),
        .pb_out(keyDebouncedHit)
    );

    debounce debounceInst2 (
        .clk(clk),
        .pb_1(stay),
        .pb_out(keyDebouncedStay)
    );

    debounce debounceInst3 (
        .clk(clk),
        .pb_1(reset),
        .pb_out(keyDebouncedReset)
    );
    
    memoryRom rom (
        .clk(clk),
        .addr(addr),
        .data(data),
    );

    blackJackStateMachineModule blackJackStateMachineInst (
        .clk(clk),
        .hit(keyDebouncedHit),
        .stay(keyDebouncedStay),
        .reset(keyDebouncedReset),
        .win(led1),
        .lose(led2),
        .tie(led3),
        .addr(addr),
        .SomaDasCartasDoJogador(SomaDasCartasDoJogador),
        .SomaDasCartasDoDealer(SomaDasCartasDoDealer),
        .data(data)
    );

    twoSevenSegmentsDisplayModule display1 (
        .data(SomaDasCartasDoJogador),
        .firstDigit(firstDigit),
        .secondDigit(secondDigit),
    );      

    twoSevenSegmentsDisplayModule display2 (
        .data(SomaDasCartasDoDealer),
        .firstDigit(fourthDigit),
        .secondDigit( thirdDigit),
    );
endmodule
