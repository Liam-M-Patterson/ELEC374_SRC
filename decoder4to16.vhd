library ieee;
use ieee.std_logic_1164.all;

entity decoder4to16 is
	port(
		decodeIn : in std_logic_vector(3 downto 0);
		decodeOut : out std_logic_vector(15 downto 0)
		--R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15 : out std_logic
	);
end entity;

architecture behaviour of decoder4to16 is
	begin
	process(decodeIn)
	begin
	case decodeIn is
		when "0000" => decodeOut <= "0000000000000001";
		when "0001" => decodeOut <= "0000000000000010";
		when "0010" => decodeOut <= "0000000000000100";
		when "0011" => decodeOut <= "0000000000001000";
		when "0100" => decodeOut <= "0000000000010000";
		when "0101" => decodeOut <= "0000000000100000";
		when "0110" => decodeOut <= "0000000001000000";
		when "0111" => decodeOut <= "0000000010000000";
		when "1000" => decodeOut <= "0000000100000000";
		when "1001" => decodeOut <= "0000001000000000";
		when "1010" => decodeOut <= "0000010000000000";
		when "1011" => decodeOut <= "0000100000000000";
		when "1100" => decodeOut <= "0001000000000000";
		when "1101" => decodeOut <= "0010000000000000";
		when "1110" => decodeOut <= "0100000000000000";
		when "1111" => decodeOut <= "1000000000000000";
		when others => decodeOut <= "0000000000000000";
	end case;
	end process;
end architecture;