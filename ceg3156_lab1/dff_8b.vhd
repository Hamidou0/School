library ieee;
use ieee.std_logic_1164.all;

entity dff_8b is
	port (
			s    : IN std_logic_vector(7 downto 0);
			CLK  : IN STD_LOGIC;
			s_o  : OUT std_logic_vector(7 downto 0)
			
	);

end dff_8b;

architecture ff of dff_8b is
	
	BEGIN
	
  			i0: work.dFF_2 PORT MAP(s(0), CLK, s_o(0), open);
			i1: work.dFF_2 PORT MAP(s(1), CLK, s_o(1), open);
			i2: work.dFF_2 PORT MAP(s(2), CLK, s_o(2), open);
			i3: work.dFF_2 PORT MAP(s(3), CLK, s_o(3), open);
			i4: work.dFF_2 PORT MAP(s(4), CLK, s_o(4), open);
			i5: work.dFF_2 PORT MAP(s(5), CLK, s_o(5), open);
			i6: work.dFF_2 PORT MAP(s(6), CLK, s_o(6), open);
			i7: work.dFF_2 PORT MAP(s(7), CLK, s_o(7), open);




end ff;
