--and datapath_tb.vhd file: <This is the filename>
LIBRARY ieee;
USE ieee.std_logic_1164.all;


--entity declaration only; no definition here
ENTITY shl_datapath_tb IS
END ENTITY shl_datapath_tb;


--Architecture of the testbench with the signal names 
ARCHITECTURE behaviour OF shl_datapath_tb IS
--Add any other signalsto see in your simulation
	SIGNAL PCout_tb, LOout_tb, HIout_tb, INPORTout_tb, MDRout_tb, Cout_tb: std_logic;
	SIGNAL HIin_tb, LOin_tb, ZLOout_tb, ZHIout_tb, Coutin_tb, INPORTin_tb, MARin_tb, Zin_tb, PCin_tb, MDRin_tb, IRin_tb, Yin_tb : std_logic;
	
	SIGNAL IncPC_tb, readS_tb, andS_tb, orS_tb, addS_tb, subS_tb, mulS_tb, divS_tb, shrS_tb, shlS_tb, rorS_tb, rolS_tb, negS_tb, notS_tb: std_logic;
	
	signal R0in_tb, R1in_tb, R2in_tb, R3in_tb, R4in_tb, R5in_tb, R6in_tb, R7in_tb, R8in_tb, R9in_tb, R10in_tb, R11in_tb, R12in_tb, R13in_tb, R14in_tb, R15in_tb : std_logic;
	signal R0out_tb, R1out_tb, R2out_tb, R3out_tb, R4out_tb, R5out_tb, R6out_tb, R7out_tb, R8out_tb, R9out_tb, R10out_tb, R11out_tb, R12out_tb, R13out_tb, R14out_tb, R15out_tb : std_logic; 
	
	SIGNAL Clock_tb, reset_tb : std_logic;
	SIGNAL Mdatain_tb : std_logic_vector (31 downto 0);
	TYPE State IS (default, Reg_load1a, Reg_load1b, Reg_load2a, Reg_load2b, Reg_load3a, Reg_load3b, T0, T1, T2, T3, T4, T5);
	SIGNAL Present_state: State:= default;
--component instantiation of the datapath

COMPONENT datapath
PORT (

	R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in : in std_logic;
	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out : in std_logic;
	
	Zin, HIin, LOin, PCin, Coutin, INPORTin, IRin, MDRin, MARin, Yin : in std_logic;
	PCout, ZLOout, ZHIout, LOout, HIout, INPORTout, MDRout, Cout : in std_logic;

	readS, andS, orS, addS, subS, mulS, divS, shrS, shlS, rorS, rolS, negS, notS : in std_logic;
	IncPC : in std_logic;
	Clock, reset : in std_logic;
	Mdatain : in std_logic_vector (31 downto 0)
	
--	PCout, ZLOout, MDRout, R2out, R4out : in std_logic;
--	MARin, Zin, PCin, MDRin, IRin, Yin: in std_logic;
--	IncPC, ReadS, ANDS, R5in, R2in, R4in: in std_logic;
--	Clock : in std_logic;
--	Mdatain : in std_logic_vector (31 downto 0)
	);
END COMPONENT datapath;


