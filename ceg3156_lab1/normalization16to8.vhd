LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY normalization16to8 IS
	PORT (
		input: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		
		output: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

		CLK: IN STD_LOGIC);
END normalization16to8;

ARCHITECTURE logic_norm OF normalization16to8 IS
	SHARED VARIABLE n: integer range 0 to 15 :=7;
	
BEGIN
	
	PROCESS(CLK)
	BEGIN
		IF input(15) = '1' then
			n := 15;
		ELSIF input(14) = '1' then
			n := 14;
		ELSIF input(13) = '1' then
			n := 13;
		ELSIF input(12) = '1' then
			n := 12;
		ELSIF input(11) = '1' then
			n := 11;
		ELSIF input(10) = '1' then
			n := 10;
		ELSIF input(9) = '1' then
			n := 9;
		ELSIF input(8) = '1' then
			n := 8;
		ELSE
			n := 7;
		END IF;
	
	END PROCESS;
			
	output <= input(n DOWNTO n-7);

END logic_norm;	
	