library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity shift_left is
	port(input: in std_logic_vector(31 downto 0);
			output: out std_logic_vector(31 downto 0));
end entity shift_left;

architecture behavioural of shift_left is
begin	
	process
	begin
		output(31 downto 1)<= input(30 downto 0);
		output(0)<= '0';
	end process;
end architecture behavioural;