BEGIN
DUT  : datapath
--port mapping: between the dut and the testbench signals
PORT MAP (
	PCout => PCout_tb,
	ZHIout => ZHIout_tb,
	ZLOout => ZLOout_tb,
	MDRout => MDRout_tb,
	LOout => LOout_tb, 
	HIout => HIout_tb, 
	INPORTout => INPORTout_tb,  
	Cout => Cout_tb,
	
	LOin => LOin_tb,
	HIin => HIin_tb,
	Coutin => Coutin_tb,
	INPORTin => INPORTin_tb, 
	MARin=>MARin_tb,
	Zin=>Zin_tb,
	PCin=>PCin_tb,
	MDRin=>MDRin_tb,
	IRin=>IRin_tb,
	Yin=>Yin_tb,
	IncPC =>IncPC_tb,
	
	readS=>readS_tb,
	andS=>andS_tb,
	orS => orS_tb, 
	addS => addS_tb, 
	subS => subS_tb,  
	mulS => mulS_tb, 
	divS => divS_tb, 
	shrS => shrS_tb, 
	shlS => shlS_tb, 
	rorS => rorS_tb, 
	rolS => rolS_tb,  
	negS => negS_tb, 
	notS => notS_tb,
	
	R0in => R0in_tb, 
	R1in => R1in_tb, 
	R2in => R2in_tb, 
	R3in => R3in_tb, 
	R4in => R4in_tb,
	R5in => R5in_tb, 
	R6in => R6in_tb, 
	R7in => R7in_tb, 
	R8in => R8in_tb, 
	R9in => R9in_tb, 
	R10in => R10in_tb, 
	R11in => R11in_tb, 
	R12in => R12in_tb, 
	R13in => R13in_tb, 
	R14in => R14in_tb,
	R15in => R15in_tb,
	
	R0out => R0Out_tb, 
	R1out => R1Out_tb,
	R2out => R2Out_tb, 
	R3out => R3Out_tb, 
	R4out => R4Out_tb, 
	R5out => R5Out_tb, 
	R6out => R6Out_tb,
	R7out => R7Out_tb, 
	R8out => R8Out_tb, 
	R9out => R9Out_tb, 
	R10out => R10Out_tb, 
	R11out => R11Out_tb, 
	R12out => R12Out_tb, 
	R13out => R13Out_tb, 
	R14out => R14Out_tb, 
	R15out => R15Out_tb,

	Clock=>Clock_tb,
	reset => reset_tb,
	Mdatain=>Mdatain_tb
	);
	--add test logic here
	Clock_process: PROCESS IS 
	BEGIN
		Clock_tb <= '1', '0' after 10 ns;
		Wait for 20 ns;
	END PROCESS Clock_process;
	
	PROCESS (Clock_tb)  IS--finite state machine
	BEGIN
	IF (rising_edge (Clock_tb)) THEN   --if clock rising-edge
	CASE Present_state IS 
		WHEN Default=>	Present_state <= Reg_load1a;
		WHEN Reg_load1a=> Present_state <= Reg_load1b;
		WHEN Reg_load1b=>Present_state <= Reg_load2a;
		WHEN Reg_load2a=>Present_state <= Reg_load2b;
		WHEN Reg_load2b=>Present_state <= Reg_load3a;
		WHEN Reg_load3a=>Present_state <= Reg_load3b;
		WHEN Reg_load3b=>Present_state <= T0;
		WHEN T0 =>Present_state <= T1;
		WHEN T1 =>Present_state <= T2;
		WHEN T2=>Present_state <= T3;
		WHEN T3=>Present_state <= T4;
		WHEN T4 =>Present_state <= T5;
		WHEN OTHERS =>
		END CASE;
		END IF;
		END PROCESS;
		PROCESS (Present_state)IS--do the required job ineach state
		
