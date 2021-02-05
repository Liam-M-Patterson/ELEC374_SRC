library ieee;
use ieee.std_logic_1164.all;

entity ALU is
port(
	Ain : in std_logic_vector(31 downto 0);
	Bin : in std_logic_vector(31 downto 0);
	
	andS : in std_logic;
	orS : in std_logic;
	

	Cout : out std_logic_vector(63 downto 0)
);
end entity ALU;

architecture behavioural of ALU is

begin
ALU: process(Ain, Bin, andS, orS) is
begin
	if (andS = '1') then 
		Cout(63 downto 32) <= (others => '0');
		Cout(31 downto 0) <= Ain and Bin;
		
	elsif(orS ='1') then
		Cout(63 downto 32) <= (others => '0');
		Cout(31 downto 0) <= Ain or Bin;
	else
		Cout <= (others => '0');

	end if;
end process;
end architecture;