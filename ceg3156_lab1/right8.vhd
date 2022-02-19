LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY right8 IS
	PORT (
		a: IN STD_LOGIC_VECTOR(7 DOWNTO 0);

		o: OUT STD_LOGIC_VECTOR (7 DOWNTO 0) ;

		CLK: IN STD_LOGIC);
END right8;

ARCHITECTURE logicRight8 OF right8 IS
	--SIGNAL o: STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
	
		o0 : work.dFF_2 PORT MAP( '0', CLK, o(7),open);
		o9 : work.dFF_2 PORT MAP(a(7), CLK, o(6),open);
		o10: work.dFF_2 PORT MAP(a(6), CLK, o(5),open);
		o11: work.dFF_2 PORT MAP(a(5), CLK, o(4),open);
		o12: work.dFF_2 PORT MAP(a(4), CLK, o(3),open);
		o13: work.dFF_2 PORT MAP(a(3), CLK, o(2),open);
		o14: work.dFF_2 PORT MAP(a(2), CLK, o(1),open);
		o15: work.dFF_2 PORT MAP(a(1), CLK, o(0),open);
		
END logicRight8;	


	