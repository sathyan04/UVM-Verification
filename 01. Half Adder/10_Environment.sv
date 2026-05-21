class my_env extends uvm_env;
  `uvm_component_utils(my_env)
  
  my_agent agt;
  my_scoreboard scb;
  
  function new(string name="my_env", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = my_agent::type_id::create("agt",this);
    scb = my_scoreboard::type_id::create("scb",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agt.ap.connect(scb.imp);
  endfunction
  
endclass
