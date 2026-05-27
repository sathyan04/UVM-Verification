class my_sequence extends uvm_sequence #(my_transaction);
  `uvm_object_utils(my_sequence)
  
  function new(string name = "my_sequence");
    super.new(name);
  endfunction
  
  task body();
    my_transaction tr;
    repeat(10) `uvm_do(tr)
  endtask
      
endclass
