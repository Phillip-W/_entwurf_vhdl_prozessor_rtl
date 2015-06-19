PACKAGE def_package IS

	CONSTANT data_width : POSITIVE := 12; --1.1.1
	CONSTANT addr_width : POSITIVE := 12; --1.1.2
	CONSTANT opcode_width : POSITIVE := 6; --3.1.1

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
	
END def_package;
