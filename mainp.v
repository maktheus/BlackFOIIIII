

module main(
    input   clock,
    input   pegarCarta,
    input   ficarCarta,
    input   resetar,
    output wire led1,
    output wire led2,
    output wire led3,
    output  [6:0] PrimeiroDigito,
    output  [6:0] QuartoDigito,
    output  [6:0] TerceiroDigitoigito,
    output  [6:0] SegundoDigito
);

    wire  [3:0] data;
    wire  [5:0] endereco;
    wire [6:0] SomaDasCartasDoJogador;
    wire [6:0] SomaDasCartasDoDealer;
    wire BtDbpegarCarta;
    wire btDbficarCarta;
    wire btDbresetar;

    debounce debounceInst (
        .clock(clock),
        .btEntrada(pegarCarta),
        .btSaida(BtDbpegarCarta)
    );

    debounce debounceInst2 (
        .clock(clock),
        .btEntrada(ficarCarta),
        .btSaida(btDbficarCarta)
    );

    debounce debounceInst3 (
        .clock(clock),
        .btEntrada(resetar),
        .btSaida(btDbresetar)
    );
    
    memoria rom (
        .clock(clock),
        .endereco(endereco),
        .data(data),
    );

    blackJackestadoMachineModule blackJackestadoMachineInst (
        .clock(clock),
        .pegarCarta(BtDbpegarCarta),
        .ficarCarta(btDbficarCarta),
        .resetar(btDbresetar),
        .vitoria(led1),
        .perda(led2),
        .empate(led3),
        .endereco(endereco),
        .SomaDasCartasDoJogador(SomaDasCartasDoJogador),
        .SomaDasCartasDoDealer(SomaDasCartasDoDealer),
        .data(data)
    );

    DisplayDeSeteSegmentosDecodificador d1 (
        .data(SomaDasCartasDoJogador),
        .PrimeiroDigito(PrimeiroDigito),
        .SegundoDigito(SegundoDigito),
    );      

    DisplayDeSeteSegmentosDecodificador d2 (
        .data(SomaDasCartasDoDealer),
        .PrimeiroDigito(QuartoDigito),
        .SegundoDigito( TerceiroDigito),
    );
endmodule



