`include "interface.sv"

module half_addr (interf intr);
  assign {intr.carry, intr.sum} = intr.a + intr.b;
endmodule
