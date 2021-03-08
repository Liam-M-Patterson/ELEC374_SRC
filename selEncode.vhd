library ieee;
use ieee.std_logic_1164.all;

entity selEncode is
	port(
		Gra, Grb, Grc, Rin, Rout, BAout : in std_logic;
		IRin : in std_logic_vector(31 downto 0);
		
		R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out : out std_logic;
		R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in : out std_logic;
		
		CSignEx : out std_logic_vector(31 downto 0)
	);
end entity;


architecture behaviour of selEncode is
	--define components
	component decoder4to16 is
		port(
			decodeIn : in std_logic_vector(3 downto 0);
			decodeOut : out std_logic_vector(15 downto 0)
		);
	end component decoder4to16;


	--define signals
	signal Ra, Rb, Rc : std_logic_vector(3 downto 0);
	signal decoderIn : std_logic_vector(3 downto 0);
	signal decoderOut : std_logic_vector(15 downto 0);
	signal Cout : std_logic_vector(31 downto 0);
	begin
	
	--define component port maps
	decoder : decoder4to16
	port map(
		decodeIn => decoderIn,
		decodeOut => decoderOut 
	);
	
	process(IRin, Gra, Grb, Grc, Rout, BAout, Rin, decoderOut, decoderIn, Ra, Rb, Rc, Cout)
	begin
	--determine input to decoder
	if Gra = '1' then
		Ra <= IRin(26 downto 23);  
	else
		Ra <= (others=>'0');
	end if;
	
	if Grb = '1' then
		Rb <= IRin(22 downto 19);
	else 
		Rb <= (others=>'0');
	end if;
	
	if Grc = '1' then
		Rc <= IRin(18 downto 15);
	else 
		Rc <= (others=>'0');
	end if;
	
	decoderIn <= Ra or Rb or Rc;
	
	
	
	
	--sign extend C
	Cout <= IRin;
	if Cout(18) = '1' then
		Cout(31 downto 19) <= (others => '1');
	else
		Cout(31 downto 19) <= (others => '0');
	end if;
	CSignEx <= Cout;
	
	--assert register in and out signals
	R0in <= decoderOut(0) and Rin;
	R1in <= decoderOut(1) and Rin;
	R2in <= decoderOut(2) and Rin;
	R3in <= decoderOut(3) and Rin;
	R4in <= decoderOut(4) and Rin;
	R5in <= decoderOut(5) and Rin;
	R6in <= decoderOut(6) and Rin;
	R7in <= decoderOut(7) and Rin;
	R8in <= decoderOut(8) and Rin;
	R9in <= decoderOut(9) and Rin;
	R10in <= decoderOut(10) and Rin;
	R11in <= decoderOut(11) and Rin;
	R12in <= decoderOut(12) and Rin;
	R13in <= decoderOut(13) and Rin;
	R14in <= decoderOut(14) and Rin;
	R15in <= decoderOut(15) and Rin;
	
	R0out <= decoderOut(0) and (Rout or BAout);
	R1out <= decoderOut(1) and (Rout or BAout);
	R2out <= decoderOut(2) and (Rout or BAout);
	R3out <= decoderOut(3) and (Rout or BAout);
	R4out <= decoderOut(4) and (Rout or BAout);
	R5out <= decoderOut(5) and (Rout or BAout);
	R6out <= decoderOut(6) and (Rout or BAout);
	R7out <= decoderOut(7) and (Rout or BAout);
	R8out <= decoderOut(8) and (Rout or BAout);
	R9out <= decoderOut(9) and (Rout or BAout);
	R10out <= decoderOut(10) and (Rout or BAout);
	R11out <= decoderOut(11) and (Rout or BAout);
	R12out <= decoderOut(12) and (Rout or BAout);
	R13out <= decoderOut(13) and (Rout or BAout);
	R14out <= decoderOut(14) and (Rout or BAout);
	R15out <= decoderOut(15) and (Rout or BAout);
	
	end process;
end architecture behaviour;