library ieee;
use ieee.std_logic_1164.all;

entity control_unit is 
port(
	clk, reset, stop : in std_logic;
	IRin : in std_logic_vector(31 downto 0);
	--HIin, LOin, PCin, IRin, Yin, Zin, MARin, MDRin, OutPortin : in std_logic;
	--R0out R0in, R1out, R1in, R2out, R2in, R3out, R3in, R4out, R4in, R5out, R5in, R6out, R6in, R7out, R7in : out
	
	PCout, Zhighout, Zlowout, Rin, MDRout, LOout, Rout, Gra, Grb, Grc : out std_logic
	);
	
end entity;

architecture behaviour of control_unit is

end architecture;