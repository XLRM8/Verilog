module fullAdder_tb;

//Inputs
reg inA_tb, inB_tb, carryIn_tb;
//Outputs
wire sum_tb, carryOut_tb;

fullAdder DUT(
    .inA(inA_tb),
    .inB(inB_tb),
    .carryIn(carryIn_tb),
    .sum(sum_tb),
    .carryOut(carryOut_tb)
);

initial begin
     $dumpfile("test.vcd");
     $dumpvars(1, fullAdder_tb);
     inA_tb = 1'b0; inB_tb = 1'b0; carryIn_tb = 1'b0;
     #10;
     {inA_tb,inB_tb, carryIn_tb } = 3'b000; #10;
     {inA_tb,inB_tb, carryIn_tb } = 3'b001; #10;
     {inA_tb,inB_tb, carryIn_tb } = 3'b010; #10;
     {inA_tb,inB_tb, carryIn_tb } = 3'b011; #10;
     {inA_tb,inB_tb, carryIn_tb } = 3'b100; #10;
     {inA_tb,inB_tb, carryIn_tb } = 3'b101; #10;
     {inA_tb,inB_tb, carryIn_tb } = 3'b110; #10;
     {inA_tb,inB_tb, carryIn_tb } = 3'b111; #50;
end

endmodule

