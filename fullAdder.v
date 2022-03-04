module fullAdder (
    input inA,
    input inB,
    input carryIn,
    output sum,
    output carryOut);

// assign carryOut = (inA & inB) | ((inA ^ inB) & carryIn); 
assign carryOut = 
    ( ~inA & inB & carryIn) |
    ( inA & ~inB & carryIn) |
    ( inA & inB & ~carryIn) |
    ( inA & inB & carryIn);

// assign sum = (inA ^ inB) ^ carryIn; 
assign sum = 
    ( ~inA & ~inB & carryIn) |
    ( ~inA & inB & ~carryIn) |
    ( inA & ~inB & ~carryIn) |
    ( inA & inB & carryIn);

endmodule


