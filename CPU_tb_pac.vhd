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
END CPU_tb_pac;
