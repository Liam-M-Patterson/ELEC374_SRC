library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--use ieee.numeric_std.all;
use ieee.std_logic_arith.all;


entity BoothMultiplier is
	port
	(
		M :   in std_logic_vector(31 downto 0);
		Q :  in  std_logic_vector(31 downto 0);
		product :  out  std_logic_vector(63 downto 0)
	);
end BoothMultiplier;

architecture behaviour of BoothMultiplier is
component shiftL64 is
	port(A : in std_logic_vector(63 downto 0);
	B: in std_logic_vector(4 downto 0);
	output : out std_logic_vector(63 downto 0)
	);
end component;

signal  mExtend, mShift: std_logic_vector(63 downto 0);

function recode(
	input : std_logic_vector(2 downto 0);
	Min, mShiftIn : std_logic_vector(63 downto 0))
	return std_logic_vector is
	
	variable code : std_logic_vector(2 downto 0);
	variable q : std_logic_vector(63 downto 0);
	--variable result : std_logic_vector(63 downto 0);
	--variable mShift : std_logic_vector(63 downto 0) := std_logic_vector(shift_left(signed(Min), 1));
	
	
	begin
		if(input = "000") then
			code := "000";
		elsif(input = "001") then
			code := "001";
		elsif(input = "010") then
			code := "001";
		elsif(input = "011") then	
			code := "010";
		elsif(input = "100") then	
			code := "110";
		elsif(input = "101") then
			code := "111";
		elsif(input = "110") then
			code := "111";
		elsif(input = "111") then
			code := "000";
		end if;
	
	
		if(code="000") then
			q := (others=>'0');
		elsif(code="001") then
			q := Min;
		elsif(code="010") then
			q := mShiftIn;
		elsif(code="110") then
			q := (unsigned(not mShiftIn) + 1);
		elsif(code="111") then
			q := (unsigned(not Min) + 1);
		end if;
		
		if(code="010" or code="110") then -- number was shifted
			if(q(32) = '0') then
				q(63 downto 33) := (others=>'0');
			elsif(q(32)='1') then
				q(63 downto 33) := (others=>'1');
			end if;
		else
			if(q(31) = '0') then
				q(63 downto 32) := (others=>'0');
			elsif(q(31)='1') then
				q(63 downto 32) := (others=>'1');
			end if;
		end if;
		
		return q;
	end recode;
	
--port map shift left 64
begin
mShifter : shiftL64 
port map(
	A => mExtend,
	B => "00001",
	output => mShift
	);
	
	

	process(M, Q, mExtend, mShift)
	variable result, tempResult, shift, recodeResult: std_logic_vector(63 downto 0);
	variable i : integer range 0 to 34 := 0;
	variable bitPair: std_logic_vector(2 downto 0);
	begin
		
		
		result := x"0000000000000000";
		tempResult := x"0000000000000000";
		bitPair := "000";
		
		
		if(M(31)='1') then
			mExtend(63 downto 32) <= (others=>'1');
			mExtend(31 downto 0) <= M;
		else
			mExtend(63 downto 32) <= (others=>'0');
			mExtend(31 downto 0) <= M;
		end if;
		
		i := 0;
		for j in 0 to 15 loop
			if (j = 0) then
				if (Q(0) = '0' ) then
					if(Q(1) = '0') then 	--000
						bitPair := "000";
						--tempResult(31 downto 0):= zeroes;
					else -- 100
						bitPair := "100";
						--tempResult(31 downto 0):= negm2;
					end if;
				else
					if(Q(1) = '0') then 	 --010
						bitPair := "010";
						--tempResult(31 downto 0):= m;
					else -- 110
						bitPair := "110";
						--tempResult(31 downto 0):= negm;
					end if;
				end if;
				
				if(bitPair="000") then
					tempResult := (others=>'0');
				elsif(bitPair="001") then
					tempResult := mExtend;
				elsif(bitPair="110") then
					tempResult := (unsigned(not mShift) + 1);
				elsif(bitPair="111") then
					tempResult := (unsigned(not mExtend) +1);
				end if;
				
				if(bitPair="010" or bitPair="110") then -- x2 or x-2
					if(tempResult(32)='0') then
						tempResult(63 downto 32) := (others=>'0');
					else
						tempResult(63 downto 32) := (others=>'1');
					end if;
				else
					if(tempResult(31)='0') then
						tempResult(63 downto 33) := (others=>'0');
					else
						tempResult(63 downto 33) := (others=>'1');
					end if;
				end if;
				tempResult := recode(bitPair, mExtend, mShift);
				result := tempResult;
			else -- j!= 0, i =2
				
				recodeResult := recode(Q(i+1 downto i-1), mExtend, mShift);
				shift := x"0000000000000000";
				shift(63 downto i) := recodeResult(63-i downto 0);
				result := shift + result;
			end if;
			i := i + 2;
		end loop;
		product <= result;
	end process;
end;
	