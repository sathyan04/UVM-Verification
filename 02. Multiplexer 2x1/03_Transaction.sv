class my_transaction extends uvm_sequence_item;
  rand bit a;
  rand bit b;
  rand bit sel;
  bit y;
  
  `uvm_object_utils_begin(my_transaction)
  `uvm_field_int(a,UVM_ALL_ON);
  `uvm_field_int(b,UVM_ALL_ON);
  `uvm_field_int(sel,UVM_ALL_ON);
  `uvm_field_int(y,UVM_ALL_ON);
  `uvm_object_utils_end
  
  function new(string name = "my_transaction");
    super.new(name);
  endfunction
  
endclass
