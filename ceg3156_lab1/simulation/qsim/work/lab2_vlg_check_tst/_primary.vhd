library verilog;
use verilog.vl_types.all;
entity lab2_vlg_check_tst is
    port(
        cout            : in     vl_logic_vector(2 downto 0);
        outp            : in     vl_logic_vector(7 downto 0);
        overf           : in     vl_logic_vector(7 downto 0);
        zero            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end lab2_vlg_check_tst;
