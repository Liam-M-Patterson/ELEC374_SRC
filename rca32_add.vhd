library ieee;
use ieee.std_logic_1164.all;

entity rca32_add is
	port(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		result : out std_logic_vector(31 downto 0)
		);
end entity;

architecture behaviour of rca32_add is

begin
	RippleCarryAdder:
	process(A, B)
	variable localCarry : std_logic_vector(32 downto 0);
	begin
		localCarry(0) := '0';
		for i in 0 to 31 loop
			result(i) <= A(i) xor B(i) xor localCarry(i);
			localCarry(i+1) := (A(i) and B(i)) or (localCarry(i) and (A(i) or B(i)));
		end loop;
	end process;	
end architecture;
