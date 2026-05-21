class my_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(my_scoreboard);

  uvm_analysis_imp #(my_transaction, my_scoreboard) imp;

  int pass_count;
  int fail_count;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    pass_count = 0;
    fail_count = 0;
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    imp = new("imp",this);
  endfunction

  function void write(my_transaction tr);
    //this function is called whenever ap.write(tr) is invoked
    bit exp_sum = tr.a ^ tr.b;
    bit exp_carry = tr.a & tr.b;

    if(tr.sum == exp_sum && tr.carry == exp_carry)begin
      pass_count++;
      `uvm_info("SCOREBOARD",$sformatf("PASS: a=%0b b=%0b | sum=%0b carry=%0b",tr.a,tr.b,tr.sum,tr.carry),UVM_LOW);
    end

    else begin
      fail_count++;
      `uvm_error("SCOREBOARD",$sformatf("FAIL: a=%0b b=%0b | expected: sum=%0b carry=%0b | actual: sum=%0b carry=%0b",tr.a,tr.b,exp_sum,exp_carry,tr.sum,tr.carry));
    end

  endfunction

  function void report_phase (uvm_phase phase);
    `uvm_info("SCOREBOARD",$sformatf("FINAL RESULTS: Pass=%0d | Fail=%0d",pass_count,fail_count),UVM_LOW);
  endfunction
  
endclass
