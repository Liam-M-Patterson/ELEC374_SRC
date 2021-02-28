library IEEE; 
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity division is
port( Divisor, Dividend: in std_logic_vector(31 downto 0);
		Quotient: out std_logic_vector(63 downto 0));
end entity division;

architecture behavioural of division is
	begin
		process(Dividend,Divisor)
		variable shifted: std_logic_vector(31 downto 0);
		variable A: std_logic_vector(31 downto 0);
		variable DivisorN: std_logic;
		variable DividendN: std_logic;
		variable tmp_A: std_logic_vector(31 downto 0);
		variable Q: std_logic_vector(31 downto 0);
		variable fixed_Divisor: std_logic_vector(31 downto 0);
		begin
		if dividend(31) = '1' then
			Q:= 0- dividend;
			dividendN:= '1';
		else 
			Q:= dividend;
			dividendN:= '0';
		end if;
		if divisor(31) = '1' then
			fixed_Divisor:= 0 - divisor;
			divisorN:='1';
		else
			fixed_Divisor:= Divisor;
			divisorN:= '0';
		end if;
		A:="00000000000000000000000000000000";

		for i in 0 to 31 loop
			shifted(31 downto 1):= A(30 downto 0);
			shifted(0):= Q(31);
			A:= shifted;
			shifted(31 downto 1):= Q(30 downto 0);
			shifted(0):= '0';
			Q:= shifted;
			tmp_A:= A - fixed_Divisor;
			A:= tmp_A;
			if ((A(31) = '1')) then
				Q(0):= '0';
				tmp_A:= A + fixed_Divisor;
				A:=tmp_A;
			else
				Q(0):='1';
			end if;
		end loop;
		if dividendN = '1' and divisorN = '1' then
			Quotient(63 downto 32) <= Q;
			Quotient(31 downto 0) <=A;
		elsif dividendN ='1' or divisorN = '1' then
			Q := 0-Q;
			Quotient(63 downto 32) <= Q;
			Quotient(31 downto 0) <=A;
		else 
			Quotient(63 downto 32) <= Q;
			Quotient(31 downto 0) <=A;
		end if;
end process;

end architecture behavioural;
