library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
library lpm;
use lpm.all;
entity divison is
	port( Divisor, Dividend: in std_logic_vector(31 downto 0);
			Quotient, Remainder: out std_logic_vector(31 downto 0));
end entity divison;

architecture behavioural of divison is
begin 
	process(Divisor,Dividend)
	variable shifted: std_logic_vector(31 downto 0);
	variable A: std_logic_vector(31 downto 0);
	variable Q: std_logic_vector(31 downto 0);
	variable tmp_quotient: std_logic_vector(31 downto 0);
	variable fixed_Divisor: std_logic_vector(31 downto 0);
	begin	
		A:="00000000000000000000000000000000";
		Q:= dividend;
		tmp_quotient:= Dividend;
		fixed_Divisor:= Divisor;

		
		for i in 0 to 31 loop
			shifted(31 downto 1):= A(30 downto 0);
			shifted(0):= Q(31);
			A:= shifted;
			shifted(31 downto 1):= Q(30 downto 0);
			shifted(0):= '0';
			Q:= shifted;
			A:= A - divisor;
			if ((A(31) = '1')) then
				Q(0):= '0';
				A:= A + Divisor;
			else
				Q(0):='1';
			end if;
			end loop;
			Quotient <= Q;
			remainder <= A;
			end process;
			end architecture behavioural;
			
			
	