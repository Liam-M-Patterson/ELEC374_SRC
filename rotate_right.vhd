library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity rotate_right is
	port(input: in std_logic_vector(31 downto 0);
		  output: out std_logic_vector(31 downto 0));
end entity rotate_right;

architecture behavioural of rotate_right is
begin
	process(input)
	variable tmp: std_logic;
	begin
		tmp:= input(0);
		output(30 downto 0)<= input(31 downto 1);
		output(31)<=tmp;
	end process;
end architecture behavioural;