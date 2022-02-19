LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY lab1 IS
	PORT (
		i_signA 	 	: IN STD_LOGIC;
		i_mantissaA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		i_exponentA : IN STD_LOGIC_VECTOR (6 DOWNTO 0);

		i_signB 		: IN STD_LOGIC;
		i_mantissaB	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		i_exponentB : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		
		op_select	: IN STD_LOGIC;
		
		
		GReset	 	: IN STD_LOGIC;
		GClock	 	: IN STD_LOGIC;
		
		signOut   	: OUT STD_LOGIC;
		overflow    : OUT STD_LOGIC;
		mantissaOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		exponentOut : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
		);
END lab1;

ARCHITECTURE logicLab1 OF lab1 IS

	signal signA 	 	: STD_LOGIC;
	signal mantissaA : STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
	signal exponentA : STD_LOGIC_VECTOR (6 DOWNTO 0):="0000000";

	signal signB 		: STD_LOGIC;
	signal mantissaB	: STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
	signal exponentB : STD_LOGIC_VECTOR (6 DOWNTO 0):="0000000";

	signal seting       : std_LOGIC; 
	signal exponentA_8b : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal exponentB_8b : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal exp_add : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal exp_diff : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal exp_norm : STD_LOGIC_VECTOR(6 DOWNTO 0);
	
	signal mantissa_mul: STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal mantissa_norm: STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	---FLOATING POINT ADDER SIGNALS
	signal init: STD_LOGIC;
	
	signal rrA : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal rrB : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal diff : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal diff_complement : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal count_range : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	signal mantissa_sum : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal add_result : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal add_result_comp : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal add_result_final : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal biggest_exponent : STD_LOGIC_VECTOR(6 DOWNTO 0);
	
	signal rrA_mux : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal rrB_mux : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	signal shiftAtorrA : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal shiftBtorrB : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	signal s0,s1,s2,s3,s4,s5,counter_reset,cr : std_LOGIC;
	
	signal shiftRA,shiftRB,com,storeM : std_LOGIC;
	signal sign, zero, count		    : std_LOGIC;
	
BEGIN
	PROCESS (GClock)
	begin 
	
	if GReset = '0' then
		seting <= '1';
	else
		seting <= '0';
	end if;
	END PROCESS;
	signOut <= signA xor signB;

	signA <= '0' when seting = '1'
					 else i_signA when seting = '0';
	signB <= '0' when seting = '1'
					 else i_signB when seting = '0';
	mantissaA <= "00000000" when seting = '1'
					 else i_mantissaA when seting = '0';
	mantissaB <= "00000000" when seting = '1'
					 else i_mantissaB when seting = '0';
	exponentA <= "0000000" when seting = '1'
					 else i_exponentA when seting = '0';
	exponentB <= "0000000" when seting = '1'
					 else i_exponentB when seting = '0';
					 
	extA: work.ext_6to8 PORT MAP (exponentA, exponentA_8b, GClock);
	extB: work.ext_6to8 PORT MAP (exponentB, exponentB_8b,GClock);
					 
	--MULTIPLICATION CONTROLS - SIGNALS
	ext_add: work.add8 PORT MAP('0',exponentA_8b,exponentB_8b,'0',exp_add,open,GClock);
	ext_diff: work.add8 PORT MAP('0',exp_add,"00111111",'1',exp_diff,open,GClock);
	exp_norm <= exp_diff(6 DOWNTO 0);
	
	man_mul: work.multi4 PORT MAP(mantissaA,mantissaB, mantissa_mul,overflow,open,GReset,GClock);
	man_normalization: work.normalization16to8 PORT MAP(mantissa_mul,mantissa_norm,GClock);
	
	--ADDER DATAPATH - CONTROLS
	
	counter_reset <= s1 or s3 or cr;
	cr_retain: work.dFF_2 PORT MAP(counter_reset,GClock,cr,open);
	
	exp_diff2: work.add8 PORT MAP('0',exponentA_8b,exponentB_8b,'1',diff,open,GClock);
	diff_cmp2: work.add8 PORT MAP('0',"00000000",diff,'1',diff_complement,open,GClock);
	sign <= not diff(7);
	zero <=  not (diff(0) or diff(1) or diff(2) or diff(3) or diff(4) or diff(5) or diff(6) or diff(7));
	
	counter_mux: work.mux2_1_8b PORT MAP (sign,diff_complement,diff,count_range);
	counter: work.upcounter_8b PORT MAP (GClock, counter_reset, count_range, open, count);
	init_counter: work.upcounter_8b PORT MAP (GClock, '1', "00001000", open, init);
	
	
	rrA_muxB: work.mux2_1_8b PORT MAP(shiftRA,mantissaA, shiftAtorrA, rrA);
	dff_rrAtoSfht: work.dff_8b PORT MAP(rrA, GCLock, rrA_mux);
	rrA_shiftR: work.right8 PORT MAP(rrA_mux,shiftAtorrA,GClock);
	
	rrB_muxB: work.mux2_1_8b PORT MAP(shiftRB,mantissaB, shiftBtorrB, rrB);
	dff_rrBtoSfht: work.dff_8b PORT MAP(rrB, GCLock, rrB_mux);
	rrB_shiftR: work.right8 PORT MAP(rrB_mux,shiftBtorrB,GClock);
	
	mant_sum: work.add8 PORT MAP('0',rrA,rrB,(signA xor signB),mantissa_sum,open,GClock);
	result_mux: work.dff_8b PORT MAP(mantissa_sum,storeM,add_result);
	
	add_result_2s: work.add8 PORT MAP('0',"00000000",add_result,'1',add_result_comp,open,GClock);
	add_result_choice: work.mux2_1_8b PORT MAP(not sign, add_result, add_result_comp,add_result_final);

	
	--ADDER CONTROLS SIGNALS
	s0_state: work.dFF_2 PORT MAP( '1',GClock,s0,open);
	s1_state: work.dFF_2 PORT MAP( init AND (s0 AND sign AND (not zero) AND (not count)), GClock, s1, open);
	s2_state: work.dFF_2 PORT MAP( init AND (s0 AND (not sign)), GClock, s2, open);
	s3_state: work.dFF_2 PORT MAP( init AND (s2 AND (not count)), GClock, s3, open);
	s4_state: work.dFF_2 PORT MAP( init AND ( s4 OR (s3 AND count) OR (s1 AND count) ),GClock,s5,open );
	s5_state: work.dFF_2 PORT MAP( init AND ( s0 AND sign AND zero ),GClock,s4,open );
	
	shiftRB <= s1;
	--complemnt selection signal remplaced with 'sign'
	shiftRA <= s3;
	storeM <= s1 or s3 or s4;
	
	--OUTPUT SIGNALS
	biggest_exponent <= ExponentA when sign = '1'
							  else ExponentB when sign = '0';
	
	mantissaOut <= mantissa_norm when op_select = '1'
						else add_result_final when op_select = '0';
	exponentOut <= exp_norm when op_select = '1'
						else biggest_exponent when op_select = '0';
						

END logicLab1;	