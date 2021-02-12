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
	signal shraS : std_logic;
	signal shlS : std_logic;
	signal shcS : std_logic;
	signal negS : std_logic;
	
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
		shraS : in std_logic;
		shlS : in std_logic;
		shcS : in std_logic;
		negS : in std_logic;
		
		

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
		shraS => shraS,
		shlS => shlS,
		shcS => shcS, 
		negS => negS,
		
		Cout => Cout
		);
	
	

		simulate_proccessor: process
		begin
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; shraS <= '0'; shlS <= '0'; shcS <= '0';
			--Ain <= "01111111111111111111111111111111"; -- 11
			--Bin <= "11111111111110000000000111111111"; -- 73
			Ain <= "00000000000000000000000000001011";
			Bin <= "00000000000000000000000001001001";
			wait for 1 ns;
			
			andS <= '1';
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; shraS <= '0'; shlS <= '0'; shcS <= '0';
			orS <= '1';
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; shraS <= '0'; shlS <= '0'; shcS <= '0';
			notS <= '1';
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; shraS <= '0'; shlS <= '0'; shcS <= '0';
			addS <= '1';
			--wait for 5 ns;
			--andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; shraS <= '0'; shlS <= '0'; shcS <= '0';
			--subS <= '0';
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; shraS <= '0'; shlS <= '0'; shcS <= '0';
			negS <= '1';
			wait for 5 ns;
			andS <= '0'; orS <= '0'; notS <= '0'; addS <= '0'; subS <= '0'; negS <= '0'; shrS <= '0'; shraS <= '0'; shlS <= '0'; shcS <= '0';
			
		end process;
		
end architecture;
