library ieee;
use ieee.std_logic_1164.all;

entity control_unit is 
port(
	clk, reset, stop, conFF : in std_logic;
	readS, writeS : out std_logic;
	
	IR : in std_logic_vector(31 downto 0);
	HIin, LOin, CONin, PCin, IRin, Yin, Zin, MARin, MDRin, OutPortin, Cout, BAout : out std_logic;
	Gra, Grb, Grc, Rin, Rout : out std_logic;
	PCout, HIout, LOout, MDRout, ZHIout, ZLOout : out std_logic;
	andS, orS, addS, subS, mulS, divS, shrS, shlS, rorS, rolS, negS, notS : out std_logic;
	IncPC : out std_logic
	);
	
end entity;

architecture behaviour of control_unit is
	type state is (reset_state, fetch0, fetch1, fetch2, fetch2b, fetch2c, load3, load4, load5, load6, load6b, load7, loadi3, loadi4, loadi5, store3, store4, store5, store6, store6b, store7, add3, add4, add5,
	addi3, addi4, addi5, or3, or4, or5, ori3, ori4, ori5, and3, and4, and5, andi3, andi4, andi5, neg3, neg4, neg5, not3, not4, not5, shr3, shr4, shr5, shl3, shl4, shl5, ror3, ror4, ror5, rol3, rol4, rol5,
	sub3, sub4, sub5, div3, div4, div5, div6, mul3, mul4, mul5, mul6, jr3, jal3, jal4, mfhi3, mflo3, branch3, branch4, branch5, branch6, branch6b, nop3, halt3);
	
	signal present_state : state := reset_state;
	
	
	begin
	process(clk, reset) is
		begin
		if (reset = '1') then
			present_state <= reset_state;
		elsif (rising_edge(clk)) then
			case present_state is
				when reset_state =>
					present_state <= fetch0;
				when fetch0 =>
					present_state <= fetch1;
				when fetch1 =>
					present_state <= fetch2;
				when fetch2 => 
					present_state <= fetch2b;
				when fetch2b =>
					present_state <= fetch2c;
				when fetch2c =>
					case IR(31 downto 27) is
						when "00000" =>
							present_state <= load3;
						when "00001" =>
							present_state <= loadi3;
						when "00010" =>
							present_state <= store3;
						when "00011" =>
							present_state <= add3;
						when "00100" =>
							present_state <= sub3;
						when "00101" =>
							present_state <= shr3;
						when "00110" =>
							present_state <= shl3;
						when "00111" =>
							present_state <= ror3;
						when "01000" =>
							present_state <= rol3;
						when "01001" =>
							present_state <= and3;
						when "01010" =>
							present_state <= or3;
						when "01011" =>
							present_state <= addi3;
						when "01100" =>
							present_state <= andi3;
						when "01101" =>
							present_state <= ori3;
						when "01110" =>
							present_state <= mul3;
						when "01111" =>
							present_state <= div3;
						when "10000" =>
							present_state <= neg3;
						when "10001" =>
							present_state <= not3;
						when "10010" =>
							present_state <= branch3;
						when "10011" =>
							present_state <= jr3;
						when "10100" =>
							present_state <= jal3;
						when "10111" =>
							present_state <= mfhi3;
						when "11000" =>
							present_state <= mflo3;
						when "11001" =>
							present_state <= nop3;
						when "11010" =>
							present_state <= halt3;
						
						when others =>
					end case;
				when load3 =>
					present_state <= load4;
				when load4 =>
					present_state <= load5;
				when load5 =>
					present_state <= load6;
				when load6 =>
					present_state <= load6b;
				when load6b =>
					present_state <= load7;					
				when load7 =>
					present_state <= reset_state;
				
				when loadi3 =>
					present_state <= loadi4;
				when loadi4 =>
					present_state <= loadi5;
				when loadi5 =>
					present_state <= reset_state;
				
				when store3 =>
					present_state <= store4;
				when store4 =>
					present_state <= store5;
				when store5 =>
					present_state <= store6;
				when store6 =>
					present_state <= store6b;
				when store6b =>
					present_state <= store7;
				when store7 =>
					present_state <= reset_state;
				
				when add3 => 
					present_state <= add4;
				when add4 =>
					present_state <= add5;
				when add5 =>
					present_state <= reset_state;
				
				when addi3 =>
					present_state <= addi4;
				when addi4 =>
					present_state <= addi5;
				when addi5 =>
					present_state <= reset_state;
					
				when and3 =>
					present_state <= and4;
				when and4 =>
					present_state <= and5;
				when and5 =>
					present_state <= reset_state;
				
				when andi3 =>
					present_state <= andi4;
				when andi4 =>
					present_state <= andi5;
				when andi5 =>
					present_state <= reset_state;
			
				when or3 =>
					present_state <= or4;
				when or4 =>
					present_state <= or5;
				when or5 =>
					present_state <= reset_state;
				
				when ori3 =>
					present_state <= ori4;
				when ori4 =>
					present_state <= ori5;
				when ori5 =>
					present_state <= reset_state;
			
				when neg3 =>
					present_state <= neg4;
				when neg4 =>
					present_state <= neg5;
				when neg5 =>
					present_state <= reset_state;
				
				when not3 =>
					present_state <= not4;
				when not4 =>
					present_state <= not5;
				when not5 =>
					present_state <= reset_state;
					
				when ror3 =>
					present_state <= ror4;
				when ror4 =>
					present_state <= ror5;
				when ror5 =>
					present_state <= reset_state;
				
				when rol3 =>
					present_state <= rol4;
				when rol4 =>
					present_state <= rol5;
				when rol5 =>
					present_state <= reset_state;
				
				when shr3 =>
					present_state <= shr4;
				when shr4 =>
					present_state <= shr5;
				when shr5 =>
					present_state <= reset_state;
				
				when shl3 =>
					present_state <= shl4;
				when shl4 =>
					present_state <= shl5;
				when shl5 =>
					present_state <= reset_state;
				
				when sub3 =>
					present_state <= sub4;
				when sub4 =>
					present_state <= sub5;
				when sub5 =>
					present_state <= reset_state;
				
				when div3 =>
					present_state <= div4;
				when div4 =>
					present_state <= div5;
				when div5 =>
					present_state <= div6;
				when div6 =>
					present_state <= reset_state;
					
				when mul3 =>
					present_state <= mul4;
				when mul4 =>
					present_state <= mul5;
				when mul5 =>
					present_state <= mul6;
				when mul6 =>
					present_state <= reset_state;
				
				when jr3 =>
					present_state <= reset_state;
				when jal3 =>
					present_state <= jal4;
				when jal4 =>
					present_state <= reset_state;
					
				when nop3 => present_state <= reset_state;
				
					
				when mfhi3 =>
					present_state <= reset_state;
				
				when mflo3 =>
					present_state <= reset_state;
				
				when branch3 =>
					present_state <= branch4;
				when branch4 =>
					present_state <= branch5;
				when branch5 =>
					present_state <= branch6;
				when branch6 =>
					present_state <= branch6b;
				when branch6b =>
					present_state <= reset_state;
			
			
				when others =>
				
			end case;
		end if;
	end process;
	
	process(present_state)
		begin
		case present_state is
			when reset_state =>
				Gra <= '0'; Grb <= '0';	Grc <= '0'; Rin <= '0'; Rout <= '0';
				HIin <= '0'; LOin <= '0'; CONin <= '0'; PCin <= '0'; IRin <= '0';
				Yin <= '0'; Zin <= '0'; MARin <= '0'; MDRin <= '0'; OutPortin <= '0'; Cout <= '0'; BAout <= '0';
				PCout <= '0'; HIout <= '0'; LOout <= '0'; MDRout <= '0'; ZHIout <= '0'; ZLOout <= '0';
				andS <= '0'; orS <= '0'; addS <= '0'; subS <= '0'; mulS <= '0'; divS <= '0'; shrS <= '0';
				shlS <= '0'; rorS <= '0'; rolS <= '0'; negS <= '0'; notS <= '0';
				IncPC <= '0';
				
			when fetch0 =>
				PCout <= '1', '0' after 25 ns;
				MARin <= '1', '0' after 25 ns;
				IncPC <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when fetch1 =>
				ZLOout <= '1', '0' after 25 ns;
				PCin <= '1', '0' after 25 ns;   
				readS <= '1', '0' after 25 ns; 
			when fetch2 =>
				readS <= '1', '0' after 25 ns;  
				MDRin <= '1', '0' after 25 ns;
			when fetch2b =>
				MDRout <= '1', '0' after 25 ns;   
				IRin <= '1', '0' after 25 ns;
				
			when load3 =>
				Grb <= '1', '0' after 25 ns;
				BAout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when load4 =>
				Cout <= '1', '0' after 25 ns;
				addS <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when load5 =>
				ZLOout <= '1', '0' after 20 ns;   
				MARin <= '1', '0' after 25 ns;
			when load6b =>
				MDRin <= '1', '0' after 25 ns;
				readS <= '1', '0' after 25 ns;
			when load7 =>
				MDRout <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;				
				
			when loadi3 =>
				Grb <= '1', '0' after 25 ns;
				BAout <= '1' after 2 ns, '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when loadi4 =>
				Cout <= '1', '0' after 25 ns;
				addS <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when loadi5 =>
				ZLOout <= '1', '0' after 25 ns;   
				Gra <= '1', '0' after 25 ns;   
				Rin <= '1', '0' after 25 ns;   
			
			when store3 =>
				Grb <= '1', '0' after 25 ns;
				BAout <= '1' after 2 ns, '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when store4 =>
				Cout <= '1', '0' after 25 ns;
				addS <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when store5 =>
				ZLOout <= '1', '0' after 25 ns;
				MARin <= '1', '0' after 25 ns;
			when store6 =>
				Rout <= '1', '0' after 25 ns;
			when store6b =>
				MDRin <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
			when store7 =>
				MDRout <= '1', '0' after 25 ns;
				writeS <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
				
			when addi3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when addi4 => 
				Cout <= '1', '0' after 25 ns;
				adds <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when addi5 =>
				ZLOout <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
				
			when add3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when add4 =>
				Grc <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				adds <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when add5 =>
				ZLOout <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
			
			when sub3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when sub4 =>
				Grc <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				subs <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when sub5 =>
				ZLOout <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
			
			when andi3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when andi4 =>
				Cout <= '1', '0' after 25 ns;
				ands <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when andi5 => 
				ZLOout <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
			
			when and3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when and4 =>
				Grc <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				ands <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when and5 =>
				ZLOout <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
			
			when ori3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when ori4 =>
				Cout <= '1', '0' after 25 ns;
				ors <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when ori5 =>
				ZLOout <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
				
			when or3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when or4 =>
				Grc <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				ors <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when or5 =>
				ZLOout <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
				
			when neg3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when neg4 =>
				Cout <= '1', '0' after 25 ns;
				negS <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when neg5 =>
				ZLOout <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
				
			when not3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when not4 =>
				Cout <= '1', '0' after 25 ns;
				notS <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when not5 =>
				ZLOout <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
				
			when shr3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when shr4 =>
				Grc <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				shrS <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when shr5 =>
				ZLOout <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
			
			when shl3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when shl4 =>
				Grc <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				shlS <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when shl5 =>
				ZLOout <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
			
			when ror3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when ror4 =>
				Grc <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				rorS <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when ror5 =>
				ZLOout <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
			
			when rol3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when rol4 =>
				Grc <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				rolS <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when rol5 =>
				ZLOout <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
				
			when mul3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when mul4 =>
				Gra <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				mulS <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when mul5 =>
				ZLOout <= '1', '0' after 25 ns;
				LOin <= '1', '0' after 25 ns;
			when mul6 => 
				ZHIout <= '1', '0' after 25 ns;
				HIin <= '1', '0' after 25 ns;
			
			when div3 =>
				Grb <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when div4 =>
				Gra <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				divS <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when div5 =>
				ZLOout <= '1', '0' after 25 ns;
				LOin <= '1', '0' after 25 ns;
			when div6 => 
				ZHIout <= '1', '0' after 25 ns;
				HIin <= '1', '0' after 25 ns;
			
			when branch3 =>
				Gra <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				CONin <= '1', '0' after 25 ns;
			when branch4 =>
				PCout <= '1', '0' after 25 ns;
				Yin <= '1', '0' after 25 ns;
			when branch5 =>
				Cout <= '1', '0' after 25 ns;
				addS <= '1', '0' after 25 ns;
				Zin <= '1', '0' after 25 ns;
			when branch6b =>
				ZLOout <= '1', '0' after 25 ns;
				PCin <= conFF, '0' after 25 ns;
			
			when jr3 =>
				Gra <= '1', '0' after 25 ns;
				Rout <= '1' after 2 ns, '0' after 25 ns;
				PCin <= '1', '0' after 25 ns;
			
			when jal3 =>
				PCout <= '1', '0' after 25 ns;
				Grb <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
		
			when jal4 =>
				PCin <= '1', '0' after 25 ns;
				Gra <= '1', '0' after 25 ns;
				Rout <= '1', '0' after 25 ns;
				
			when mfhi3 =>
				Gra <= '1', '0' after 25 ns;
				HIout <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
			
			when mflo3 =>
				Gra <= '1', '0' after 25 ns;
				LOout <= '1', '0' after 25 ns;
				Rin <= '1', '0' after 25 ns;
				
			
			when others =>
		end case;
	end process;
end architecture;