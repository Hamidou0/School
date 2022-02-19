LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY upcounter_8b IS
PORT (Clock, Resetn: IN STD_LOGIC ;
			target: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			o : OUT STD_LOGIC) ;
END upcounter_8b;
ARCHITECTURE logic OF upcounter_8b IS
	SIGNAL output: STD_LOGIC;
	SIGNAL Count : std_logic_vector(7 DOWNTO 0);
BEGIN
	PROCESS ( Clock , Resetn)
	BEGIN
		IF Count = "00000000" THEN
			o <= '0';
		END IF;
		IF Resetn = '0' THEN
			Count <= "00000000";
			o <= '0';
		ELSIF Count = target THEN
			o <= '1';
		ELSIF rising_edge(Clock) THEN
			Count <= Count + 1 ;
		END IF;
	END PROCESS;
	
	
Q <= Count;

END logic;