module memoria (
            input clock,
            input [5:0] endereco,
            output reg [3:0] data,
            output reg embaralhamentoPronto
            );

            localparam Epera = 2'b00, READ = 2'b01, ESCRITA = 2'b10;

            reg [5:0] enderecoDeEmbaralhamento = 6'b0;
            reg [5:0] troca = 6'b001011;
            reg [3:0] memoria [0:51];
            reg [3:0] memoria_enderecoDeEmbaralhamento, memoria_Embaralhamento;
            reg [1:0] estado = Epera;
        
				
        initial begin
            memoria[0] = 4'b0001;
            memoria[1] = 4'b0010;
            memoria[2] = 4'b0011;
            memoria[3] = 4'b0100;
            memoria[4] = 4'b0101;
            memoria[5] = 4'b0110;
            memoria[6] = 4'b0111;
            memoria[7] = 4'b1000;
            memoria[8] = 4'b1001;
            memoria[9] = 4'b1010;
            memoria[10] = 4'b1010;
            memoria[11] = 4'b1010;
            memoria[12] = 4'b1010;
            memoria[13] = 4'b0001;
            memoria[14] = 4'b0010;
            memoria[15] = 4'b0011;
            memoria[16] = 4'b0100;
            memoria[17] = 4'b0101;
            memoria[18] = 4'b0110;
            memoria[19] = 4'b0111;
            memoria[20] = 4'b1000;
            memoria[21] = 4'b1001;
            memoria[22] = 4'b1010;
            memoria[23] = 4'b1010;
            memoria[24] = 4'b1010;
            memoria[25] = 4'b1010;
            memoria[26] = 4'b0001;
            memoria[27] = 4'b0010;
            memoria[28] = 4'b0011;
            memoria[29] = 4'b0100;
            memoria[30] = 4'b0101;
            memoria[31] = 4'b0110;
            memoria[32] = 4'b0111;
            memoria[33] = 4'b1000;
            memoria[34] = 4'b1001;
            memoria[35] = 4'b1010;
            memoria[36] = 4'b1010;
            memoria[37] = 4'b1010;
            memoria[38] = 4'b1010;
            memoria[39] = 4'b0001;
            memoria[40] = 4'b0010;
            memoria[41] = 4'b0011;
            memoria[42] = 4'b0100;
            memoria[43] = 4'b0101;
            memoria[44] = 4'b0110;
            memoria[45] = 4'b0111;
            memoria[46] = 4'b1000;
            memoria[47] = 4'b1001;
            memoria[48] = 4'b1010;
            memoria[49] = 4'b1010;
            memoria[50] = 4'b1010;
            memoria[51] = 4'b1010;
        end

        always @(posedge clock) begin
                case(estado)
                    Epera: begin
                        enderecoDeEmbaralhamento <= enderecoDeEmbaralhamento + 1;
                        if (enderecoDeEmbaralhamento == 6'd51) begin
                            enderecoDeEmbaralhamento <= 6'b0;
                            embaralhamentoPronto <= 1;
                        end else begin
                            embaralhamentoPronto <= 0;
                            estado <= READ;
                        end
                    end
                    READ: begin
                        memoria_enderecoDeEmbaralhamento <= memoria[enderecoDeEmbaralhamento];
                        memoria_Embaralhamento <= memoria[troca[5:0]];
                        estado <= ESCRITA;
                    end
                    ESCRITA: begin
                        memoria[enderecoDeEmbaralhamento] <= memoria_Embaralhamento;
                        memoria[troca[5:0]] <= memoria_enderecoDeEmbaralhamento;
                        troca <= {troca[4:0], troca[4]^troca[4]};
                        estado <= Epera;
                    end
                endcase
            end

    always @(posedge clock) begin
        data <= memoria[endereco];
    end 
endmodule


module debounce(input btEntrada, clock, output btSaida);
    wire enableDoClockLento;
    wire caso1, caso2, caso2_barrado, caso0, pulso;

    clock_enable u1(clock, enableDoClockLento);
    FliFlopD d0(clock, enableDoClockLento, btEntrada, caso0);
    FliFlopD d1(clock, enableDoClockLento, caso0, caso1);
    FliFlopD d2(clock, enableDoClockLento, caso1, caso2);

    assign caso2_barrado = ~caso2;
    assign pulso = caso1 & caso2_barrado;

    geradorDePulso pg(clock, pulso, btSaida);
endmodule

//de https://www.fpga4student.com/2017/04/simple-debouncing-verilog-code-for.html
module clock_enable(input clock_100M, output enableDoClockLento);
    reg [26:0] counter = 0;

    always @(posedge clock_100M) begin
        counter <= (counter >= 449999) ? 0 : counter + 1;
    end

    assign enableDoClockLento = (counter == 449999) ? 1'b1 : 1'b0;
endmodule

module FliFlopD(input DFF_CLOCK, input clock_enable, input D, output reg Q = 0);
    always @(posedge DFF_CLOCK) begin
        if (clock_enable == 1) 
            Q <= D;
    end
endmodule

module geradorDePulso(input clock, input pulso, output reg btSaida);
    reg prev_pulso = 0;

    always @(posedge clock) begin
        if (pulso && !prev_pulso) begin
            btSaida <= 1'b1;
        end else begin
            btSaida <= 1'b0;
        end
        prev_pulso <= pulso;
    end
endmodule


module blackJackestadoMachineModule (
        input clock,
        input pegarCarta,
        input ficarCarta,
        input resetar,
        output vitoria,
        output perda,
        output empate,
        output reg [5:0] endereco,
        output reg [6:0] SomaDasCartasDoDealer,
        output reg [6:0] SomaDasCartasDoJogador,
        input [3:0] data
    );
    reg [6:0] SomaDasCartasDoDealerNvs;

    

    localparam
        estadoEspera = 6'd0,
        ST_START =  6'd1,
        turnoJogador = 6'd2, 
        estadoFim =   6'd3,
        estadoVitoria =   6'd4,   
        estadoDerrota =  6'd5,
        estadoSomaCartaJogador = 6'd6,
        estadoSomaDasCartasDoDealer = 6'd7,
        turnoBanca = 6'd8,
        estadoDaCartaBanca = 6'd9,
        estadoDaCartaJogador = 6'd10,
        estadoEmpate = 6'd11,
        estadoDaSegundaCartaBanca = 6'd12,
        estadoDaSegundaCartaJogador = 6'd13;

    
    reg [6:0] estado, proximo_estado;
    reg [5:0] endereco_temp;

    assign vitoria = (estado == estadoVitoria) ? 1'b1 : 1'b0;
    assign perda = (estado == estadoDerrota) ? 1'b1 : 1'b0;
    assign empate = (estado == estadoEmpate) ? 1'b1 : 1'b0;

    always @(posedge clock) begin
        endereco <= endereco_temp;
        estado <= proximo_estado;

        if(resetar) begin
            endereco <= 0;
            SomaDasCartasDoJogador <= 0;
            SomaDasCartasDoDealerNvs <= 0;
            SomaDasCartasDoDealer <= 0;
            estado <= estadoEspera;
        end
        else if(estado == estadoSomaCartaJogador) begin
            SomaDasCartasDoJogador <= SomaDasCartasDoJogador + data;
        end
        else if(estado == estadoSomaDasCartasDoDealer) begin
            SomaDasCartasDoDealerNvs <= SomaDasCartasDoDealerNvs + data;
        end
        else if(estado == estadoDaCartaBanca) begin
            SomaDasCartasDoDealerNvs <= SomaDasCartasDoDealerNvs + data;
        end
        else if(estado == estadoDaCartaJogador) begin
            SomaDasCartasDoJogador <= SomaDasCartasDoJogador + data;
        end
        else if(estado == estadoDaSegundaCartaBanca) begin
            SomaDasCartasDoDealerNvs <= SomaDasCartasDoDealerNvs + data;
        end 
        else if(estado == estadoDaSegundaCartaJogador) begin
            SomaDasCartasDoJogador <= SomaDasCartasDoJogador + data;
        end
        else if(estado == estadoFim) begin
            SomaDasCartasDoDealer = SomaDasCartasDoDealerNvs;
        end
        else if(estado == estadoDerrota) begin
        SomaDasCartasDoDealer = SomaDasCartasDoDealerNvs;
        end
        else if(estado == estadoVitoria) begin
        SomaDasCartasDoDealer = SomaDasCartasDoDealerNvs;
        end
        else if(estado == estadoEmpate) begin
            SomaDasCartasDoDealer = SomaDasCartasDoDealerNvs;
        end
    end

    always @* begin
    
        proximo_estado = estado;
        endereco_temp = endereco;

        case (estado)
            estadoEspera: begin
                if (pegarCarta) begin
                    proximo_estado = estadoDaCartaJogador;
                end
            end

            estadoDaCartaJogador: begin
                proximo_estado = estadoDaCartaBanca;
                endereco_temp = endereco + 1;
            end

            estadoDaCartaBanca: begin
                proximo_estado = estadoDaSegundaCartaBanca;
                endereco_temp = endereco + 1;
            end

            estadoDaSegundaCartaBanca: begin
                proximo_estado = estadoDaSegundaCartaJogador;
                endereco_temp = endereco +1;
            end

            estadoDaSegundaCartaJogador: begin
                proximo_estado = turnoJogador;
                endereco_temp = endereco +1;
            end

            turnoJogador: begin
                if(SomaDasCartasDoJogador > 21) begin
                    proximo_estado = estadoDerrota;
                end
                else if (pegarCarta) begin
                    proximo_estado = estadoSomaCartaJogador;
                    endereco_temp = endereco + 1;
               end 
               else if (ficarCarta) begin
                    proximo_estado = turnoBanca;
               end
            end

            turnoBanca: begin
               if(SomaDasCartasDoDealerNvs < 17) begin
                    proximo_estado = estadoSomaDasCartasDoDealer;
                    endereco_temp = endereco + 1;
               end
               else if(SomaDasCartasDoDealerNvs > 21) begin
                    proximo_estado = estadoVitoria;
               end
               else if(SomaDasCartasDoDealerNvs >= 17 && SomaDasCartasDoDealerNvs <= 21) begin
                    proximo_estado = estadoFim;
               end
            end

            estadoSomaCartaJogador: begin
                proximo_estado = turnoJogador;
            end

            estadoSomaDasCartasDoDealer: begin
                proximo_estado = turnoBanca;
            end
            
            estadoFim: begin
                if(SomaDasCartasDoJogador > 21) begin
                    proximo_estado = estadoDerrota;
                end
                else if(SomaDasCartasDoDealerNvs > 21) begin
                    proximo_estado = estadoVitoria;
                end
                else if(SomaDasCartasDoJogador > SomaDasCartasDoDealerNvs) begin
                    proximo_estado = estadoVitoria;
                end
                else if(SomaDasCartasDoJogador < SomaDasCartasDoDealerNvs) begin
                    proximo_estado = estadoDerrota;
                end
                else if(SomaDasCartasDoJogador == SomaDasCartasDoDealerNvs) begin
                    proximo_estado = estadoEmpate;
                end
            end

            estadoEmpate: begin
                proximo_estado =estadoEmpate;
            end
            
            estadoVitoria: begin
                proximo_estado = estadoVitoria;
            end

            estadoDerrota: begin
                proximo_estado = estadoDerrota;
            end

            default: begin
                proximo_estado = estadoEspera;
            end
        endcase
    end
endmodule
