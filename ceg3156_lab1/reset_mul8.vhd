LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reset_mul8 IS
	PORT (
		input1: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		input2: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		
		a: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		b: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		
		
		CLK: IN STD_LOGIC);
END reset_mul8;

ARCHITECTURE logicreset_mul8 OF reset_mul8 IS

BEGIN

			i0: work.dFF_2 PORT MAP(input1(0), CLK, a(0), open);
			i1: work.dFF_2 PORT MAP(input1(1), CLK, a(1), open);
			i2: work.dFF_2 PORT MAP(input1(2), CLK, a(2), open);
			i3: work.dFF_2 PORT MAP(input1(3), CLK, a(3), open);
			i4: work.dFF_2 PORT MAP(input1(4), CLK, a(4), open);
			i5: work.dFF_2 PORT MAP(input1(5), CLK, a(5), open);
			i6: work.dFF_2 PORT MAP(input1(6), CLK, a(6), open);
			i7: work.dFF_2 PORT MAP(input1(7), CLK, a(7), open);
			i8: work.dFF_2 PORT MAP('0', CLK, a(8), open);
			i9: work.dFF_2 PORT MAP('0', CLK, a(9), open);
			i10: work.dFF_2 PORT MAP('0', CLK, a(10), open);
			i11: work.dFF_2 PORT MAP('0', CLK, a(11), open);
			i12: work.dFF_2 PORT MAP('0', CLK, a(12), open);
			i13: work.dFF_2 PORT MAP('0', CLK, a(13), open);
			i14: work.dFF_2 PORT MAP('0', CLK, a(14), open);
			i15: work.dFF_2 PORT MAP('0', CLK, a(15), open);
			
			ii0: work.dFF_2 PORT MAP(input2(0), CLK, b(0), open);
			ii1: work.dFF_2 PORT MAP(input2(1), CLK, b(1), open);
			ii2: work.dFF_2 PORT MAP(input2(2), CLK, b(2), open);
			ii3: work.dFF_2 PORT MAP(input2(3), CLK, b(3), open);
			ii4: work.dFF_2 PORT MAP(input2(4), CLK, b(4), open);
			ii5: work.dFF_2 PORT MAP(input2(5), CLK, b(5), open);
			ii6: work.dFF_2 PORT MAP(input2(6), CLK, b(6), open);
			ii7: work.dFF_2 PORT MAP(input2(7), CLK, b(7), open);
			ii8: work.dFF_2 PORT MAP('0', CLK, b(8), open);
			ii9: work.dFF_2 PORT MAP('0', CLK, b(9), open);
			ii10: work.dFF_2 PORT MAP('0', CLK, b(10), open);
			ii11: work.dFF_2 PORT MAP('0', CLK, b(11), open);
			ii12: work.dFF_2 PORT MAP('0', CLK, b(12), open);
			ii13: work.dFF_2 PORT MAP('0', CLK, b(13), open);
			ii14: work.dFF_2 PORT MAP('0', CLK, b(14), open);
			ii15: work.dFF_2 PORT MAP('0', CLK, b(15), open);
	
END logicreset_mul8;	
	