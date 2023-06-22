module memoryRom (
            input clk,
            input [5:0] addr,
            output reg [3:0] data
            );

            reg [3:0] memory [0:51];

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
                data <= memory[addr];
            end

endmodule

module twoSevenSegmentsDisplayModule (
            input [3:0]data,
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





module blackJackStateMachineModule (
        input clk,
        input hit,
        input stay,
        input reset,
        output win,
        output lose,
        output reg [5:0] addr,
        output reg [6:0] sum,
        input [3:0] data
    );
    
    // Define the state enumeration
    localparam
        ST_IDLE = 3'b000,
        ST_START = 3'b001,
        ST_RUN = 3'b010,
        ST_DONE = 3'b011,
        ST_WIN = 3'b100,
        ST_LOSE = 3'b101,
        ST_SUM = 3'b110;

    
    reg [2:0] state, next_state;
    reg [5:0] addr_temp;

    assign win = (state == ST_WIN) ? 1'b1 : 1'b0;
    assign lose = (state == ST_LOSE) ? 1'b1 : 1'b0;

    always @(posedge clk) begin
        addr <= addr_temp;
        state <= next_state;
        if(reset) begin
            addr <= 0;
            sum <= 0;
            state <= ST_IDLE;
        end
        else if(state == ST_START) begin
            sum <= data;
        end
        else if(state == ST_RUN) begin
            sum <= sum + data;
        end
        else if(state == ST_DONE) begin
            sum <= sum;
        end
        else if(state == ST_WIN) begin
            sum <= sum;
        end
        else if(state == ST_LOSE) begin
            sum <= sum;
        end
        else if(state == ST_SUM) begin
            sum <= sum;
        end
        else begin
            sum <= 0;
        end
    end

    always @* begin
        // Default values
        next_state = state;
        addr_temp = addr;

        case (state)
            ST_IDLE: begin
                if (hit) begin
                    next_state = ST_START;
                end
            end

            ST_START: begin
                next_state = ST_RUN;
            end

            ST_RUN: begin
                if (sum > 21) begin
                    next_state = ST_LOSE;
                end
                else if (stay) begin
                    next_state = ST_DONE;
                end
                else if (hit) begin
                    next_state = ST_RUN;
                    addr_temp = addr + 1;
                end
            end

            ST_SUM: begin
                next_state = ST_IDLE;
            end
            
            ST_DONE: begin
                if(sum <= 21 ) begin
                    next_state = ST_WIN;
                end
                else if(sum > 21) begin
                    next_state = ST_LOSE;
                end
            end

            ST_WIN: begin
                next_state = ST_IDLE;
            end

            ST_LOSE: begin
                next_state = ST_IDLE;
            end
        endcase
    end
endmodule



module ddd(
        input  clk,
        input  key,
        output reg led1,
        output wire led2,
        output  [6:0] firstDigit,
        output  [6:0] secondDigit
    );
        
        
        wire  [3:0] data;
        
        wire keyDebounced;
  

        debounce debounceInst (
            .clk(clk),
            .rst(1'b0),
            .in(key),
            .out(keyDebounced)
        );

        always @(*) begin
            if (keyDebounced) begin
                led1 = 1'b1;
            end
            else begin
                led1 = 1'b0;
            end
        end


        memoryRom rom (
        .clk(clk),
        .addr(addr),
        .data(data)
        );
    	
        blackJackStateMachineModule blackJackStateMachineInst (
            .clk(clk),
            .hit(keyDebounced),
            .win(led2),
            .addr(addr),
            .data(data)
        );

        twoSevenSegmentsDisplayModule display (
        .data(data),
        .firstDigit(firstDigit),
        .secondDigit(secondDigit)
        ); 
       
endmodule

module debounce #(
    // Max counts for wait state (40 ms with  50 MHz  clock)
    parameter                   COUNT_WIDTH     = 20,
    parameter [COUNT_WIDTH:0]   MAX_CLK_COUNT   = 20'd480000 - 1
 ) (

    // Inputs
    input               clk,
    input               rst,
    input               in,
    
    // Outputs
    output  reg         out
 );

    // States
    localparam  STATE_HIGH      = 2'd0;
    localparam  STATE_LOW       = 2'd1;    
    localparam  STATE_WAIT      = 2'd2;
    localparam  STATE_PRESSED   = 2'd3;
    
    // Internal storage elements
    reg [1:0]           state;
    reg [COUNT_WIDTH:0] clk_count;
    
    // State transition logic
    always @ (posedge clk or posedge rst) begin
    
        // On reset, return to idle state
        if (rst == 1'b1) begin
            state <= STATE_HIGH;
            out <= 1'b0;
            
        // Define the state transitions
        end else begin
            case (state)
            
                // Wait for increment signal to go from high to low
                STATE_HIGH: begin
                    out <= 1'b0;
                    if (in == 1'b0) begin
                        state <= STATE_LOW;
                    end
                end
                
                // Wait for increment signal to go from low to high
                STATE_LOW: begin
                    if (in == 1'b1) begin
                        state <= STATE_WAIT;
                    end
                end
                
                // Wait for count to be done and sample button again
                STATE_WAIT: begin
                    if (clk_count == MAX_CLK_COUNT) begin
                        if (in == 1'b1) begin
                            state <= STATE_PRESSED;
                        end else begin
                            state <= STATE_HIGH;
                        end
                    end
                end
                
                // If button is still pressed
                STATE_PRESSED: begin
                    out <= 1'b1;
                    state <= STATE_HIGH;
                end
                // Default case: return to idle state
                default: state <= STATE_HIGH;
            endcase
        end
    end
    
    // Run counter if in wait state
    always @ (posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            clk_count <= 0;
        end else begin
            if (state == STATE_WAIT) begin
                clk_count <= clk_count + 1;
            end else begin
                clk_count <= 0;
            end
        end
    end
    
endmodule
