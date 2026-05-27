`include "interface.sv"

module mux(inter intf);
  assign intf.y = intf.sel ? intf.b : intf.a;
endmodule
