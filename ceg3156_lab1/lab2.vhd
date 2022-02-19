LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY lab2 IS
	PORT (
		signA 	 	: IN STD_LOGIC;
		mantissaA 	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		exponentA 	: IN STD_LOGIC_VECTOR (6 DOWNTO 0);

		signB 		: IN STD_LOGIC;
		mantissaB	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		exponentB 	: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		
		GReset	 	: IN STD_LOGIC;
		GClock	 	: IN STD_LOGIC;
		
		signOut   	: OUT STD_LOGIC;
		overflow    : OUT STD_LOGIC;
		mantissaOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		exponentOut : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
		);
END lab2;

ARCHITECTURE logicLab2 OF lab2 IS

	signal seting : std_LOGIC; 
BEGIN
	PROCESS (GClock)
	begin 
	
	if GReset = '0' then
		seting <= '1';
	else
		seting <= '0';
	end if;
	END PROCESS;

	
END logicLab2;	