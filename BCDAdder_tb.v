module BCDAdder_tb; 
    // Inputs
    reg [3:0] inA_tb;
    reg [3:0] inB_tb;
    reg carryIn_tb;

    // Outputs
    wire [3:0] sum_tb;
    wire carryOut_tb;
    wire sumVal_tb; 

    // Conexiones entre las terminales del BCDAdder y el banco de pruebas. 
    BCDAdder DUT ( 
        .inA(inA_tb), 
        .inB(inB_tb), 
        .sum(sum_tb), 
        .carryIn(carryIn_tb), 
        .carryOut(carryOut_tb), 
        .sumVal(sumVal_tb));

initial begin
    $dumpfile("test_BCDAdder.vcd");
    $dumpvars(1, BCDAdder_tb);

    // Caso neutro, todas las entradas son 0. 
    inA_tb[3] = 1'b0; inA_tb[2] = 1'b0; inA_tb[1] = 1'b0; inA_tb[0] = 1'b0; // 0
    inB_tb[3] = 1'b0; inB_tb[2] = 1'b0; inB_tb[1] = 1'b0; inB_tb[0] = 1'b0; // 0
    carryIn_tb = 'b0; 
    #10; 

    // Caso en el que sumVal = 1.
    inA_tb[3] = 1'b0; inA_tb[2] = 1'b1; inA_tb[1] = 1'b0; inA_tb[0] = 1'b1; // 5
    inB_tb[3] = 1'b0; inB_tb[2] = 1'b0; inB_tb[1] = 1'b1; inB_tb[0] = 1'b1; // 3
    carryIn_tb = 'b0; 
    #10; 

    // Caso en el que sumVal = 0.
    inA_tb[3] = 1'b1; inA_tb[2] = 1'b0; inA_tb[1] = 1'b1; inA_tb[0] = 1'b0; // 10
    inB_tb[3] = 1'b0; inB_tb[2] = 1'b0; inB_tb[1] = 1'b0; inB_tb[0] = 1'b1; // 1
    carryIn_tb = 'b0; 
    #10;

    // Caso en el que no se necesite la corrección. 
    inA_tb[3] = 1'b0; inA_tb[2] = 1'b0; inA_tb[1] = 1'b1; inA_tb[0] = 1'b0; // 2
    inB_tb[3] = 1'b0; inB_tb[2] = 1'b0; inB_tb[1] = 1'b0; inB_tb[0] = 1'b1; // 1
    carryIn_tb = 'b0; 
    #10;

    // Caso en el que sí se necesite la corrección.
    inA_tb[3] = 1'b0; inA_tb[2] = 1'b1; inA_tb[1] = 1'b1; inA_tb[0] = 1'b1; // 7
    inB_tb[3] = 1'b0; inB_tb[2] = 1'b1; inB_tb[1] = 1'b0; inB_tb[0] = 1'b0; // 4
    carryIn_tb = 'b0; 
    #10;

    // Caso en el que no se necesite la corrección con carryIn = 1.
    inA_tb[3] = 1'b0; inA_tb[2] = 1'b1; inA_tb[1] = 1'b0; inA_tb[0] = 1'b1; // 5
    inB_tb[3] = 1'b0; inB_tb[2] = 1'b0; inB_tb[1] = 1'b0; inB_tb[0] = 1'b1; // 1
    carryIn_tb = 'b1; 
    #10;

    // Caso en el que inicialmente no se necesite la corrección por sus valores de entrada, pero con carryIn = 1. 
    inA_tb[3] = 1'b0; inA_tb[2] = 1'b1; inA_tb[1] = 1'b1; inA_tb[0] = 1'b0; // 6
    inB_tb[3] = 1'b0; inB_tb[2] = 1'b0; inB_tb[1] = 1'b1; inB_tb[0] = 1'b1; // 3
    carryIn_tb = 'b1; 
    #10;

    $finish; 
end

endmodule
