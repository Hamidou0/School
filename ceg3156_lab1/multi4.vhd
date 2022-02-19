LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY multi4 IS
	PORT (
		input1: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		input2: IN STD_LOGIC_VECTOR(7 DOWNTO 0);

		outp: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		cout: OUT STD_LOGIC;
		zero: OUT STD_LOGIC;
		
--		OUTCHECK_O2: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
--		OUTCHECK_A2: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
--		OUTCHECK_O1: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
--		OUTCHECK_A1: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
--		OUTCHECK_I : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
--		OUTCHECK_MUXA2: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
--		OUTCHECK_MUXA: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
--		OUTCHECK_MUXO: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		
		reset: IN STD_LOGIC;
		CLK: IN STD_LOGIC);
END multi4;

ARCHITECTURE logicMulti4 OF multi4 IS


	TYPE State_type IS (S1, S2, S3, S4, S5);
	SIGNAL y: State_type;
	SIGNAL I: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL seting: STD_LOGIC;

	SIGNAL a : STD_LOGIC_VECTOR(15 DOWNTO 0):="0000000000000000";
	SIGNAL b: STD_LOGIC_VECTOR (15 DOWNTO 0):="0000000000000000";


	--BUFFER SIGNAL FOR MUX
	SIGNAL a1: STD_LOGIC_VECTOR (15 DOWNTO 0):="0000000000000000";
	SIGNAL o1: STD_LOGIC_VECTOR (15 DOWNTO 0):="0000000000000000";
	SIGNAL a2: STD_LOGIC_VECTOR (15 DOWNTO 0):="0000000000000000";
	SIGNAL dff_a: STD_LOGIC_VECTOR (15 DOWNTO 0):="0000000000000000";
	SIGNAL buffr_a2: STD_LOGIC_VECTOR (15 DOWNTO 0):="0000000000000000";
	SIGNAL o2: STD_LOGIC_VECTOR (15 DOWNTO 0):="0000000000000000";
	SIGNAL a3: STD_LOGIC_VECTOR (15 DOWNTO 0):="0000000000000000";
	
	
	SIGNAL mux_o: STD_LOGIC_VECTOR (15 DOWNTO 0):="0000000000000000";
	SIGNAL mux_a: STD_LOGIC_VECTOR (15 DOWNTO 0):="0000000000000000";
	SIGNAL mux_a2: STD_LOGIC_VECTOR (15 DOWNTO 0):="0000000000000000";
	
	
	
	SIGNAL sel: STD_LOGIC;
	SIGNAL loadShift: STD_LOGIC;

BEGIN

state_trans:PROCESS(reset,CLK)
begin
	if reset = '0' then
		y <= S1;
	elsif(CLK'EVENT and CLK = '1') then
		case y is
			when S1 => 
			IF input2(to_integer(unsigned(I))) = '1' THEN y<= S2; ELSE y<= S3;  END IF;
			when S2 => 
			IF to_integer(unsigned(I)) = 7 THEN y<= S5; ELSE y<= S4; END IF;
			when S3 => 
			IF to_integer(unsigned(I)) = 7 THEN y<= S5; ELSE y<= S4; END IF;
			when S4 =>
			IF input2(to_integer(unsigned(I))) = '1' THEN y<= S2; ELSE y<= S3;  END IF;
			when S5 => null;
		end case;
	end if;
	
end process;

control_out: PROCESS (CLK)
begin
	if(CLK'EVENT and CLK = '1') then
		
		case y is
			when S1 => 
				sel<='0';
				seting <= '1';I<="0000";
				loadShift <= '1'; 
			when S2 => 
				sel<='1'; seting<='0';
				loadShift <= '0';
				I <= STD_LOGIC_VECTOR ( unsigned(I) + 1);
			when S3 => 
				sel<='0'; seting<='0';
				loadShift <= '0';
				I <= STD_LOGIC_VECTOR ( unsigned(I) + 1);
			when S4 => 
				seting<='0'; sel<='0'; 
				loadShift <= '1'; 
			when S5 =>
				sel<='0';seting<='0';
				loadShift <= '0';
		end case;
	end if;
	
end process;

	reseting: work.reset_mul8 PORT MAP(input1, input2, a, b, CLK);
	a2_ff: work.dff_16b PORT MAP(a2, CLK, buffr_a2);
	a2_mux: work.mux2_1_16b PORT MAP(loadShift,buffr_a2, mux_a2, a2);
	a1_mux: work.mux2_1_16b PORT MAP(seting,a2, a, dff_a);
	dffPlane_2: work.dff_16b PORT MAP(dff_a, CLK, a1);
	o1_mux: work.mux2_1_16b PORT MAP(seting, o2, "0000000000000000", mux_o);
	adder_mux: work.mux2_1_16b PORT MAP(sel,"0000000000000000", a1,a3);
	adder: work.cla_16b PORT MAP(o1, a3, '0', o2, cout);
	dffPlane_o: work.dff_16b PORT MAP(mux_o, CLK, o1);
	left_shift: work.left8 PORT MAP(a1, mux_a2, CLK);
	zero_c: work.check_zero PORT MAP(o2, zero);
	outp <= o2;

--	OUTCHECK_A1<=a1;
--	OUTCHECK_A2<=a2;
--	OUTCHECK_O1<=o1;
--	OUTCHECK_O2<=o2;
--	OUTCHECK_I<=I;
--	OUTCHECK_MUXO<=mux_o;
--	OUTCHECK_MUXA<=a3;
--	OUTCHECK_MUXA2<=mux_a2;
	
END logicMulti4;	