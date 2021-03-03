Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity booth_tb is
end booth_tb;

architecture behaviour of booth_tb is

component BoothMultiplier
	port(
		M, Q : in std_logic_vector(31 downto 0);
		product : out std_logic_vector(63 downto 0)

	);
end component;	
		
	
	signal A : std_LOGIC_VECTOR(31 downto 0);
	signal B : std_LOGIC_VECTOR(31 downto 0);
	signal clk, reset, start : std_logic; 
	signal result : std_logic_vector(63 downto 0);
	
	
	begin
	UUT : BoothMultiplier port map(
		M => A,
		Q => B,
		product => result
	);
	
	--stimulus process
	clk_process :process
	begin 
			clk <= '0';
			wait for 0.5 ns;
			clk <= '1';
			wait for 0.5 ns;
   end process;
	
	stimulate_proc : process
	begin
		A <= x"00ABCDE1"; 
		B <= x"0000F000"; 
		wait for 5 ns;
		A <= x"00001384"; 
		B <= x"00006173"; 
		wait for 5 ns; 
		A <= x"F0001384"; 
		B <= x"F0006173"; 
		wait for 5 ns; 
		A <= x"00FDED84"; 
		B <= x"F0006173"; 
		wait for 5 ns; 
		
		
	end process;
end architecture;	