library ieee;
use ieee.std_logic_1164.all;

entity shiftR_tb is
end entity;

architecture behaviour of shiftR_tb is
	signal input: std_logic_vector(31 downto 0);
	signal output : std_logic_vector(31 downto 0);
	
component shiftR is
	port(input: in std_logic_vector(31 downto 0);
		  output: out std_logic_vector(31 downto 0));
end component shiftR;

	begin
	shifter : shiftR port map(
		input => input,
		output => output);

	simulate : process(input)
		begin
		input <= "00000011000000110000001100000011";
		output <= "00000000000000000000000000000000";
	end process;

end architecture;