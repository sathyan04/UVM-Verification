import uvm_pkg::*;
`include "uvm_macros.svh"

`include "transaction.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module testbench();
  logic clk;
  inter intf(.clk(clk));
  mux dut(intf);
  
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end
  
  initial begin
    uvm_config_db #(virtual inter)::set(null,"*.agt.*","intf",intf);
    run_test("my_test");
  end
  
endmodule
