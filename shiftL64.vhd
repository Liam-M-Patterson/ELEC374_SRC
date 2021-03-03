library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity shiftL64 is
	port(A: in std_logic_vector(63 downto 0);
			B: in std_logic_vector(4 downto 0);
			output: out std_logic_vector(63 downto 0));
end entity shiftL64;

architecture behavioural of shiftL64 is
begin	
	
		output<= std_logic_vector(shift_left(unsigned(A), to_integer(signed(B))));
end architecture behavioural;