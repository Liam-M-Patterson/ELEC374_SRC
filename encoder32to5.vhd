library ieee;
use ieee.std_logic_1164.all;

entity encoder32to5 is
port(
		output : out std_logic_vector(4 downto 0);
		in0 : in std_logic;
		in1 : in std_logic;
		in2 : in std_logic;
		in3 : in std_logic;
		in4 : in std_logic;
		in5 : in std_logic;
		in6 : in std_logic;
		in7 : in std_logic;
		in8 : in std_logic;
		in9 : in std_logic;
		in10 : in std_logic;
		in11 : in std_logic;
		in12 : in std_logic;
		in13 : in std_logic;
		in14 : in std_logic;
		in15 : in std_logic;
		in16 : in std_logic;
		in17 : in std_logic;
		in18 : in std_logic;
		in19 : in std_logic;
		in20 : in std_logic;
		in21 : in std_logic;
		in22 : in std_logic;
		in23 : in std_logic;
		in24 : in std_logic;
		in25 : in std_logic;
		in26 : in std_logic;
		in27 : in std_logic;
		in28 : in std_logic;
		in29 : in std_logic;
		in30 : in std_logic;
		in31 : in std_logic
);
end encoder32to5;

architecture behaviour of encoder32to5 is
begin
	output <= 
	"00000" when in0 = '1' else
	"00001" when in1 = '1' else
	"00010" when in2 = '1' else
	"00011" when in3 = '1' else
	"00100" when in4 = '1' else
	"00101" when in5 = '1' else
	"00110" when in6 = '1' else
	"00111" when in7 = '1' else
	"01000" when in8 = '1' else
	"01001" when in9 = '1' else
	"01010" when in10 = '1' else
	"01011" when in11 = '1' else
	"01100" when in12 = '1' else
	"01101" when in13 = '1' else
	"01110" when in14 = '1' else
	"01111" when in15 = '1' else
	"10000" when in16 = '1' else
	"10001" when in17 = '1' else
	"10010" when in18 = '1' else
	"10011" when in19 = '1' else
	"10100" when in20 = '1' else
	"10101" when in21 = '1' else
	"10110" when in22 = '1' else
	"10111" when in23 = '1' else
	"11000" when in24 = '1' else
	"11001" when in25 = '1' else
	"11010" when in26 = '1' else
	"11011" when in27 = '1' else
	"11100" when in28 = '1' else
	"11101" when in29 = '1' else
	"11110" when in30 = '1' else
	"11111"; -- when input(31) = '1';
end architecture;