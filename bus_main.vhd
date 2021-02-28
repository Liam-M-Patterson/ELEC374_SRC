library ieee;
use ieee.std_logic_1164.all;

entity bus_main is 
	port(
		clk, reset : in std_logic;
		
		busHIin, busMDRin, busINPORTin, busLOin, busZHIin, busZLOin, busPCin, busCoutin : in std_logic_vector(31 downto 0);
		busR0in, busR1in, busR2in, busR3in, busR4in, busR5in, busR6in, busR7in, busR8in, busR9in, busR10in, busR11in, busR12in, busR13in, busR14in, busR15in : std_logic_vector(31 downto 0);
		
		
		R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out : in std_logic;
		PCout, ZLOout, ZHIout, LOout, HIout, INPORTout, MDRout, Cout : in std_logic;
		
		BusMuxOut : out std_logic_vector(31 downto 0)
	);
end entity;

architecture behaviour of bus_main is
component encoder32to5 is
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
end component;

component bus_mux is
	port(
	in0 : in std_logic_vector(31 downto 0);
	in1 : in std_logic_vector(31 downto 0);
	in2 : in std_logic_vector(31 downto 0);
	in3 : in std_logic_vector(31 downto 0);
	in4 : in std_logic_vector(31 downto 0);
	in5 : in std_logic_vector(31 downto 0);
	in6 : in std_logic_vector(31 downto 0);
	in7 : in std_logic_vector(31 downto 0);
	in8 : in std_logic_vector(31 downto 0);
	in9 : in std_logic_vector(31 downto 0);
	in10 : in std_logic_vector(31 downto 0);
	in11 : in std_logic_vector(31 downto 0);
	in12 : in std_logic_vector(31 downto 0);
	in13 : in std_logic_vector(31 downto 0);
	in14 : in std_logic_vector(31 downto 0);
	in15 : in std_logic_vector(31 downto 0);
	in16 : in std_logic_vector(31 downto 0);
	in17 : in std_logic_vector(31 downto 0);
	in18 : in std_logic_vector(31 downto 0);
	in19 : in std_logic_vector(31 downto 0);
	in20 : in std_logic_vector(31 downto 0);
	in21 : in std_logic_vector(31 downto 0);
	in22 : in std_logic_vector(31 downto 0);
	in23 : in std_logic_vector(31 downto 0);
	
	sel : in std_logic_vector(4 downto 0);
	output : out std_logic_vector(31 downto 0)
	);
end component;

signal muxSelect : std_logic_vector(4 downto 0);
begin
encode : encoder32to5
	port map(
		in0 => R0out,
		in1 => R1out,
		in2 => R2out, 
		in3 => R3out, 
		in4 => R4out, 
		in5 => R5out, 
		in6 => R6out, 
		in7 => R7out, 
		in8 => R8out, 
		in9 => R9out, 
		in10 => R10out, 
		in11 => R11out,
		in12 => R12out, 
		in13 => R13out, 
		in14 => R14out, 
		in15 => R15out, 
		in16 => HIout,
		in17 => LOout, 
		in18 => ZHIout, 
		in19 => ZLOout, 
		in20 => PCout, 
		in21 => MDRout, 
		in22 => INPORTout, 
		in23 => Cout,
		in24 => '0',
		in25 => '0',
		in26 => '0',
		in27 => '0',
		in28 => '0',
		in29 => '0',
		in30 => '0',
		in31 => '0',
		output => muxSelect
	);

mux : bus_mux 
	port map(
		in0 => busR0in,
		in1 => busR1in,
		in2 => busR2in, 
		in3 => busR3in, 
		in4 => busR4in, 
		in5 => busR5in, 
		in6 => busR6in, 
		in7 => busR7in, 
		in8 => busR8in, 
		in9 => busR9in, 
		in10 => busR10in, 
		in11 => busR11in,
		in12 => busR12in, 
		in13 => busR13in, 
		in14 => busR14in, 
		in15 => busR15in, 
		in16 => busHIin,
		in17 => busLOin, 
		in18 => busZHIin, 
		in19 => busZLOin, 
		in20 => busPCin, 
		in21 => busMDRin, 
		in22 => busINPORTin, 
		in23 => busCoutin,
--		in24 => (others=>'0'),
--		in25 => (others=>'0'),
--		in26 => (others=>'0'),
--		in27 => (others=>'0'),
--		in28 => (others=>'0'),
--		in29 => (others=>'0'),
--		in30 => (others=>'0'),
--		in31 => (others=>'0'),
		sel => muxSelect,
		output => busMuxOut
	);
end architecture;
