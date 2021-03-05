library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity datapath is
port(
--	Clock, reset, stop : in std_logic;
--	--InPortData : in std_logic_vector(31 downto 0);
--	BusOut : out std_logic_vector(31 downto 0);
	
	


	
--	Z : out std_logic_vector(63 downto 0);


--	--MDRin, MARin : out std_logic_vector(31 downto 0)
	--R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in : in std_logic;
	--R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out : in std_logic;
	
	Zin, HIin, LOin, PCin, Coutin, INPORTin, OUTPORTin, IRin, MDRin, MARin, Yin : in std_logic;
	PCout, ZLOout, ZHIout, LOout, HIout, INPORTout, MDRout, Cout : in std_logic;

	readS, andS, orS, addS, subS, mulS, divS, shrS, shlS, rorS, rolS, negS, notS : in std_logic;
	IncPC : in std_logic;
	Clock, reset : in std_logic
	--Mdatain : in std_logic_vector (31 downto 0)
	);
end entity datapath;

architecture behaviour of datapath is
--define components

component ALU is 
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
	divS : in std_logic;
	

	Cout : out std_logic_vector(63 downto 0)
);
end component ALU;

component bus_main is
	port(
		clk, reset : in std_logic;
		
		busHIin, busMDRin, busINPORTin, busLOin, busZHIin, busZLOin, busPCin, busCoutin : in std_logic_vector(31 downto 0);
		busR0in, busR1in, busR2in, busR3in, busR4in, busR5in, busR6in, busR7in, busR8in, busR9in, busR10in, busR11in, busR12in, busR13in, busR14in, busR15in : std_logic_vector(31 downto 0);
		R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out : in std_logic;
		
		PCout, ZLOout, ZHIout, LOout, HIout, INPORTout, MDRout, Cout : in std_logic;
		BusMuxOut : out std_logic_vector(31 downto 0)
	);
end component;


component MDR is
port(
			clear, clock, enable, read_mux : in std_logic;
			MDR_in0, MDR_in1 : in std_logic_vector(31 downto 0);
			MDR_out : out std_logic_vector(31 downto 0)
	);
end component MDR;

component MARreg is
port(
			d : in std_logic_vector(31 downto 0);
			q : out std_logic_vector(8 downto 0);
			clear, clock, enable : in std_logic
	);
end component MARreg;

component selEncode is
port(
		Gra, Grb, Grc, Rin, Rout, BAout : in std_logic;
		IRin : in std_logic_vector(31 downto 0);
		
		R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out : out std_logic;
		R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in : out std_logic;
		
		CSignEx : out std_logic_vector(31 downto 0)
	);
end component selEncode;

component conFF is 
	port(
		IRout : in std_logic_vector(31 downto 0);
		BusMuxOut : in std_logic_vector(31 downto 0);
		conIN : in std_logic;
		control : out std_logic
	);
end component conFF;


component reg32 is
	port(
			d : in std_logic_vector(31 downto 0);
			q : out std_logic_vector(31 downto 0);
			clear, clock, enable : in std_logic
	);
end component;

component ram
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
end component;


component reg0 is 
	port(
			d : in std_logic_vector(31 downto 0);
			q : out std_logic_vector(31 downto 0);
			clear, clock, enable : in std_logic;
			BAout : in std_logic
	);
end component;


--declare signals
signal YdataOut, BusMuxOut : std_logic_vector(31 downto 0);
signal Mdatain : std_logic_vector(31 downto 0);
signal IRctl : std_logic_vector(31 downto 0);
signal ALU_out : std_logic_vector(63 downto 0);


signal R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in : std_logic;
--signal ZHIin, ZLOin, HIin, LOin, PCin, Coutin, INPORTin, IRin : std_logic;

--signal Yin, MARin, MDRin, readS  : std_logic;
--ALU control signals for desired operations
--signal andS, orS, addS, subS, mulS, divS, shrS, shlS, rorS, rolS, negS, notS : std_logic;
--signal ZdataIn : std_logic_vector(63 downto 0);


--bus mux input signals
signal busMuxZHIin, busMuxZLOin, busMuxHIin, busMuxLOin, busMuxPCin, busMuxCoutin, busMuxINPORTin, busMuxOUTPORTin, busMuxMDRin: std_logic_vector(31 downto 0);
signal busMuxR0in, busMuxR1in, busMuxR2in, busMuxR3in, busMuxR4in, busMuxR5in, busMuxR6in, busMuxR7in, busMuxR8in, busMuxR9in, busMuxR10in, busMuxR11in, busMuxR12in, busMuxR13in, busMuxR14in, busMuxR15in : std_logic_vector(31 downto 0);



