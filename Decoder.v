`define start 0 
`define O_left 1
`define O_right 2
`define U_right 3
`define R_right 4

module Decoder(Dot, Dash, Lg, Wg, Valid, Clk, Clr, Dout, Dvalid, Error);

    input Dot, Dash, Lg, Wg, Valid, Clk, Clr;
    output reg [7:0] Dout;
    output reg Dvalid, Error;
    reg [7:0] state;

    initial begin
        state = `start;
    end

    always @(posedge Clk&Valid or posedge Clr)
    begin
        Dvalid = 0;
        Error = 0;
        if (Clr) 
            state = `start;
        else if ((Dot == 1 && Dash == 1) || (Dot == 1 && Wg == 1) 
            || (Dot == 1 && Lg == 1) || (Dash == 1 && Wg == 1) 
            || (Dash == 1 && Lg == 1) || (Lg == 1 && Wg == 1))
                Error = 1;
        else if(Lg == 1) begin
            if(state == `start || state == `O_right || state == `O_left ||  state == `U_right || state == `R_right)
                Error = 1;
            else begin
                Dout = state;
                Dvalid = 1;
                state = `start;
            end
        end
        else if(Wg == 1)
            begin
                Dout = " ";
                Dvalid = 1;
            end
        else
            case (state)
                `start:
                    begin
                        if(Dot == 1) state = "E";
                        else if (Dash == 1) state = "T";
                    end
                "E": 
                    begin
                        if(Dot == 1) state = "I";
                        else if (Dash == 1) state = "A";
                    end
                "T": 
                    begin
                        if(Dot == 1) state = "N";
                        else if (Dash == 1) state = "M";
                    end
                "N":
                    begin
                        if(Dot == 1) state = "D";
                        else if (Dash == 1) state = "K";
                    end
                "M":
                    begin
                        if(Dot == 1) state = "G";
                        else if (Dash == 1) state = "O";
                    end
                "D":
                    begin
                        if(Dot == 1) state = "B";
                        else if (Dash == 1) state = "X";
                    end
                "K":
                    begin
                        if(Dot == 1) state = "C";
                        else if (Dash == 1) state = "Y";
                    end
                "G":
                    begin
                        if(Dot == 1) state = "Z";
                        else if (Dash == 1) state = "Q";
                    end
                "O":
                    begin
                        if(Dot == 1) state = `O_left;
                        else if (Dash == 1) state = `O_right;
                    end
                "B":
                    begin
                        if(Dot == 1) state = "6";
                        else if (Dash == 1) state = "=";
                    end
                "X":
                    begin
                        if(Dot == 1) state = "/";
                        else if (Dash == 1) Error = 1;
                    end
                "Z":
                    begin
                        if(Dot == 1) state = "7";
                        else if (Dash == 1) Error = 1;
                    end
                `O_left:
                    begin
                        if(Dot == 1) state = "8";
                        else if (Dash == 1) Error = 1;
                    end
                `O_right:
                    begin
                        if(Dot == 1) state = "9";
                        else if (Dash == 1) state = "0";
                    end
                "I": 
                    begin
                        if(Dot == 1) state = "S";
                        else if (Dash == 1) state = "U";
                    end
                "A": 
                    begin
                        if(Dot == 1) state = "R";
                        else if (Dash == 1) state = "W";
                    end
                "S": 
                    begin
                        if(Dot == 1) state = "H";
                        else if (Dash == 1) state = "V";
                    end
                "U": 
                    begin
                        if(Dot == 1) state = "F";
                        else if (Dash == 1) state = `U_right;
                    end
                "R": 
                    begin
                        if(Dot == 1) state = "L";
                        else if (Dash == 1) state = `R_right;
                    end
                "W": 
                    begin
                        if(Dot == 1) state = "P";
                        else if (Dash == 1) state = "J";
                    end
                "H": 
                    begin
                        if(Dot == 1) state = "5";
                        else if (Dash == 1) state = "4";
                    end
                "V": 
                    begin
                        if(Dot == 1) Error = 1;
                        else if (Dash == 1) state = "3";
                    end
                `U_right: 
                    begin
                        if(Dot == 1) Error = 1;
                        else if (Dash == 1) state = "2";
                    end
                `R_right: 
                    begin
                        if(Dot == 1) state = "+";
                        else if (Dash == 1) Error = 1;
                    end
                "J": 
                    begin
                        if(Dot == 1) Error = 1;
                        else if (Dash == 1) state = "1";
                    end
                default: 
                    if(Dot == 1 || Dash == 1)
                    Error = 1;
            endcase
            
        if(Error)
            state = `start;

    end

endmodule