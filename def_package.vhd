PACKAGE def_package IS

  CONSTANT data_width : POSITIVE := 12; --1.1.1
	CONSTANT address_width : POSITIVE := 12; --1.1.2
	CONSTANT opcode_width : POSITIVE := 6; --3.1.1

	CONSTANT reg_addr_width : POSITIVE := 2; --2.1.2
	CONSTANT addr_width : POSITIVE := 12; -- nicht Aendern
	CONSTANT flag_width : POSITIVE := 4;	-- Flag Vector: (Z,C,N,O)
	
END def_package;
