library ieee;
use ieee.std_logic_1164.all;
entity div_tb is
end entity;




architecture behaviour of div_tb is
component division is 
	port( Divisor, Dividend: in std_logic_vector(31 downto 0);
			Quotient: out std_logic_vector(63 downto 0));
end component;
signal Divisor, Dividend : std_logic_vector(31 downto 0);
signal Quotient : std_logic_vector(63 downto 0);
begin
divide : division
port map(
	Divisor => Divisor,
	Dividend => Dividend,
	Quotient => Quotient
	);
	
	process
	begin

	Divisor <= x"0000000A";
	Dividend <= x"00100005";
	wait for 35 ns;
	Divisor <= x"0000001A";
	Dividend <= x"00000004";
	wait for 35 ns;
	Divisor <= x"0000001A";
	Dividend <= x"00001002";
	wait for 35 ns;
	end process;
end architecture;