module testbench2();
    reg [7:0] encoder_input;
    wire [39:0] encoder_output;
    reg clock;
    parameter x = "TEST";
    parameter LENGTH = 4;
    reg [8 * LENGTH : 0] i; 

    initial begin
        clock = 0;
        i = LENGTH - 1;
    end

    always begin
        #50 clock = !clock;
    end

    always @(posedge clock) begin
        encoder_input = x [8 * i +: 8];
        i = i - 1;
    end
        
    Encoder mcEncoder(encoder_input,encoder_output,clock);
    
endmodule
