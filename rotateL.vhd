library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity rotateL is
	port(A: in std_logic_vector(31 downto 0);
			B: in std_logic_vector(31 downto 0);
			output: out std_logic_vector(31 downto 0));
end entity rotateL;

architecture behavioural of rotateL is
begin	
	
		output<= std_logic_vector(rotate_left(unsigned(A), to_integer(signed(B))));
end architecture behavioural;