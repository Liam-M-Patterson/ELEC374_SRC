library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
library work;

entity ALU is
port(
	Ain : in std_logic_vector(31 downto 0);
	Bin : in std_logic_vector(31 downto 0);
	
	andS : in std_logic;
	orS : in std_logic;
	notS : in std_logic;
	addS : in std_logic;
	subS : in std_logic;
	shrS : in std_logic;
	rorS : in std_logic;
	shlS : in std_logic;
	rolS : in std_logic;
	negS : in std_logic;
	multS : in std_logic;
	incPC : in std_logic;
	divS : in std_logic;
	

	Cout : out std_logic_vector(63 downto 0)
);
end entity ALU;

architecture behavioural of ALU is

-- define components needed for ALU
component rca32_add is
	port(
		A, B : in std_logic_vector(31 downto 0);
		result : out std_logic_vector(31 downto 0)
		);
end component rca32_add;

component neg is
	port(
		A : in std_logic_vector(31 downto 0);
		output : out std_logic_vector(31 downto 0)
	);
end component;

component sub is
port(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		output : out std_logic_vector(63 downto 0)
	);
end component;


component shiftR is
port(
		A: in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		output: out std_logic_vector(31 downto 0)
		);
end component;

component shiftL is
port(A: in std_logic_vector(31 downto 0);
			B: in std_logic_vector(31 downto 0);
			output: out std_logic_vector(31 downto 0));
end component;

component rotateR is
	port(A: in std_logic_vector(31 downto 0);
			B: in std_logic_vector(31 downto 0);
			output: out std_logic_vector(31 downto 0));
end component;

component rotateL is
	port(A: in std_logic_vector(31 downto 0);
			B: in std_logic_vector(31 downto 0);
			output: out std_logic_vector(31 downto 0));
end component;

component BoothMultiplier is
	port(M, Q: in std_logic_vector(31 downto 0);
			product: out std_logic_vector(63 downto 0));
end component;

component division is 
	port( Divisor, Dividend: in std_logic_vector(31 downto 0);
			Quotient: out std_logic_vector(63 downto 0));

end component;

-- define internal signals
signal add_result : std_logic_vector(31 downto 0);
signal sub_result : std_logic_vector(63 downto 0);
signal neg_result : std_logic_vector(31 downto 0);
signal shr_result : std_logic_vector(31 downto 0);
signal shl_result : std_logic_vector(31 downto 0);
signal ror_result : std_logic_vector(31 downto 0);
signal rol_result : std_logic_vector(31 downto 0);
signal mul_result : std_logic_vector(63 downto 0);

signal div_result : std_logic_vector(63 downto 0);
signal pc_result : std_logic_vector(31 downto 0);

-- map components
begin
addition : rca32_add
	port map(
		A => Ain,
		B => Bin,
		result => add_result
	);

incrementPC : rca32_add
	port map(
		A => x"00000001",
		B => Bin,
		result => pc_result
	);

negate : neg
	port map(
		A => Ain,
		output => neg_result
	);

subtract : sub 
	port map(
		A => Ain, 
		B => Bin, 
		output => sub_result
	);
	
shiftedR : shiftR 
	port map(
	A => Ain, 
	B => Bin,
	output => shr_result
);


shiftedL : shiftL
port map(
	A => Ain, 
	B => Bin,
	output => shl_result
	);
	
rotatedR : rotateR
port map(
	A => Ain, 
	B => Bin,
	output => ror_result
	);

rotatedL : rotateL
port map(
	A => Ain, 
	B => Bin,
	output => rol_result
	);
	
multiply : BoothMultiplier
port map(
	M => Ain, 
	Q => Bin, 
	product => mul_result
	);
	
divide : division
port map(
	Divisor => Bin, 
	Dividend => Ain,
	Quotient => div_result
	);

ALU: process(Ain, Bin, andS, orS, notS, addS, subS, shrS, rorS, shlS, rolS, negS, multS, divS, incPC,
				 add_result, sub_result, neg_result, shr_result, shl_result, ror_result, rol_result, mul_result, div_result, pc_result) is

begin
	if (andS = '1') then 
		Cout(63 downto 32) <= (others => '0');
		Cout(31 downto 0) <= Ain and Bin;
		
	elsif(orS ='1') then
		Cout(63 downto 32) <= (others => '0');
		Cout(31 downto 0) <= Ain or Bin;
		
	elsif(notS = '1') then
		Cout(63 downto 32) <= (others => '0');
		Cout(31 downto 0) <= not Ain;
		
	elsif(addS = '1') then
		Cout(63 downto 32) <= (others => '0');
		Cout(31 downto 0) <= add_result;
		
	elsif(subS = '1') then
		Cout <= sub_result;
		
	elsif(negS = '1') then
		Cout(63 downto 32) <= (others => '1');
		Cout(31 downto 0) <= neg_result;
		
	elsif(shrS = '1') then
		Cout(63 downto 32) <= (others => '0');
		Cout(31 downto 0) <= shr_result;
		
	elsif(shlS = '1') then
		Cout(63 downto 32) <= (others => '0');
		Cout(31 downto 0) <= shl_result;

	elsif(rorS = '1') then
		Cout(63 downto 32) <= (others => '0');
		Cout(31 downto 0) <= ror_result;
	elsif(rolS = '1') then
		Cout(63 downto 32) <= (others => '0');
		Cout(31 downto 0) <= rol_result;

	elsif(multS = '1') then
		Cout(63 downto 0) <= mul_result;
		
	elsif(divS = '1') then

		Cout(63 downto 0) <= div_result;
	
	elsif(incPC = '1') then 
		Cout(63 downto 32) <= (others => '0');
		Cout(31 downto 0) <= pc_result;

	else
		Cout <= (others => '0');

	end if;
end process;
end architecture;