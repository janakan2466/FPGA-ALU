library verilog;
use verilog.vl_types.all;
entity Mooreblock_vlg_check_tst is
    port(
        leds            : in     vl_logic_vector(0 to 6);
        ledss           : in     vl_logic_vector(0 to 6);
        State           : in     vl_logic_vector(0 to 6);
        State_neg       : in     vl_logic_vector(0 to 6);
        sampler_rx      : in     vl_logic
    );
end Mooreblock_vlg_check_tst;
