library ieee;
use ieee.std_logic_1164.all;

entity cla_16b is
	port (
			a  : IN std_logic_vector(15 downto 0);
			b  : IN std_logic_vector(15 downto 0);

			C0 : IN std_logic;
			s  : OUT std_logic_vector(15 downto 0);
			c16 : OUT std_logic
	);

end cla_16b;

architecture adder of cla_16b is

	--carry generate signal
	signal g0, g1, g2, g3, g4,g5,g6,g7,g8,g9 : std_logic;
	signal g10, g11, g12, g13, g14,g15 : std_logic;
	
	signal p0, p1, p2, p3, p4,p5,p6,p7,p8,p9 : std_logic;
	signal p10, p11, p12, p13, p14,p15 : std_logic;
	
	signal c1, c2, c3, c4,c5,c6,c7,c8,c9 : std_logic;
	signal c10, c11, c12, c13, c14,c15 : std_logic;
	
	BEGIN
	g0 <= a(0) and b(0);
	g1 <= a(1) and b(1);
	g2 <= a(2) and b(2);
	g3 <= a(3) and b(3);
	g4 <= a(4) and b(4);
	g5 <= a(5) and b(5);
	g6 <= a(6) and b(6);
	g7 <= a(7) and b(7);
	g8 <= a(8) and b(8);
	g9 <= a(9) and b(9);
	g10 <= a(10) and b(10);
	g11 <= a(11) and b(11);
	g12 <= a(12) and b(12);
	g13 <= a(13) and b(13);
	g14 <= a(14) and b(14);
	g15 <= a(15) and b(15);

	--carry prpagate signals
	

	p0 <= a(0) xor b(0);
	p1 <= a(1) xor b(1);
	p2 <= a(2) xor b(2);
	p3 <= a(3) xor b(3);
	p4 <= a(4) xor b(4);
	p5 <= a(5) xor b(5);
	p6 <= a(6) xor b(6);
	p7 <= a(7) xor b(7);
	p8 <= a(8) xor b(8);
	p9 <= a(9) xor b(9);
	p10 <= a(10) xor b(10);
	p11 <= a(11) xor b(11);
	p12 <= a(12) xor b(12);
	p13 <= a(13) xor b(13);
	p14 <= a(14) xor b(14);
	p15 <= a(15) xor b(15);
	--carry signals


  c1 <= g0 or (p0 and c0);
  c2 <= g1 or (p1 and c1);
  c3 <= g2 or (p2 and c2);
  c4 <= g3 or (p3 and c3);
  c5 <= g4 or (p4 and c4);
  c6 <= g5 or (p5 and c5);
  c7 <= g6 or (p6 and c6);
  c8 <= g7 or (p7 and c7);
  c9 <= g8 or (p8 and c8);
  c10 <= g9 or (p9 and c9);
  c11 <= g10 or (p10 and c10);
  c12 <= g11 or (p11 and c11);
  c13 <= g12 or (p12 and c12);
  c14 <= g13 or (p13 and c13);
  c15 <= g14 or (p14 and c14);
  c16 <= g15 or (p15 and c15);

	--sum output

  add1 : work.onebitadder port map (c0 ,a(0), b(0), s(0), open);
  add2 : work.onebitadder port map (c1 ,a(1), b(1), s(1), open);
  add3 : work.onebitadder port map (c2 ,a(2), b(2), s(2), open);
  add4 : work.onebitadder port map (c3 ,a(3), b(3), s(3), open);
  add5 : work.onebitadder port map (c4 ,a(4), b(4), s(4), open);
  add6 : work.onebitadder port map (c5 ,a(5), b(5), s(5), open);
  add7 : work.onebitadder port map (c6 ,a(6), b(6), s(6), open);
  add8 : work.onebitadder port map (c7 ,a(7), b(7), s(7), open);
  add9 : work.onebitadder port map (c8 ,a(8), b(8), s(8), open);
  add10 : work.onebitadder port map (c9 ,a(9), b(9), s(9), open);
  add11 : work.onebitadder port map (c10 ,a(10), b(10), s(10), open);
  add12 : work.onebitadder port map (c11 ,a(11), b(11), s(11), open);
  add13 : work.onebitadder port map (c12 ,a(12), b(12), s(12), open);
  add14 : work.onebitadder port map (c13 ,a(13), b(13), s(13), open);
  add15 : work.onebitadder port map (c14 ,a(14), b(14), s(14), open);
  add16 : work.onebitadder port map (c15 ,a(15), b(15), s(15), open);



end adder;
