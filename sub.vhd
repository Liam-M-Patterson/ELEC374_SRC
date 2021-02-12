library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std;
use ieee.std_logic_unsigned.all;



entity sub is
port(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		output : out std_logic_vector(63 downto 0)
	);
end entity;


architecture behaviour of sub is 

--define signals
signal negative : std_logic_vector(31 downto 0);
--signal difference : std_logic_vector(31 downto 0);
--signal negative: std_logic_vector(31 downto 0);



--map components
begin
subtract : process(A,B)
--variable localCarry : std_logic_vector(32 downto 0);
variable result : std_logic_vector(31 downto 0);
begin

--	for i in 0 to 31 loop
--			if B(i) = '0' then
--				result(i) <= '1';
--			else 
--				result(i) <= '0'; 
--			end if;
--		end loop;
	
	--negative <= result + '1';
	

	
		--localCarry(0) := '0';
--		for i in 0 to 31 loop
--			result(i) <= A(i) xor negative(i) xor localCarry(i);
--			localCarry(i+1) := (A(i) and negative(i)) or (localCarry(i) and (A(i) or negative(i)));
--		end loop;
		--output <= result;
		
		output(63 downto 32) <= (others => '1');
		output(31 downto 0) <= A - B;
		
		
		result := A - B;
		if result > A then
			output(63 downto 32) <= (others => '1');
			output(31 downto 0) <=  A - B;
		else 
			output(63 downto 32) <= (others => '0');
			output(31 downto 0) <= A - B;
		end if;
--		output(63 downto 32) <= (others => '0');
--		output(31 downto 0) <=  result;
		
end process;
end architecture;