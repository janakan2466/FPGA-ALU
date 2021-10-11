library verilog;
use verilog.vl_types.all;
entity Mealy is
    port(
        leds            : out    vl_logic_vector(0 to 6);
        clk             : in     vl_logic;
        data_in         : in     vl_logic;
        reset           : in     vl_logic;
        ledss           : out    vl_logic_vector(0 to 6);
        State           : out    vl_logic_vector(0 to 6);
        State_neg       : out    vl_logic_vector(0 to 6)
    );
end Mealy;
