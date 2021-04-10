library ieee;
use ieee.std_logic_1164.all;

entity reg0 is
	port(
			d : in std_logic_vector(31 downto 0);
			q : out std_logic_vector(31 downto 0);
			clear, clock, enable : in std_logic;
			BAout : in std_logic
	);
end entity reg0;

architecture behaviour of reg0 is
signal reg0Out : std_logic_vector(31 downto 0);
begin
reg32 : process(clock, clear, BAout)
begin
	if(clear = '1') then
		reg0Out <= (others => '0');
	elsif (clock'event and clock = '1')	then
		if(enable = '1') then
			reg0Out <= d;
		end if;
	end if;
	
	if(BAout = '1') then
		q <= (others => '0');
	else 
		q <= reg0Out;
	end if;
end process;
end architecture behaviour;
