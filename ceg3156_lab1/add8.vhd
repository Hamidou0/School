LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY add8 IS
	PORT (
		Cin: IN  STD_LOGIC;
		a: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		b: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		oper: IN STD_LOGIC;
		sum: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		Cout: OUT STD_LOGIC;
		CLK: IN STD_LOGIC
		);
END add8;

ARCHITECTURE logicAdd8 OF add8 IS
	SIGNAL carryout : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL c: STD_LOGIC;
	SIGNAL oprB : STD_LOGIC_VECTOR (7 DOWNTO 0);
	--SIGNAL sum: STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
	

PROCESS(CLK)
--	adder1: work.add4 PORT MAP(Cin, a(3 DOWNTO 0),b(3 DOWNTO 0),
--		oper, sum(3 DOWN 0), Cout, CLK);
--	adder1: work.add4 PORT MAP(Cout, a(7 DOWNTO 4),b(7 DOWNTO 4),
--		oper, sum(7 DOWN 4), Cout, CLK);
begin

		if (oper = '1') then
			oprB(0) <= NOT b(0);
			oprB(1) <= NOT b(1);
			oprB(2) <= NOT b(2);
			oprB(3) <= NOT b(3);
			oprB(4) <= NOT b(4);
			oprB(5) <= NOT b(5);
			oprB(6) <= NOT b(6);
			oprB(7) <= NOT b(7);
			c <= '1';
		else 
			oprB(0) <= b(0);
			oprB(1) <= b(1);
			oprB(2) <= b(2);
			oprB(3) <= b(3);
			oprB(4) <= b(4);
			oprB(5) <= b(5);
			oprB(6) <= b(6);
			oprB(7) <= b(7);
			c <= Cin;
		end if;

end process;
	

		bit0: work.onebitadder PORT MAP(c,a(0),oprB(0),sum(0),carryout(0));
	bit1: work.onebitadder PORT MAP(carryout(0),a(1),oprB(1),sum(1),carryout(1));
	bit2: work.onebitadder PORT MAP(carryout(1),a(2),oprB(2),sum(2),carryout(2));
	bit3: work.onebitadder PORT MAP(carryout(2),a(3),oprB(3),sum(3),carryout(3));
	bit4: work.onebitadder PORT MAP(carryout(3),a(4),oprB(4),sum(4),carryout(4));
	bit5: work.onebitadder PORT MAP(carryout(4),a(5),oprB(5),sum(5),carryout(5));
	bit6: work.onebitadder PORT MAP(carryout(5),a(6),oprB(6),sum(6),carryout(6));
	bit7: work.onebitadder PORT MAP(carryout(6),a(7),oprB(7),sum(7),Cout);

END logicAdd8;	
	