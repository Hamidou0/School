LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY left8 IS
	PORT (
		a: IN STD_LOGIC_VECTOR(15 DOWNTO 0);

		o: OUT STD_LOGIC_VECTOR (15 DOWNTO 0) ;

		CLK: IN STD_LOGIC);
END left8;

ARCHITECTURE logicLeft8 OF left8 IS
	--SIGNAL o: STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
	
		o0 : work.dFF_2 PORT MAP(a(14), CLK, o(15),open);
		o1 : work.dFF_2 PORT MAP(a(13), CLK, o(14),open);
		o2 : work.dFF_2 PORT MAP(a(12), CLK, o(13),open);
		o3 : work.dFF_2 PORT MAP(a(11), CLK, o(12),open);
		o4 : work.dFF_2 PORT MAP(a(10), CLK, o(11),open);
		o5 : work.dFF_2 PORT MAP(a(9), CLK, o(10),open);
		o6 : work.dFF_2 PORT MAP(a(8), CLK, o(9),open);
		o7 : work.dFF_2 PORT MAP(a(7), CLK, o(8),open);	
		o8 : work.dFF_2 PORT MAP(a(6), CLK, o(7),open);
		o9 : work.dFF_2 PORT MAP(a(5), CLK, o(6),open);
		o10: work.dFF_2 PORT MAP(a(4), CLK, o(5),open);
		o11: work.dFF_2 PORT MAP(a(3), CLK, o(4),open);
		o12: work.dFF_2 PORT MAP(a(2), CLK, o(3),open);
		o13: work.dFF_2 PORT MAP(a(1), CLK, o(2),open);
		o14: work.dFF_2 PORT MAP(a(0), CLK, o(1),open);
		o15: work.dFF_2 PORT MAP('0', CLK, o(0),open);
		
END logicLeft8;	


	