--MAR
signal MARout : std_logic_vector(8 downto 0);

--Ram
signal writeS : std_logic;
signal RAMout : std_logic_vector(31 downto 0);


--bus select signals
signal R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out : std_logic;
--signal PCout, ZLOout, ZHIout, LOout, HIout, INPORTout, MDRout, Cout : std_logic;

--select encode signals
signal Gra, Grb, Grc, Rin, Rout, BAout : std_logic;

--control unit signals
signal con, conIN : std_logic;

begin -- datapath architecture

ALUentity : ALU 
port map(
	Ain => YdataOut, 
	Bin => BusMuxOut,
	andS => andS,
	orS => orS,
	notS => notS,
	addS => addS,
	subS => subS,
	shrS => shrS,
	rorS => rorS,
	shlS => shlS,
	rolS => rolS, 
	negS => negS,
	multS => mulS,
	divS => divS,
	Cout => ALU_out
);	

busUnit : bus_main
port map(
	clk => Clock,
	reset => '1', 
	busHIin => busMuxHIin, 
	busMDRin => busMuxMDRin, 
	busINPORTin => busMuxINPORTin, 
	busLOin => busMuxLOin, 
	busZHIin => busMuxZHIin, 
	busZLOin => busMuxZLOin, 
	busPCin => busMuxPCin, 
	busCoutin => busMuxCoutin, 
	
	busR0in => busMuxR0in, 
	busR1in => busMuxR1in, 
	busR2in => busMuxR2in, 
	busR3in => busMuxR3in, 
	busR4in => busMuxR4in, 
	busR5in => busMuxR5in, 
	busR6in => busMuxR6in, 
	busR7in => busMuxR7in, 
	busR8in => busMuxR8in, 
	busR9in => busMuxR9in, 
	busR10in => busMuxR10in, 
	busR11in => busMuxR11in, 
	busR12in => busMuxR12in, 
	busR13in => busMuxR13in, 
	busR14in => busMuxR14in, 
	busR15in => busMuxR15in,
	
	R0out => R0out,
	R1out => R1out, 
	R2out => R2out, 
	R3out => R3out, 
	R4out => R4out, 
	R5out => R5out, 
	R6out => R6out, 
	R7out => R7out, 
	R8out => R8out, 
	R9out => R9out, 
	R10out => R10out, 
	R11out => R11out, 
	R12out => R12out, 
	R13out => R13out, 
	R14out => R14out, 
	R15out => R15out, 
	
	PCout => PCout, 
	ZLOout => ZLOout, 
	ZHIout => ZHIout, 
	LOout => LOout, 
	HIout => HIout, 
	INPORTout => INPORTout, 
	MDRout => MDRout,
	Cout => Cout,
	BusMuxOut => BusMuxOut
	);
	
ram_inst : ram PORT MAP (
		address	 => MARout,
		clock	 => Clock,
		data	 => busMuxMDRin,
		wren	 => writeS,
		q	 =>  Mdatain
	);

--define registers

MDRunit : MDR
port map(
	MDR_in0 => BusMuxOut,
	MDR_in1 => Mdatain,
	MDR_out => busMuxMDRin,
	read_mux => reads,
	clock => Clock,
	clear => reset,
	enable => MDRin
	);

MAR : MARreg
port map(
	d => BusMuxOut,
	q => MARout,
	clear => reset, 
	clock => Clock, 
	enable => MARin
	);
	

selectAndEnocde : selEncode
port map(
	Gra => Gra, 
	Grb => Grb, 
	Grc => Grc, 
	Rin => Rin, 
	Rout => Rout, 
	BAout => BAout,
	IRin => IRctl,
	
	R0in => R0in,
	R1in => R1in,
	R2in => R2in,
	R3in => R3in,
	R4in => R4in,
	R5in => R5in,
	R6in => R6in,
	R7in => R7in,
	R8in => R8in,
	R9in => R9in,
	R10in => R10in,
	R11in => R11in,
	R12in => R12in,
	R13in => R13in,
	R14in => R14in,
	R15in => R15in,
	
	R0out => R0out,
	R1out => R1out,
	R2out => R2out,
	R3out => R3out,
	R4out => R4out,
	R5out => R5out,
	R6out => R6out,
	R7out => R7out,
	R8out => R8out,
	R9out => R9out,
	R10out => R10out,
	R11out => R11out,
	R12out => R12out,
	R13out => R13out,
	R14out => R14out,
	R15out => R15out,
	
	CSignEx => busMuxCoutin
	);

