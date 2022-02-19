library verilog;
use verilog.vl_types.all;
entity lab2 is
    port(
        input1          : in     vl_logic_vector(3 downto 0);
        input2          : in     vl_logic_vector(3 downto 0);
        outp            : out    vl_logic_vector(7 downto 0);
        cout            : out    vl_logic_vector(2 downto 0);
        zero            : out    vl_logic;
        overf           : out    vl_logic_vector(7 downto 0);
        reset           : in     vl_logic;
        CLK             : in     vl_logic
    );
end lab2;
