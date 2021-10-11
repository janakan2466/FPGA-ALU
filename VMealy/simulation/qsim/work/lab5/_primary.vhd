library verilog;
use verilog.vl_types.all;
entity lab5 is
    port(
        clk             : in     vl_logic;
        data_in         : in     vl_logic;
        reset           : in     vl_logic;
        student_id      : out    vl_logic_vector(3 downto 0);
        current_state   : out    vl_logic_vector(3 downto 0)
    );
end lab5;
