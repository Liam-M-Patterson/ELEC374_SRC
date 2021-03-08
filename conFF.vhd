library ieee;
use ieee.std_logic_1164.all;

entity conFF is
	port(
		IRout : in std_logic_vector(31 downto 0);
		BusMuxOut : in std_logic_vector(31 downto 0);
		conIN : in std_logic;
		control : out std_logic
	);
end entity conFF;



architecture behaviour of conFF is
signal decodeOut : std_logic_vector(3 downto 0);
signal C2 : std_logic_vector(1 downto 0);
signal busOR : std_logic; 
signal conDIN : std_logic;

begin
	process(C2, IRout, BusMuxOut, decodeOut, busOR, conIN, conDIN)
	begin
	C2 <= IRout(20 downto 19);
	busOR <= (BusMuxOut(31) or  BusMuxOut(30) or BusMuxOut(29) or	BusMuxOut(28) or BusMuxOut(27) 
	or BusMuxOut(26) or BusMuxOut(25) or BusMuxOut(24) or BusMuxOut(23) or BusMuxOut(22) or BusMuxOut(21)
	or BusMuxOut(20) or BusMuxOut(19) or BusMuxOut(18) or BusMuxOut(17) or BusMuxOut(16) or BusMuxOut(15)
	or BusMuxOut(14) or BusMuxOut(13) or BusMuxOut(12) or BusMuxOut(11) or BusMuxOut(10) or BusMuxOut(9)
	or BusMuxOut(8) or BusMuxOut(7) or BusMuxOut(6) or BusMuxOut(5) or BusMuxOut(4) or BusMuxOut(3)
	or BusMuxOut(2) or BusMuxOut(1) or BusMuxOut(0) );
	case(C2) is
		when "00" => 
			decodeOut <= "0001";
		when "01"  =>
			decodeOut <= "0010";
		when "10" =>
			decodeOut <= "0100";
		when "11" => 
			decodeOut <= "1000";
		when others =>
			decodeOut <= "0000";
	end case;
	
	conDIN <= ( (not busOR and decodeOut(0)) or (busOR and decodeOut(1)) or (not BusMuxOut(31) and decodeOut(2)) or (BusMuxOut(31) and decodeOut(3)));
	
	if(conIN ='1') then
		control <= conDIN;
	else
		control <= '0';
	end if;
	end process;
end architecture behaviour;