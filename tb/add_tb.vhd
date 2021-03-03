library ieee;
use ieee.std_logic_all.1164;

entity add_tb is
end entity;

architecture behaviour of add_tb is
	signal A : std_logic_vector(31 downto 0);
	signal B : std_logic_vector(31 downto 0);
	
	signal result : std_logic_vector(31 downto 0);
	
	component rca32_add is
	
		port(
			A : in std_logic_vector(31 downto 0);
			B : in std_logic_vector(31 downto 0);
			result : out std_logic_vector(31 downto 0)
			);
			
		end component;
		
begin
adder : rca32_add port map(
	A <= A,
	B <= B, 
	result <= add_result 
);

simulate : process
begin


	A <= "00000000000000000000000000000001";
	B <= "00000000000000000000000000000001";
	result <= add_result;
	end process;
end architecture;