BEGIN CASE Present_state IS        --assert the required signalsin each clock cycle
	WHEN Default=>	
		
		PCout_tb  <= '0';
		LOout_tb  <= '0'; 
		HIout_tb  <= '0'; 
		INPORTout_tb  <= '0'; 
		MDRout_tb  <= '0'; 
		Cout_tb  <= '0';
		HIin_tb  <= '0'; 
		LOin_tb  <= '0'; 
		ZLOout_tb  <= '0'; 
		ZHIout_tb  <= '0'; 
		Coutin_tb  <= '0'; 
		INPORTin_tb  <= '0'; 
		MARin_tb  <= '0'; 
		Zin_tb  <= '0'; 
		PCin_tb  <= '0'; 
		MDRin_tb  <= '0'; 
		IRin_tb  <= '0'; 
		Yin_tb  <= '0';
	
		IncPC_tb <= '0'; 
		readS_tb  <= '0'; 
		andS_tb  <= '0'; 
		orS_tb  <= '0';
		addS_tb  <= '0'; 
		subS_tb  <= '0'; 
		mulS_tb  <= '0'; 
		divS_tb  <= '0'; 
		shrS_tb  <= '0'; 
		shlS_tb  <= '0'; 
		rorS_tb  <= '0'; 
		rolS_tb  <= '0'; 
		negS_tb  <= '0'; 
		notS_tb  <= '0';
	
		R0in_tb  <= '0'; 
		R1in_tb  <= '0'; 
		R2in_tb  <= '0'; 
		R3in_tb  <= '0'; 
		R4in_tb  <= '0'; 
		R5in_tb  <= '0'; 
		R6in_tb  <= '0'; 
		R7in_tb  <= '0'; 
		R8in_tb  <= '0'; 
		R9in_tb  <= '0'; 
		R10in_tb  <= '0'; 
		R11in_tb  <= '0'; 
		R12in_tb  <= '0'; 
		R13in_tb  <= '0'; 
		R14in_tb  <= '0'; 
		R15in_tb  <= '0';
		R0out_tb  <= '0';
		R1out_tb  <= '0';
		R2out_tb  <= '0';
		R3out_tb  <= '0'; 
		R4out_tb  <= '0';
		R5out_tb  <= '0'; 
		R6out_tb  <= '0'; 
		R7out_tb  <= '0'; 
		R8out_tb  <= '0'; 
		R9out_tb  <= '0'; 
		R10out_tb  <= '0'; 
		R11out_tb  <= '0'; 
		R12out_tb  <= '0'; 
		R13out_tb  <= '0'; 
		R14out_tb  <= '0'; 
		R15out_tb  <= '0'; 
		
		reset_tb <= '0';
		
		Mdatain_tb <= x"00000000"; 
		
	WHEN Reg_load1a=>
		Mdatain_tb <= x"00000022";
		readS_tb <= '0', '1' after 10 ns, '0' after 25 ns; --the first zero is there for completeness
		MDRin_tb <= '0', '1' after 10 ns, '0' after 25 ns;
	WHEN Reg_load1b=> 
		MDRout_tb <= '1' after 10 ns, '0' after 25 ns;
		R2in_tb <= '1' after 10 ns, '0' after 25 ns;--initialize R2 with the value $22
	WHEN Reg_load2a=> 
		Mdatain_tb <= x"00000002";
		readS_tb <= '1' after 10 ns, '0' after 25 ns; 
		MDRin_tb <= '1' after 10 ns, '0' after 25 ns;
	WHEN Reg_load2b=> 
		MDRout_tb <= '1' after 10 ns, '0' after 25 ns; 
		R4in_tb <= '1' after 10 ns, '0' after 25 ns;--initialize R4 with the value $24 
	WHEN Reg_load3a=> 
		Mdatain_tb <= x"00000024";
		readS_tb <= '1' after 10 ns, '0' after 25 ns; 
		MDRin_tb <= '1' after 10 ns, '0' after 25 ns;
	WHEN Reg_load3b=> 
		MDRout_tb <= '1' after 10 ns, '0' after 25 ns; 
		R5in_tb <= '1' after 10 ns, '0' after 25 ns;--initialize R5 with the value $26 
	WHEN T0 => --see if you need to de-assert these signals
		PCout_tb<= '1';
		MARin_tb<= '1';
		IncPC_tb<= '1';
		Zin_tb <= '1'; -- changed form 1 bc doesnt make sense
	WHEN T1=>
		ZLOout_tb <= '1';
		PCin_tb <= '1';   
		readS_tb <= '1';   
		MDRin_tb <= '1';
		Mdatain_tb<= x"4A920000";   --opcode for “and R5, R2, R4”
	WHEN T2=>
		MDRout_tb <= '1';   
		IRin_tb <= '1';
	WHEN T3=>
		MDRout_tb <='0';
		R2out_tb <= '1';
		Yin_tb <= '1';
	WHEN T4=>
		R2out_tb <= '0';
		Yin_tb <= '0';
		R4out_tb <= '1';
		shlS_tb <= '1';
		Zin_tb <= '1';
	WHEN T5 =>
		R4out_tb <= '0';
		ZLOout_tb <= '1';   
		R5in_tb <= '1'; 
	WHEN OTHERS =>
	END CASE;
END PROCESS;
END ARCHITECTURE;