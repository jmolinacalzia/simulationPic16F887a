// Program Counter

module  ProgramCounter(
  input logic reset, clk,
  output logic [15:0] out
);
always @ (posedge clk or posedge reset)
    begin
      if (reset)
        out <=0;
      else
        out = out + 1;
    end
  endmodule

module testbench();
  logic clk, reset;
  logic [15:0] out;
  ProgramCounter Counter (.clk(clk), .out(out), .reset(reset));

//Simulation
initial begin
  $display (" \t\tTime \tClock \tReset \tOut");
  $monitor("%d \t%b \t%b \t%b",$time,clk,reset,out);

  //initial values
  clk=0;
  reset=0;
  //Reset Counter
  #1 reset=1;
  #1 reset=0;
end

//clock
initial begin
#500 $finish;
end
always begin
  #5 clk = ~clk;
  end
//Signals
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end
endmodule
