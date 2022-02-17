module testbench();

    reg Dot, Dash, Lg, Wg, Valid, Clr;
    wire [7:0] Dout;
    wire Dvalid, Error;
    reg clock;
    parameter x = "-- --- .-. ... . /-.-. --- -.. . " ;
    parameter LENGTH = 33;
    reg [8 * LENGTH : 0] i ; 

    initial begin
        clock = 0;
        i = LENGTH - 1;
        Valid = 1;
    end

    always begin
        #10 clock = !clock;
    end

    always @(negedge clock) begin
        Dash = 0;
        Dot = 0;
        Lg = 0;
        Wg = 0;
        case (x [8 * i +: 8])
            "-":
                begin
                    Dash = 1;
                end 
            ".":
                begin
                    Dot = 1;
                end
            " ":
                begin
                    Lg = 1;
                end
            "/":
                begin
                    Wg = 1;
                end
            default: 
                Valid = 0;
        endcase
        i = i - 1;
    end

    Decoder mcdecoder(Dot, Dash, Lg, Wg, Valid,clock, Clr, Dout, Dvalid, Error);

endmodule
