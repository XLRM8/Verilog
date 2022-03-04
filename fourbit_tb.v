module fourbit_tb;
// Inputs
reg [3:0] inA;
reg [3:0] inB;
reg carryIn;

// Outputs
wire [3:0] sum;
wire carryOut;

// Conexiones entre las terminales del fourbit y el banco de pruebas. 
fourbit DUT(
    inA,
    inB,
    carryIn,
    sum,
    carryOut);

// Variable que se utilizará como iterador.  
reg [8:0] i; 

initial begin
    $dumpfile("test_fourbit.vcd");
    $dumpvars(1, fourbit_tb);
    
    // Caso en el que el "carryIn" vale 0 (mitad de los casos de la tabla de verdad). 
    carryIn = 1'b0;
    for (i = 0; i < 256; i = i + 1) 
        begin
            /*Como i es un registro de ocho "espacios", se hace una asignación múltiple de su
            valor en binario sobre los 8 "espacios" correspondientes a los vectores de entrada 
            inA e inB.*/
            {inA, inB} = i;
            #10;    
        end

    // Caso en el que el "carryIn" vale 1 (resto de los casos de la tabla de verdad).
    carryIn = 1'b1;
    for (i = 0; i < 256; i = i + 1) 
        begin
            {inA, inB} = i;
            #10;    
        end
    $finish; 
end
     
endmodule