control_logic : conFF
port map(
		IRout => IRctl,
		BusMuxOut  => BusMuxOut,
		conIN => conIN,
		control => con
	);
	
--define registers


register0 : reg0
port map(
	d => BusMuxOut,
	q => busMuxR0in,
	BAout => BAout,
	clear => reset, 
	clock => Clock, 
	enable => R0in
	);
	
reg1 : reg32
port map(
	d => BusMuxOut,
	q => busMuxR1in,
	clear => reset, 
	clock => Clock, 
	enable => R1in
	);

reg2 : reg32
port map(
	d => BusMuxOut,
	q => busMuxR2in,
	clear => reset, 
	clock => Clock, 
	enable => R2in
	);

reg3 : reg32
port map(
	d => BusMuxOut,
	q => busMuxR3in,
	clear => reset, 
	clock => Clock, 
	enable => R3in
	);

reg4 : reg32
port map(
	d => BusMuxOut,
	q => busMuxR4in,
	clear => reset, 
	clock => Clock, 
	enable => R4in
	);
	
reg5 : reg32
port map(
	d => BusMuxOut,
	q => busMuxR5in,
	clear => reset, 
	clock => Clock, 
	enable => R5in
	);
	
reg6 : reg32
port map(
	d => BusMuxOut,
	q => busMuxR6in,
	clear => reset, 
	clock => Clock, 
	enable => R6in
	);

reg7 : reg32
port map(
	d => BusMuxOut,
	q => busMuxR7in,
	clear => reset, 
	clock => Clock, 
	enable => R7in
	);

reg8 : reg32
port map(
	d => BusMuxOut,
	q => busMuxR8in,
	clear => reset, 
	clock => Clock, 
	enable => R8in
	);
	
reg9 : reg32
port map(
	d => BusMuxOut,
	q => busMuxR9in,
	clear => reset, 
	clock => Clock, 
	enable => R9in
	);

reg10 : reg32
port map(
	d => BusMuxOut,
	q => busMuxR10in,
	clear => reset, 
	clock => Clock, 
	enable => R10in
	);

reg11 : reg32
port map(
	d => BusMuxOut,
	q => busMuxR11in,
	clear => reset, 
	clock => Clock, 
	enable => R11in
	);

reg12 : reg32
port map(
	d => BusMuxOut,
	q => busMuxR12in,
	clear => reset, 
	clock => Clock, 
	enable => R12in
	);
	
reg13 : reg32
port map(
	d => BusMuxOut,
	q => busMuxR13in,
	clear => reset, 
	clock => Clock, 
	enable => R13in
	);
	
reg14 : reg32
port map(
	d => BusMuxOut,
	q => busMuxR14in,
	clear => reset, 
	clock => Clock, 
	enable => R14in
	);
	
reg15 : reg32
port map(
	d => BusMuxOut,
	q => busMuxR15in,
	clear => reset, 
	clock => Clock, 
	enable => R15in
	);

regHI : reg32
port map(
	d => BusMuxOut,
	q => busMuxHIin,
	clear => reset, 
	clock => Clock, 
	enable => HIin
	);

regLO : reg32
port map(
	d => BusMuxOut,
	q => busMuxLOin,
	clear => reset, 
	clock => Clock, 
	enable => LOin
	);

regINPORT : reg32
port map(
	d => BusMuxOut,
	q => busMuxINPORTin,
	clear => reset, 
	clock => Clock, 
	enable => INPORTin
	);
	
regOUTPORT : reg32
port map(
	d => BusMuxOut,
	q => busMuxOUTPORTin,
	clear => reset, 
	clock => Clock, 
	enable => OUTPORTin
	);
	
regIR : reg32
port map(
	d => BusMuxOut,
	q => IRctl,
	clear => reset, 
	clock => Clock, 
	enable => IRin
	);
	
regY : reg32
port map(
	d => BusMuxOut,
	q => YdataOut,
	clear => reset, 
	clock => Clock, 
	enable => Yin
	);
	
regPC : reg32
port map(
	d => BusMuxOut,
	q => busMuxPCin,
	clear => reset, 
	clock => Clock, 
	enable => PCin
	);

regZHI : reg32
port map(
	d => ALU_out(63 downto 32),
	q => busMuxZHIin,
	clear => reset, 
	clock => Clock, 
	enable => Zin
	);

regZLO : reg32
port map(
	d => ALU_out(31 downto 0),
	q => busMuxZLOin,
	clear => reset, 
	clock => Clock, 
	enable => Zin
	);
	

end architecture;