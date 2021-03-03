library ieee;
use ieee.std_logic_1164.all;

entity ALU_tb is
end entity;

architecture behaviour of ALU_tb is
	signal Ain : std_logic_vector(31 downto 0);
	signal Bin : std_logic_vector(31 downto 0);
	
	
	signal andS : std_logic;
	signal orS  : std_logic;
	signal notS : std_logic;
	signal addS : std_logic;
	signal subS : std_logic;
	signal shrS : std_logic;
	signal rorS : std_logic;
	signal shlS : std_logic;
	signal rolS : std_logic;
	signal negS : std_logic;
	signal multS : std_logic;
	signal divS : std_logic;
	signal Cout : std_logic_vector(63 downto 0);
	
component ALU is
	port(
		Ain : in std_logic_vector(31 downto 0);
		Bin : in std_logic_vector(31 downto 0);
		
		andS : in std_logic;
		orS : in std_logic;
		notS : in std_logic;
		addS : in std_logic;
		subS : in std_logic;
		shrS : in std_logic;
		rorS : in std_logic;
		shlS : in std_logic;
		rolS : in std_logic;
		negS : in std_logic;
		multS : in std_logic;
		divS : in std_logic;
		

		Cout : out std_logic_vector(63 downto 0)
	);
end component ALU;

begin
UUT : ALU port map(
		Ain => Ain,
		Bin => Bin,
		andS => andS,
		orS => orS,
		notS => notS,
		addS => addS,
		subS => subS,
		shrS => shrS,
		rorS => rorS,
		shlS => shlS,
		rolS => rolS, 
		negS => negS,
		multS => multS,
		divS => divS,
		Cout => Cout
		);
	
	

		simulate_proccessor: process
		begin
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			--Ain <= "01111111111111111111111111111111"; -- 11
			--Bin <= "11111111111110000000000111111111"; -- 73
			Ain <= "00000000000000000000000000000011";
			Bin <= "00000000000000000000000000000010";
			--Bin <= "00000000000000000000000000000011";
			wait for 1 ns;
			
			andS <= '1';
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			orS <= '1';
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			notS <= '1';
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			addS <= '1';
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			subS <= '1';
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			negS <= '1';
			
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0';rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			shrS <= '1';
			
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			shlS <= '1';
			
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			rorS <= '1';
			
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			rolS <= '1';
			
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			multS <= '1';
			
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			divS <= '1';
			
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';

			shrS <= '1';
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			shlS <= '1';
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			rorS <= '1';
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			rolS <= '1';
			
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			multS <= '1';
			
			wait for 35 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';
			divS <= '1';
			
			wait for 35 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; rorS <= '0'; shlS <= '0'; rolS <= '0'; multS <= '0'; divS <= '0';

			
		end process;
		
end architecture;
