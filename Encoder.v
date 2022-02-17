module Encoder(encoder_input, encoder_output, Clk);

    input Clk;
    input [7:0] encoder_input;
    output reg [39:0] encoder_output;

    always @(posedge Clk) begin
        case (encoder_input)
            "A": 
                begin
                    encoder_output = ".-";
                end
            "B": 
                begin
                    encoder_output = "-...";
                end
            "C": 
                begin
                    encoder_output = "-.-.";
                end   
            "D": 
                begin
                    encoder_output = "-..";
                end 
            "E": 
                begin
                    encoder_output = ".";
                end
            "F": 
                begin
                    encoder_output = "..-.";
                end  
            "G": 
                begin
                    encoder_output = "--.";
                end 
            "H": 
                begin
                    encoder_output = "....";
                end 
            "I": 
                begin
                    encoder_output = "..";
                end 
            "J": 
                begin
                    encoder_output = ".---";
                end
            "K": 
                begin
                    encoder_output = "-.-";
                end
            "L": 
                begin
                    encoder_output = ".-..";
                end
            "M": 
                begin
                    encoder_output = "--";
                end
            "N": 
                begin
                    encoder_output = "-.";
                end
            "O": 
                begin
                    encoder_output = "---";
                end
            "P": 
                begin
                    encoder_output = ".--.";
                end
            "Q": 
                begin
                    encoder_output = "--.-";
                end
            "R": 
                begin
                    encoder_output = ".-.";
                end
            "S": 
                begin
                    encoder_output = "...";
                end
            "T": 
                begin
                    encoder_output = "-";
                end
            "U": 
                begin
                    encoder_output = "..-";
                end
            "V": 
                begin
                    encoder_output = "...-";
                end
            "W": 
                begin
                    encoder_output = ".--";
                end
            "X": 
                begin
                    encoder_output = "-..-";
                end
            "Y": 
                begin
                    encoder_output = "-.--";
                end
            "Z": 
                begin
                    encoder_output = "--..";
                end
            "0": 
                begin
                    encoder_output = "-----";
                end
            "1": 
                begin
                    encoder_output = ".----";
                end
            "2": 
                begin
                    encoder_output = "..---";
                end
            "3": 
                begin
                    encoder_output = "...--";
                end
            "4": 
                begin
                    encoder_output = "....-";
                end
            "5": 
                begin
                    encoder_output = ".....";
                end
            "6": 
                begin
                    encoder_output = "-....";
                end
            "7": 
                begin
                    encoder_output = "--...";
                end
            "8": 
                begin
                    encoder_output = "---..";
                end
            "9": 
                begin
                    encoder_output = "----.";
                end
            "=": 
                begin
                    encoder_output = "-...-";
                end
            "/": 
                begin
                    encoder_output = "-..-.";
                end
            "+": 
                begin
                    encoder_output = ".-.-.";
                end
        endcase
    end

endmodule