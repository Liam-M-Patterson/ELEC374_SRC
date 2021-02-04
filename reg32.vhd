library ieee;
use ieee.std_logic_1164.all;


entity reg32 is 
	port(
			d : in std_logic_vector(31 downto 0);
			q : out std_logic_vector(31 downto 0);
			clear, clock, enable : in std_logic
	);
end entity;

architecture behaviour of reg32 is 
begin
reg32 : process(clock, clear)
begin
	if(clear = '0') then
		q <= (others => '0');
	elsif (clock'event and clock = '1')	then
		if(enable = '1') then
			q <= d;
		end if;
	end if;
end process;
end architecture;