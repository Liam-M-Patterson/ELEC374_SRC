library ieee;
use ieee.std_logic_1164.all;


entity ALU_tb is
end entity;

architecture behaviour of ALU_tb is
	signal Ain : std_logic_vector(31 downto 0);
	signal Bin : std_logic_vector(31 downto 0);
	
	
	signal andS : std_logic;
	signal orS  : std_logic;
	signal Cout : std_logic_vector(63 downto 0);
	
component ALU is
	port(
	Ain : in std_logic_vector(31 downto 0);
	Bin : in std_logic_vector(31 downto 0);
	
	andS : in std_logic;
	orS : in std_logic;
	

	Cout : out std_logic_vector(63 downto 0)
	);
end component ALU;

begin
UUT : ALU port map(
		Ain => Ain,
		Bin => Bin,
		andS => andS,
		orS => orS,
		Cout => Cout
		);
	
	

		simulate_proccessor: process
		begin
			andS <= '0';
			orS <= '0';
			Ain <= "00000000000000000000000000001011"; -- 11
			Bin <= "00000000000000000000000001001001"; -- 9
			wait for 1 ns;
			
			andS <= '1';
			wait for 5 ns;
			andS <= '0';
			orS <= '1';
			wait for 5 ns;
				
				
		end process;
		
end architecture;
