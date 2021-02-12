library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std;
use ieee.std_logic_signed.all;
library work;

entity neg is
	port(
		A : in std_logic_vector(31 downto 0);
		output : out std_logic_vector(31 downto 0)
	);
end entity;


architecture behaviour of neg is
--define signal
signal result : std_logic_vector(31 downto 0);

begin
negate: process(result)
begin
	for i in 0 to 31 loop
		if A(i) = '0' then
			result(i) <= '1';
		else 
			result(i) <= '0'; 
		end if;
	end loop;
	
	output <= result + '1'; --"00000000000000000000000000000001";

end process;
end architecture;