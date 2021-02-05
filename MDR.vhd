library ieee;
use ieee.std_logic_1164.all;
library work;


entity MDR is
	port(
			clear, clock, enable, read_mux : in std_logic;
			MDR_in0, MDR_in1 : in std_logic_vector(31 downto 0);
			MDR_out : out std_logic_vector(31 downto 0)
	);
end entity MDR;

architecture behaviour of MDR is
component reg32
	port(
		d : in std_logic_vector(31 downto 0);
		q : out std_logic_vector(31 downto 0);
		clear, clock, enable : in std_logic
	);
end component reg32;	

component MDMux is
	port(
		BusMuxOut : in std_logic_vector(31 downto 0);
		Mdatain   : in std_logic_vector(31 downto 0);
		sel 		 : in std_logic;
		output 	 : out std_logic_vector(31 downto 0)
		
	);
end component MDMux;

signal connect_wire : std_logic_vector(31 downto 0);

begin
reg : reg32
	port map(
		d => connect_wire,
		enable => enable,
		clock => clock,
		clear => clear,
		q => MDR_out
	);
	
	mux : MDMux
	port map(
		output => connect_wire,
		BusMuxOut => MDR_in0,
		Mdatain => MDR_in1,
		sel => read_mux	
	);

end architecture;