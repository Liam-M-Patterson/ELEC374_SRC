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
	variable A: std_logic_vector(31 downto 0);
	variable tmp_quotient: std_logic_vector(31 downto 0);
	variable fixed_Divisor: std_logic_vector(31 downto 0);
	begin	
		A:="00000000000000000000000000000000";
		
		tmp_quotient:= Dividend;
		fixed_Divisor:= Divisor;
		divisor:= divisor sll 1;
		for i in 0 to 31 loop
			A:= A sll 1;
			A(0) := dividend(31);
			dividend:= dividend sll 1;
			A:= A - divisor;
			if ((A(31) = '1')) then
				dividend(0):= 0;
				A:= A + Divisor;
			else
				dividend(0):=1;
			end if;
			end loop;
			Quotient <= dividend;
			remainder <= A;
			end process;
			end architecture behavioural;
			
			
	