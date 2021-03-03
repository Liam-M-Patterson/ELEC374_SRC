library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity shift_right is
	port(input: in std_logic_vector(31 downto 0);
		  output: out std_logic_vector(31 downto 0));
end entity shift_right;

architecture behavioural of shift_right is
begin
		output(30 downto 0)<= input(31 downto 1);
		output(31)<= '0';
end architecture behavioural;