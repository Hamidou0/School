library ieee;
use ieee.std_logic_1164.all;

entity dff_16b is
	port (
			s    : IN std_logic_vector(15 downto 0);
			CLK  : IN STD_LOGIC;
			s_o  : OUT std_logic_vector(15 downto 0)
			
	);

end dff_16b;

architecture ff of dff_16b is
	
	BEGIN
	
  			i0: work.dFF_2 PORT MAP(s(0), CLK, s_o(0), open);
			i1: work.dFF_2 PORT MAP(s(1), CLK, s_o(1), open);
			i2: work.dFF_2 PORT MAP(s(2), CLK, s_o(2), open);
			i3: work.dFF_2 PORT MAP(s(3), CLK, s_o(3), open);
			i4: work.dFF_2 PORT MAP(s(4), CLK, s_o(4), open);
			i5: work.dFF_2 PORT MAP(s(5), CLK, s_o(5), open);
			i6: work.dFF_2 PORT MAP(s(6), CLK, s_o(6), open);
			i7: work.dFF_2 PORT MAP(s(7), CLK, s_o(7), open);
			i8: work.dFF_2 PORT MAP(s(8), CLK, s_o(8), open);
			i9: work.dFF_2 PORT MAP(s(9), CLK, s_o(9), open);
		   i10: work.dFF_2 PORT MAP(s(10), CLK, s_o(10), open);
			i11: work.dFF_2 PORT MAP(s(11), CLK, s_o(11), open);
			i12: work.dFF_2 PORT MAP(s(12), CLK, s_o(12), open);
			i13: work.dFF_2 PORT MAP(s(13), CLK, s_o(13), open);
			i14: work.dFF_2 PORT MAP(s(14), CLK, s_o(14), open);
			i15: work.dFF_2 PORT MAP(s(15), CLK, s_o(15), open);



end ff;
