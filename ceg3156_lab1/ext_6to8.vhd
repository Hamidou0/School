LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ext_6to8 IS
	PORT (
		input1: IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		
		a: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

		CLK: IN STD_LOGIC);
END ext_6to8;

ARCHITECTURE logic_ext OF ext_6to8 IS

BEGIN

			i0: work.dFF_2 PORT MAP(input1(0), CLK, a(0), open);
			i1: work.dFF_2 PORT MAP(input1(1), CLK, a(1), open);
			i2: work.dFF_2 PORT MAP(input1(2), CLK, a(2), open);
			i3: work.dFF_2 PORT MAP(input1(3), CLK, a(3), open);
			i4: work.dFF_2 PORT MAP(input1(4), CLK, a(4), open);
			i5: work.dFF_2 PORT MAP(input1(5), CLK, a(5), open);
			i6: work.dFF_2 PORT MAP(input1(6), CLK, a(6), open);
			i7: work.dFF_2 PORT MAP('0', CLK, a(7), open);

END logic_ext;	
	