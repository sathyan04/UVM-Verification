class my_monitor extends uvm_monitor;
  `uvm_component_utils(my_monitor);
  virtual inter intf;
  
  uvm_analysis_port #(my_transaction) ap;
  
  function new(string name = "my_monitor", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    ap = new("ap",this);
    if(!uvm_config_db #(virtual inter)::get(this,"","intf",intf))
      `uvm_fatal("NOMNTF","Virtual Interface not declared in monitor");
  endfunction
  
  task run_phase(uvm_phase phase);
    my_transaction tr;
    forever begin
      @(posedge intf.clk);
      tr = my_transaction::type_id::create("tr");
      tr.a = intf.a;
      tr.b = intf.b;
      tr.sel = intf.sel;
      tr.y = intf.y;
      ap.write(tr);
    end
  endtask
  
endclass
