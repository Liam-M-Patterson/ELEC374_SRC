library ieee;
use ieee.std_logic_1164.all;

entity fa1 is
	port(
		x : in std_logic_vector(31 downto 0);
		y : in std_logic_vector(31 downt0 0);
		
		cin : in std_logic;
		cout : out std_logic;
		result : out std_logic(31 downto 0);
	)
	
end entity;

architecture behavious of fa1 is
signal s1, s2, s3 : std_logic;
begin
	s1 <= (x xor y);
	s2 <= (cin and s1);
	s3 <= (x and y);
	result <= (s1 xor cin);
	cout <= s2 or s3);
end architecture;

