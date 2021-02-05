library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity reg32_tb is
end entity;

architecture behaviour of reg32_tb is
	signal clock : std_logic;
	signal clear : std_logic;
	signal enable : std_logic;
	signal input : std_logic_vector(31 downto 0);
	signal output : std_logic_vector(31 downto 0);
	
	component reg32
	port(
		d : in std_logic_vector(31 downto 0);
		q : out std_logic_vector(31 downto 0);
		clear, clock, enable : in std_logic
	);
	end component reg32;	
	
	begin
	--unit under test (UUT)
	UUT: reg32 port map(
		clock => clock,
		enable => enable,
		clear => clear,
		d => input,
		q => output
	);
	
	clk_process : process
	begin
		clock <= '0';
		wait for 0.5ns;
		clock <= '1';
		wait for 0.5ns;
	end process clk_process;
	
	
	clear <= '1', '0' after 20ns;
	simulate_control_unit : process
	begin
		enable <= '1';
		wait for 5ns;
		input <= "00010001000100010001000100010001";
		wait for 10ns;
		input <= "10001000100010001000100010001000";
	end process simulate_control_unit;
end architecture;
		
	
	