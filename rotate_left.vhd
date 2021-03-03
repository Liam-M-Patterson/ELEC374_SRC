library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity rotate_left is
	port(input: in std_logic_vector(31 downto 0);
		  output: out std_logic_vector(31 downto 0));
end entity rotate_left;

architecture behavioural of rotate_left is
begin
	process(input)
	variable tmp: std_logic;
	begin
		tmp:= input(31);
		output(31 downto 1)<= input(30 downto 0);
		output(0)<=tmp;
	end process;
end architecture behavioural;