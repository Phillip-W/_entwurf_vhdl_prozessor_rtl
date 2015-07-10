PACKAGE def_package IS

	CONSTANT data_width : POSITIVE := 12; --1.1.1
	CONSTANT addr_width : natural := 12; --1.1.2
	CONSTANT opcode_width : POSITIVE := 6; --3.1.1
--	constant pc_width: Positiv:= addr_width; -- 2.1.3.1

	CONSTANT reg_addr_width : POSITIVE := 2; --2.1.2
	CONSTANT flag_width : POSITIVE := 4;	-- Flag Vector: (Z,C,N,O)
	
	SUBTYPE addr_type IS -- unsers Adressen zum ansprechen des Speichers, z.B. durch den PC
		bit_vector(addr_width-1 downto 0);
	SUBTYPE opcode_type IS -- fuer unsere OPCode Deklarationen
		bit_vector(opcode_width-1 downto 0);
	SUBTYPE reg_addr_type IS -- zum Ansprechen unserer Register
		bit_vector(reg_addr_width-1 downto 0);
	SUBTYPE data_type IS -- Typ, wie unsere Anweisungen, etc. im Speicher abgelegt werden
		bit_vector(data_width-1 downto 0);
	SUBTYPE flag_type IS
		bit_vector(flag_width-1 downto 0);
	SUBTYPE state_type IS 
		bit_vector (4 downto 0);
	SUBTYPE instruction_type IS     -- keine AHnung, warum Patrick das in der ID neu eingefÃ¼hrt hat. Lass mas so
	  data_type;
	
	CONSTANT code_nop : opcode_type := B"00_0000"; --3.3.1.1
	CONSTANT code_stop : opcode_type := B"00_0001"; --3.3.1.2
	CONSTANT code_add : opcode_type := B"00_0010"; --3.3.1.3
	CONSTANT code_addc : opcode_type := B"00_0011"; --3.3.1.4
	CONSTANT code_sub : opcode_type := B"00_0100"; --3.3.1.5
	CONSTANT code_subc : opcode_type := B"00_0101"; --3.3.1.6
	CONSTANT code_not : opcode_type := B"00_0110"; --3.3.1.7
	CONSTANT code_and : opcode_type := B"00_0111"; --3.3.1.8
	CONSTANT code_or : opcode_type := B"00_1000"; --3.3.1.9
	CONSTANT code_xor : opcode_type := B"00_1001"; --3.3.1.10
	CONSTANT code_rea : opcode_type := B"00_1010"; --3.3.1.11
	CONSTANT code_reo : opcode_type := B"00_1011"; --3.3.1.12
	CONSTANT code_rex : opcode_type := B"00_1100"; --3.3.1.13
	CONSTANT code_sll : opcode_type := B"00_1101"; --3.3.1.14
	CONSTANT code_srl : opcode_type := B"00_1110"; --3.3.1.15
	CONSTANT code_sra : opcode_type := B"00_1111"; --3.3.1.16
	CONSTANT code_rol : opcode_type := B"01_0000"; --3.3.1.17
	CONSTANT code_rolc : opcode_type := B"01_0001"; --3.3.1.18
	CONSTANT code_ror : opcode_type := B"01_0010"; --3.3.1.19
	CONSTANT code_rorc : opcode_type := B"01_0011"; --3.3.1.20
	CONSTANT code_ldc : opcode_type := B"10_0000"; --3.3.1.21
	CONSTANT code_ldd : opcode_type := B"10_0001"; --3.3.1.22
	CONSTANT code_ldr : opcode_type := B"10_0010"; --3.3.1.23
	CONSTANT code_std : opcode_type := B"10_0011"; --3.3.1.24
	CONSTANT code_str : opcode_type := B"10_0100"; --3.3.1.25
	CONSTANT code_in : opcode_type := B"10_0101"; --3.3.1.26
	CONSTANT code_out : opcode_type := B"10_0110"; --3.3.1.27
	CONSTANT code_jmp : opcode_type := B"11_0000"; --3.3.1.28
	CONSTANT code_jz : opcode_type := B"11_0001"; --3.3.1.29
	CONSTANT code_jc : opcode_type := B"11_0010"; --3.3.1.30
	CONSTANT code_jn : opcode_type := B"11_0011"; --3.3.1.31
	CONSTANT code_jo : opcode_type := B"11_0100"; --3.3.1.32
	CONSTANT code_jnz : opcode_type := B"11_0101"; --3.3.1.33
	CONSTANT code_jnc : opcode_type := B"11_0110"; --3.3.1.34
	CONSTANT code_jnn : opcode_type := B"11_0111"; --3.3.1.35
	CONSTANT code_jno : opcode_type := B"11_1000"; --3.3.1.36

	CONSTANT s_if: state_type := "10000";
	CONSTANT s_pfex: state_type := "01000";
	CONSTANT s_io: state_type := "00100";
	CONSTANT s_mem: state_type := "00010";
	CONSTANT s_stop: state_type := "00001";

	function REO (signal O1: data_type) return bit;
	function REA (signal O1: data_type) return bit;
	function REX (signal O1: data_type) return bit;
END def_package;



PACKAGE BODY def_package IS


	function REO (signal O1: data_type) return bit is
	variable ZW : data_type;
	begin
		ZW:= O1;
		FOR I IN 0 TO data_width - 2 LOOP 
     			 ZW(i + 1) := ZW(i) OR ZW(i + 1);
  	  	END LOOP;
	return O1(data_width -1);
	end REO;


	function REA (signal O1: data_type) return bit is
	variable ZW : data_type;
	begin
		ZW:= O1;
	FOR I IN 0 TO data_width - 2 LOOP 
     			 ZW(i + 1) := ZW(i) AND ZW(i + 1);
  	END LOOP;
	return O1(data_width -1);
	end REA;

	function REX (signal O1: data_type) return bit is
	variable ZW : data_type;
	begin
		ZW:= O1;
		FOR I IN 0 TO data_width - 2 LOOP 
     			 ZW(i + 1) := ZW(i) XOR ZW(i + 1);
 		END LOOP;
	return O1(data_width -1);
	end REX;

end def_package;
