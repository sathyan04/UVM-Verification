class my_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(my_scoreboard);
  
  int pass_count;
  int fail_count;
  
  uvm_analysis_imp #(my_transaction, my_scoreboard) imp;
  
  function new(string name = "my_scoreboard", uvm_component parent);
    super.new(name, parent);
    pass_count = 0;
    fail_count = 0;
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    imp = new("imp",this);
  endfunction
  
  function void write(my_transaction tr);
    bit exp_y = tr.sel ? tr.b : tr.a;
    
    if (exp_y == tr.y) begin
      pass_count++;
      `uvm_info("SCOREBOARD",$sformatf("PASS: A:%0b B:%0b | SEL:%0b | Y:%0b",tr.a,tr.b,tr.sel,tr.y),UVM_LOW)
    end
    
    else begin
      fail_count++;
      `uvm_error("SCOREBOARD",$sformatf("FAIL: A:%0b B:%0b | SEL:%0b | Exp_Y:%0b | Act_Y:%0b",tr.a,tr.b,tr.sel,exp_y,tr.y));
    end
  endfunction
  
  function void report_phase(uvm_phase phase);
    `uvm_info("FINAL REPORT",$sformatf("PASS:%0d | FAIL:%0d",pass_count,fail_count),UVM_LOW)
  endfunction
  
endclass
