--------------------------------------------------
--	Full Adder using Half Adder Modules	--
--	(Full Adder Top Modules)		--
--	Training Source Code			--
--	Le Quy Don Technical University		--
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
port(
	clock	:	in	std_logic;
	cin	:	in	std_logic;
	a	:	in	std_logic;
	b	:	in	std_logic;
	sum	:	out	std_logic;
	CarryOut:	out	std_logic		
);
end entity;

architecture Behavioral of fulladder is 
	
	component halfadder is 
	port(
		Sum	:	out	std_logic;
		CarryOut:	out	std_logic;
		a	:	in	std_logic;
		b	:	in	std_logic			
	);
	end component;
	signal s1, c1, c2, SumWire:	std_logic;

begin

h1: halfadder port map (s1, c1, a, b);
h2: halfadder port map (SumWire, c2, s1, cin);
process (clock)
begin
	if (clock'event and clock ='1') then	
		CarryOut <= c1 or c2;
	end if;
end process;
end behavioral;
