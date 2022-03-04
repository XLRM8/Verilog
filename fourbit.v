`include "fullAdder.v"

module fourbit(
    input [3:0] inA,
    input [3:0] inB,
    input  carryIn, // "Carry in" inicial, externo.

    output  [3:0] sum,
    output  carryOut); // "Carry out" final, externo.

wire [2:0] c_i;

// Se instancia el módulo 4 veces, de forma que el "carry out" del actual sea el "carry in" del siguiente. 
fullAdder adder_0(.inA(inA[0]), .inB(inB[0]), .carryIn(carryIn), .sum(sum[0]), .carryOut(c_i[0]));
fullAdder adder_1(.inA(inA[1]), .inB(inB[1]), .carryIn(c_i[0]), .sum(sum[1]), .carryOut(c_i[1]));
fullAdder adder_2(.inB(inB[2]), .inA(inA[2]), .carryIn(c_i[1]), .sum(sum[2]), .carryOut(c_i[2]));
fullAdder adder_3(.inA(inA[3]), .inB(inB[3]), .carryIn(c_i[2]), .sum(sum[3]), .carryOut(carryOut));

endmodule


