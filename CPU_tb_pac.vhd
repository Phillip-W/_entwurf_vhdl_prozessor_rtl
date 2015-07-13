Library IEEE;
USE IEEE.numeric_bit.all;
USE work.def_package.ALL;
USE std.textio.ALL;

PACKAGE CPU_tb_pac IS
  TYPE mem_type IS -- unser "Speicher" (Array)
	ARRAY(0 to 2**addr_width - 1) OF data_type;
	
	CONSTANT isInt: integer := 1;
	CONSTANT isChar: integer := 2;
	CONSTANT isMinus: integer := 3;
	CONSTANT isSpecial: integer := 4;
	
  PROCEDURE isWhitespace(VARIABLE read_line: IN line; CONSTANT start: IN integer; VARIABLE space: OUT integer);
  
  FUNCTION objType(CONSTANT input: IN character) RETURN integer;
  Function to_int (a: in Character) return Integer;
	FILE MemoryFile : Text IS IN "code.txt";
	PROCEDURE init_memory ( Par: inout Boolean;  OP: inout data_type;
		VARIABLE Memoryfile : IN text;
		VARIABLE Memory_array : INOUT mem_type
	);
  
END CPU_tb_pac;

PACKAGE BODY CPU_tb_pac IS
  
  PROCEDURE isWhitespace(VARIABLE read_line: IN line; CONSTANT start: IN integer; VARIABLE space: OUT integer) IS
  VARIABLE cnt: integer := start;
  BEGIN
    do: WHILE cnt < read_line'length LOOP
      EXIT WHEN read_line(cnt) =' ' ;
      cnt := cnt + 1;
    END LOOP;
    space := cnt;
  END PROCEDURE;
  
  FUNCTION objType(CONSTANT input: IN character) RETURN integer IS
  BEGIN
    CASE input IS
      WHEN '0' =>
        RETURN isInt;
      WHEN '1' =>
        RETURN isInt;
      WHEN '2' =>
        RETURN isInt;
      WHEN '3' =>
        RETURN isInt;
      WHEN '4' =>
        RETURN isInt;
      WHEN '5' =>
        RETURN isInt;
      WHEN '6' =>
        RETURN isInt;
      WHEN '7' =>
        RETURN isInt;
      WHEN '8' =>
        RETURN isInt;
      WHEN '9' =>
        RETURN isInt;
      WHEN 'A' =>
        RETURN isChar;
      WHEN 'B' =>
        RETURN isChar;
      WHEN 'C' =>
        RETURN isChar;
      WHEN 'D' =>
        RETURN isChar;
      WHEN 'E' =>
        RETURN isChar;
      WHEN 'F' =>
        RETURN isChar;
      WHEN 'G' =>
        RETURN isChar;
      WHEN 'H' =>
        RETURN isChar;
      WHEN 'I' =>
        RETURN isChar;
      WHEN 'J' =>
        RETURN isChar;
      WHEN 'K' =>
        RETURN isChar;
      WHEN 'L' =>
        RETURN isChar;
      WHEN 'M' =>
        RETURN isChar;
      WHEN 'N' =>
        RETURN isChar;
      WHEN 'O' =>
        RETURN isChar;
      WHEN 'P' =>
        RETURN isChar;
      WHEN 'Q' =>
        RETURN isChar;
      WHEN 'R' =>
        RETURN isChar;
      WHEN 'S' =>
        RETURN isChar;
      WHEN 'T' =>
        RETURN isChar;
      WHEN 'U' =>
        RETURN isChar;
      WHEN 'V' =>
        RETURN isChar;
      WHEN 'W' =>
        RETURN isChar;
      WHEN 'X' =>
        RETURN isChar;
      WHEN 'Y' =>
        RETURN isChar;
      WHEN 'Z' =>
        RETURN isChar;
      WHEN 'a' =>
        RETURN isChar;
      WHEN 'b' =>
        RETURN isChar;
      WHEN 'c' =>
        RETURN isChar;
      WHEN 'd' =>
        RETURN isChar;
      WHEN 'e' =>
        RETURN isChar;
      WHEN 'f' =>
        RETURN isChar;
      WHEN 'g' =>
        RETURN isChar;
      WHEN 'h' =>
        RETURN isChar;
      WHEN 'i' =>
        RETURN isChar;
      WHEN 'j' =>
        RETURN isChar;
      WHEN 'k' =>
        RETURN isChar;
      WHEN 'l' =>
        RETURN isChar;
      WHEN 'm' =>
        RETURN isChar;
      WHEN 'n' =>
        RETURN isChar;
      WHEN 'o' =>
        RETURN isChar;
      WHEN 'p' =>
        RETURN isChar;
      WHEN 'q' =>
        RETURN isChar;
      WHEN 'r' =>
        RETURN isChar;
      WHEN 's' =>
        RETURN isChar;
      WHEN 't' =>
        RETURN isChar;
      WHEN 'u' =>
        RETURN isChar;
      WHEN 'v' =>
        RETURN isChar;
      WHEN 'w' =>
        RETURN isChar;
      WHEN 'x' =>
        RETURN isChar;
      WHEN 'y' =>
        RETURN isChar;
      WHEN 'z' =>
        RETURN isChar;  
      WHEN '-' =>
        RETURN isMinus;
      WHEN OTHERS =>
        RETURN isSpecial;
    END CASE;
  END FUNCTION;
  
  PROCEDURE InputDecode (VARIABLE l : IN line; Par: inout Boolean; OP: inout data_type; variable Mem : inout mem_type; variable ad: inout addr_type) IS
	VARIABLE llength : natural := l'length;
	VARIABLE i,j : NATURAL  := 1;
	VARIABLE h: NATURAL :=2;
	VARIABLE RegCounter: Natural :=0; 	-- gibt an wie viele Register gelesen werden müssen
