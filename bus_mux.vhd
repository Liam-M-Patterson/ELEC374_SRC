library ieee;
use ieee.std_logic_1164.all;

entity bus_mux is
port(
	in0 : in std_logic_vector(31 downto 0);
	in1 : in std_logic_vector(31 downto 0);
	in2 : in std_logic_vector(31 downto 0);
	in3 : in std_logic_vector(31 downto 0);
	in4 : in std_logic_vector(31 downto 0);
	in5 : in std_logic_vector(31 downto 0);
	in6 : in std_logic_vector(31 downto 0);
	in7 : in std_logic_vector(31 downto 0);
	in8 : in std_logic_vector(31 downto 0);
	in9 : in std_logic_vector(31 downto 0);
	in10 : in std_logic_vector(31 downto 0);
	in11 : in std_logic_vector(31 downto 0);
	in12 : in std_logic_vector(31 downto 0);
	in13 : in std_logic_vector(31 downto 0);
	in14 : in std_logic_vector(31 downto 0);
	in15 : in std_logic_vector(31 downto 0);
	in16 : in std_logic_vector(31 downto 0);
	in17 : in std_logic_vector(31 downto 0);
	in18 : in std_logic_vector(31 downto 0);
	in19 : in std_logic_vector(31 downto 0);
	in20 : in std_logic_vector(31 downto 0);
	in21 : in std_logic_vector(31 downto 0);
	in22 : in std_logic_vector(31 downto 0);
	in23 : in std_logic_vector(31 downto 0);
	
	sel : in std_logic_vector(4 downto 0);
	output : out std_logic_vector(31 downto 0)
);
end entity;

architecture behaviour of bus_mux is
begin
output <= 
			in0 when sel = "00000" else
			in1 when sel = "00001" else
			in2 when sel = "00010" else
			in3 when sel = "00011" else
			in4 when sel = "00100" else
			in5 when sel = "00101" else
			in6 when sel = "00110" else
			in7 when sel = "00111" else
			in8 when sel = "01000" else
			in9 when sel = "01001" else
			in10 when sel = "01010" else
			in11 when sel = "01011" else
			in12 when sel = "01100" else
			in13 when sel = "01101" else
			in14 when sel = "01110" else
			in15 when sel = "01111" else
			in16 when sel = "10000" else
			in17 when sel = "10001" else
			in18 when sel = "10010" else
			in19 when sel = "10011" else
			in20 when sel = "10100" else
			in21 when sel = "10101" else
			in22 when sel = "10110" else
			in23;-- when sel = "10111" 
end architecture;