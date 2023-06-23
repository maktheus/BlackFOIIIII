module main_tb;

    reg clock;
    reg pegarCarta;
    reg ficarCarta;
    reg resetar;
    
    wire led1;
    wire led2;
    wire led3;
    wire [6:0] PrimeiroDigito;
    wire [6:0] QuartoDigito;
    wire [6:0] TerceiroDigitoigito;
    wire [6:0] SegundoDigito;

    main dut (
        .clock(clock),
        .pegarCarta(pegarCarta),
        .ficarCarta(ficarCarta),
        .resetar(resetar),
        .led1(led1),
        .led2(led2),
        .led3(led3),
        .PrimeiroDigito(PrimeiroDigito),
        .QuartoDigito(QuartoDigito),
        .TerceiroDigitoigito(TerceiroDigitoigito),
        .SegundoDigito(SegundoDigito)
    );
    
    initial begin
        // Inicialize os sinais
        clock = 0;
        pegarCarta = 0;
        ficarCarta = 0;
        resetar = 0;
        
        // Aguarde um ciclo de clock
        #5;
        
        // Resetar o circuito
        resetar = 1;
        #5;
        resetar = 0;
        
        // Simulação do comportamento do usuário
        #5;
        pegarCarta = 1;
        #10;
        pegarCarta = 0;
        #10;
        ficarCarta = 1;
        #10;
        ficarCarta = 0;
        #10;
        pegarCarta = 1;
        #10;
        pegarCarta = 0;
        #10;
        ficarCarta = 1;
        #10;
        ficarCarta = 0;
        
        // Outras simulações...
        
        // Finalize a simulação
        #10;
        $finish;
    end
    
    always begin
        #2 clock = ~clock;
    end

endmodule