BEGIN
	whitespace: WHILE l(i)/=' ' LOOP
		i := i+1;
		exit whitespace when
			i=llength+1;
	END LOOP whitespace;
  i := i - 1; -- sonst liest er bis zum Leerzeiche nund findet natürlich keine Übereinstimmung
	IF l(1 TO i) = "NOP" THEN -- OP-CODE Erkennung (NOP)
		OP := code_nop & "000000";
		RegCounter:= 0; Par:= FALSE;
	ELSIF l(1 TO i) = "STOP" THEN -- OP-Code erkennung (STOP)
		OP := code_stop & "000000";	
		RegCounter:= 0; Par:= FALSE;
	ELSIF l(1 TO i) = "ADD" THEN -- OP-Code erkennung (ADD)
		OP := code_add & "000000";
		RegCounter:= 3; Par:= FALSE;
	ELSIF l(1 TO i) = "ADDC" THEN
		OP := code_addc & "000000";
		RegCounter:= 3; Par:= FALSE;
	ELSIF l(1 TO i) = "SUB" THEN
		OP := code_sub & "000000";
		RegCounter:= 3; Par:= FALSE;
	ELSIF l(1 TO i) = "SUBC" THEN
		OP := code_subc & "000000";
		RegCounter:= 3; Par:= FALSE;
	ELSIF l(1 TO i) = "NOT" THEN
		OP := code_not & "000000";
		RegCounter:= 2; Par:= FALSE;
	ELSIF l(1 TO i) = "AND" THEN
		OP := code_and & "000000";
		RegCounter:= 3; Par:= FALSE;
	ELSIF l(1 TO i) = "OR" THEN
		OP := code_or & "000000";
		RegCounter:= 3; Par:= FALSE;
	ELSIF l(1 TO i) = "XOR" THEN
		OP := code_xor & "000000";
		RegCounter:= 3; Par:= FALSE;
	ELSIF l(1 TO i) = "REA" THEN
		OP := code_rea & "000000";
		RegCounter:= 2; Par:= FALSE;
	ELSIF l(1 TO i) = "REO" THEN
		OP := code_reo & "000000";
		RegCounter:= 2; Par:= FALSE;
	ELSIF l(1 TO i) = "REX" THEN
		OP := code_rex & "000000";
		RegCounter:= 2; Par:= FALSE;
	ELSIF l(1 TO i) = "SLL" THEN
		OP := code_sll & "000000";
		RegCounter:= 2; Par:= FALSE;
	ELSIF l(1 TO i) = "SRL" THEN
		OP := code_srl & "000000";
		RegCounter:= 2; Par:= FALSE;
	ELSIF l(1 TO i) = "SRA" THEN
		OP := code_sra & "000000";
		RegCounter:= 2; Par:= FALSE;
	ELSIF l(1 TO i) = "ROL" THEN
		OP := code_rol & "000000";
		RegCounter:= 2; Par:= FALSE;
	ELSIF l(1 TO i) = "ROLC" THEN
		OP := code_rolc & "000000";
		RegCounter:= 2; Par:= FALSE;
	ELSIF l(1 TO i) = "ROR" THEN
		OP := code_ror & "000000";
		RegCounter:= 2; Par:= FALSE;
	ELSIF l(1 TO i) = "RORC" THEN
		OP := code_rorc & "000000";
		RegCounter:= 2; Par:= FALSE;
	ELSIF l(1 TO i) = "LDC" THEN
		OP := code_ldc & "000000";
		RegCounter:= 1; Par:= TRUE;
	ELSIF l(1 TO i) = "LDD" THEN
		OP := code_ldd & "000000";
		RegCounter:= 1; Par:= TRUE;
	ELSIF l(1 TO i) = "LDR" THEN
		OP := code_ldr & "000000";
		RegCounter:= 2; Par:= FALSE;
	ELSIF l(1 TO i) = "STD" THEN
		OP := code_std & "000000";
		RegCounter:= 1; Par:= TRUE;
	ELSIF l(1 TO i) = "STR" THEN
		OP := code_str & "000000";
		RegCounter:= 2; Par:= FALSE;
	ELSIF l(1 TO i) = "IN" THEN
		OP := code_in & "000000";
		RegCounter:= 1; Par:= FALSE;
	ELSIF l(1 TO i) = "OUT" THEN
		OP := code_out & "000000";
		RegCounter:= 1; Par:= FALSE;
	ELSIF l(1 TO i) = "JMP" THEN
		OP := code_jmp & "000000";
		RegCounter:= 0; Par:= TRUE;
	ELSIF l(1 TO i) = "JZ" THEN
		OP := code_jz & "000000";
		RegCounter:= 0; Par:= TRUE;
	ELSIF l(1 TO i) = "JC" THEN
		OP := code_jc & "000000";
		RegCounter:= 0; Par:= TRUE;
	ELSIF l(1 TO i) = "JN" THEN
		OP := code_jn & "000000";
		RegCounter:= 0; Par:= TRUE;
	ELSIF l(1 TO i) = "JO" THEN
		OP := code_jo & "000000";
		RegCounter:= 0; Par:= TRUE;
	ELSIF l(1 TO i) = "JNZ" THEN
		OP := code_jnz & "000000";
		RegCounter:= 0; Par:= TRUE;
	ELSIF l(1 TO i) = "JNC" THEN
		OP := code_jnc & "000000";
		RegCounter:= 0; Par:= TRUE;
	ELSIF l(1 TO i) = "JNN" THEN
		OP := code_jnn & "000000";
		RegCounter:= 0; Par:= TRUE;
	ELSIF l(1 TO i) = "JNO" THEN
		OP := code_jno & "000000";
		RegCounter:= 0; Par:= TRUE;
	ELSE
		ASSERT FALSE
		REPORT "ungueltig"
			SEVERITY error;
	END IF; 
	
	readReg: WHILE RegCounter/=0 LOOP
		RegCounter:= RegCounter-1;
		OP(data_width-1 downto opcode_width - (2*j)):= OP(data_width-1 downto opcode_width - (2*j -2)) & bit_vector(to_unsigned(to_int(l(i+2*j)),2));
		j:=j+1;
		exit readReg when h=0;
		h:=h-1;
	END LOOP readReg;

	Parameter: if Par then
		mem(to_integer(unsigned(ad)+1)):=bit_vector(to_unsigned(integer'value(l(i+2*j to llength)),12));
	END IF Parameter;
END PROCEDURE;

Function to_int (a: in Character) return Integer IS
	variable b: integer;
Begin
	if a='0' then b:=0;
	elsif a='1' then b:=1;
	elsif a='2' then b:=2;
	elsif a='3' then b:=3;
	else ASSERT FALSE
		REPORT "ungültiges Register"
			SEVERITY error;
	end if;
	return b;
END to_int;
procedure init_memory( Par: inout Boolean;  OP: inout data_type; variable Memoryfile : in text; variable Memory_array : inout mem_type ) is

 	variable ml : line;
 	variable v : data_type ;
  variable i : addr_type := (others => '0');
-- variable dml: line;	
begin
  outest:LOOP --- read line by line
    exit when endfile (Memoryfile);
    readline (Memoryfile , ml);
		-- read values in each line
		exit outest when
		i=bit_vector(to_unsigned(2**addr_width-1,12));
		inputDecode(ml, Par, OP, Memory_array, i);
		Memory_array(to_integer(unsigned(i))):=OP;
		if Par then
			i:=bit_vector(unsigned(i)+2);
		else i:=bit_vector(unsigned(i)+1);
    end if;
  end LOOP outest;
end init_memory;
END CPU_tb_pac;
