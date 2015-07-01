-- Hier wird von einem Memory File in die CPU eingelesen.
-- Die CPU an sich kann nur mit bit_vector arbeiten.

USE work.def_package.ALL;
USE std.textio.ALL;
USE work.CPU_tb_pac.ALL;

ENTITY CPU_TB IS
END ENTITY;

ARCHITECTURE simul OF CPU_TB IS
  COMPONENT CPU IS
    PORT(
      clk, rst: IN bit;
      mem_in: IN mem_type
  );
  END COMPONENT;
   	
  FILE codeFile : Text IS IN "code.txt";
  SIGNAL memory: mem_type;
  
BEGIN
  write: PROCESS
  VARIABLE codeLine: line;
  VARIABLE pos1, pos2: integer;
  BEGIN
    ASSERT endfile(codeFile) = true;
    pos1 := 0;
    readline(codeFile, codeLine);
    -- aukommentieren mit "-"
    WHILE pos < codeLine'length LOOP
      isWhitespace(codeLine, pos1, pos2);
      IF pos1 /= pos2 THEN 	
        IF isChar(codeLine(pos1)) = 1
        
    
  END PROCESS;
END simul;
