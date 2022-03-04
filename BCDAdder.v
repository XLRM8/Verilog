`include "fourbit.v"

module BCDAdder (
    input [3:0]inA, // Variables de entrada.
    input [3:0]inB, 
    input carryIn, // "Carry in" inicial, externo.

    output [3:0]sum, // Variables de salida. 
    output carryOut, // "Carry out" final, externo.
    output sumVal); // Condición de validez de las entradas, externo.

/* Lógica que permite decicir si las entradas recibidas corresponde a valores BCD o no. Si al menos una de las entradas
   es incorrecta, el valor de salida será 0, del lo contrario el valor será 1, indicando que la suma efectuada es válida.*/ 
assign sumVal = ~(((inA[3]&inA[2])|(inA[3]&inA[1])) | ((inB[3]&inB[2])|(inB[3]&inB[1])));

wire [3:0] B_i; // cables que dirigirán el valor de la entrada B en la segunda etapa. 
wire [3:0] sum_i; // cables que dirigirán los valores de la suma a la segunda etapa. 
wire carryOut_i; // cable que dirigirá el "carryOut" a la lógica de decisión de corrección. 

// Primera etapa de suma en BCD
fourbit adder_0(.inA(inA), 
                .inB(inB), 
                .carryIn(carryIn), 
                .sum(sum_i), // las sumas de la primer etapa se conectan a cables para pasarlas a la siguiente. 
                .carryOut(carryOut_i)); // se conecta a un cable para utilizarlo en la decisión de si corregir o no el resultado. 

/* Lógica que permite decicir si la suma obtenida de la primera etapa es correcta o no. Si la suma es incorrecta, 
   el valor de salida será 1 y se asignará a B3, B2, B1 y B0 el nibble 0110, pero si la suma es correcta, el valor será 
   0 y a estos nets se les asignará el nibble 0000.*/ 
assign B_i = (carryOut_i | (sum_i[3] & sum_i[2]) | (sum_i[3] & sum_i[1]))?4'b0110:4'b0000; 

// Segunda etapa de suma en BCD (corrección de la suma). 
fourbit adder_1(.inA(sum_i), // Se conecta el resultado de la suma inicial. 
                .inB(B_i), // Se conecta el nibble decidido tras la lógica anterior. 
                .carryIn(1'b0), // Se conecta a tierra para evitar alteraciones.  
                .sum(sum), // Se saca el resultado final del bloque BCDAdder. 
                .carryOut(carryOut)); // Se saca el carry out final del bloque BCDAdder.*/

endmodule