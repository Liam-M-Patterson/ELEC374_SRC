library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity shiftR is
	port(A: in std_logic_vector(31 downto 0);
			B: in std_logic_vector(31 downto 0);
			output: out std_logic_vector(31 downto 0));
end entity shiftR;

architecture behavioural of shiftR is
begin	
	
		output<= std_logic_vector(shift_right(unsigned(A), to_integer(signed(B))));
end architecture behavioural;