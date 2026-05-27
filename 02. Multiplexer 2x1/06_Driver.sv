class my_driver extends uvm_driver #(my_transaction);
  `uvm_component_utils(my_driver);
  virtual inter intf;
  
  function new(string name = "my_driver", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual inter)::get(this,"","intf",intf))
      `uvm_fatal("NODINTF","Virtual Interface not declared in driver");
  endfunction
  
  task run_phase(uvm_phase phase);
    forever begin
      @(posedge intf.clk);
      seq_item_port.get_next_item(req);
      intf.a = req.a;
      intf.b = req.b;
      intf.sel = req.sel;
      @(posedge intf.clk);
      seq_item_port.item_done();
    end
  endtask
  
endclass
