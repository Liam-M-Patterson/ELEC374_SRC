library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
entity BoothMultiplier is
	port(Multiplicand, Multiplier: in std_logic_vector(31 downto 0);
			product: out std_logic_vector(63 downto 0));
end entity BoothMultiplier;

architecture behavioral of BoothMultiplier is
begin 


	process(Multiplicand,Multiplier)
	variable tmp_cand: std_logic_vector(32 downto 0);
	variable tmp_product: std_logic_vector(63 downto 0);
	variable tmp_lier: std_logic_vector(63 downto 0);
	variable shifted: std_logic_vector(63 downto 0);
	variable fixed_lier: std_logic_vector(63 downto 0);
	variable tmp_out: std_logic_vector(63 downto 0);
	variable i: integer;
	
	begin
	tmp_cand:= "000000000000000000000000000000000";
	fixed_lier:="0000000000000000000000000000000000000000000000000000000000000000";
	tmp_lier:= "0000000000000000000000000000000000000000000000000000000000000000";
	tmp_out:= "0000000000000000000000000000000000000000000000000000000000000000";
	tmp_cand(32 downto 0):= Multiplicand;
	fixed_lier(31 downto 0):= Multiplier;
	for i in 0 to 31 loop
	tmp_lier:= fixed_lier;
	if((tmp_cand(i+1 downto i)="01")) then
		shifted(31 downto 1):= tmp_lier(30 downto 0);
		shifted(0):= '0';
		tmp_lier:= shifted;
		tmp_out := tmp_out + tmp_lier;
	end if;
	if((tmp_cand(i+1 downto i)="10")) then
	tmp_lier:= 0 -tmp_lier;
	shifted(31 downto 1):= tmp_lier(30 downto 0);
	shifted(0):= '0';
	tmp_lier:= shifted;
	tmp_out:= tmp_out+ tmp_lier;
	end if;
	end loop;
	product <=tmp_out;
	end process;
	
	end architecture behavioral;