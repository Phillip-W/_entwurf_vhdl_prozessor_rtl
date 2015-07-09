-- Hier wird von einem Memory File in die CPU eingelesen.
-- Die CPU an sich kann nur mit bit_vector arbeiten.
LIBRARY IEEE;
USE work.def_package.ALL;
USE std.textio.ALL;
USE work.CPU_tb_pac.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_bit.all;


ENTITY CPU_TB IS
END ENTITY;

ARCHITECTURE simul OF CPU_TB IS
  
  COMPONENT CPU IS
     port (  
      rst, clk: IN bit;
      d_in: IN data_type;
      a_in_2: OUT data_type; -- d_out
      DEV_RDY		: in bit;
      A_OUT		: out addr_type;
      W_EN, D_IN_MUX	: out bit;
      IO_TYPE, IO_EN	: out bit;
      ACTVE		: out bit
    );    
  END COMPONENT;
  
  COMPONENT InputDevice IS
    PORT( 
      rst, clk, enab: IN bit;
      d_in: IN data_type;
      rdy: OUT bit;
      d_out: OUT data_type
    );
  END COMPONENT;
  
  COMPONENT OutputDevice IS
    PORT( 
      rst, clk, enab: IN bit;
      d_in: IN data_type;
      rdy: OUT bit;
      d_out: OUT data_type
    );
  END COMPONENT;
  
  COMPONENT Memory is
    port(
      addr: in bit_vector(addr_width-1 downto 0);
      d_in: in bit_vector(data_width-1 downto 0);
      w_en, rst, clk: in bit;
      d_out: out bit_vector(data_width-1 downto 0)
    );
  END COMPONENT;
  
  FILE codeFile : Text IS IN "code.txt";
  
  SIGNAL inputData, outputData: data_type; -- nur Loc in TB
  
  SIGNAL clkTemp, resTemp, resCpu, resAll: bit;
  SIGNAL dInCpu, dInMem, dFile: data_type; -- data In signale
  SIGNAL dOutMem, dOutCpu, dOut: data_type; -- data Out Signale
  SIGNAL inDevRdy, outDevRdy, devRdy: bit; -- für IO Mux, IO dev rdy gesetzt wenn Input vorhanden/Output Clear
  SIGNAL inDevData, outDevData: data_type; -- IO Device Daten
  SIGNAL ioType, ioEn: bit; -- für IOrdy Mux
  SIGNAL act: bit; -- CPU active
  SIGNAL wEnCpu, wEnWrite, wEn: bit; -- für Memory beschreiben
  SIGNAL aOut, aMem: addr_type; -- für Memory bechreiben
  SIGNAL aWrite: unsigned(addr_width-1 downto 0);
  
  SIGNAL dInMux: bit; -- enscheiden Welcher Input
  
BEGIN
  UUT: CPU PORT MAP(
    rst => resTemp,
    clk => clkTemp,
    d_in => dInCpu,
    a_in_2 => dOutCpu,
    dev_rdy => devRdy,
    a_out => aOut,
    w_en => wEn,
    d_in_mux => dInMux,
    IO_TYPE => ioType, 
    IO_EN => ioEn,
    ACTVE => act
  );
    
  
  input: InputDevice PORT MAP( 
    rst => resAll,
    clk => clkTemp,
    enab => ioEn,
    rdy => inDevRdy,
    d_in => inputData,
    d_out => inDevData
  );
  
  output: OutputDevice PORT MAP( 
    rst => resAll,
    clk => clkTemp,
    enab => ioEn,
    rdy => outDevRdy,
    d_in => dOut,
    d_out => outputData
  );
  
  mem1: Memory PORT MAP(
    addr => aMem,
    d_in => dInMem,
    w_en => wEn, 
    rst => resAll, 
    clk => clkTemp,
    d_out => dOutMem
  );
  
  resTemp <= resAll OR resCpu; -- cpu nach memory initialisierung neustartbar mit res cpu <= 1
  
  IOrdyMux: PROCESS(ioType)
  BEGIN
    IF ioType = '0' THEN
      devRdy <= inDevRdy;
    ELSE
      devRdy <= outDevRdy;
    END IF;
  END PROCESS IOrdyMux;
  
  clock: PROCESS
  BEGIN
    wait for 50 ns;
    clkTemp <= NOT clkTemp;
  END PROCESS clock;
  
  dataInMux: PROCESS(dInMux)
  BEGIN
    IF dInMux = '0' THEN
      dInCpu <= inDevData;
    ELSE
      dInCpu <= dOutMem;
    END IF;
  END PROCESS dataInMux;
  
  write_reset: PROCESS
  VARIABLE mem_addr: unsigned(11 downto 0);
  VARIABLE codeLine: line;
  VARIABLE pos1, pos2, charType: integer; 
  BEGIN
    WAIT FOR 20 ns;
    resAll <= '1';
    WAIT FOR 100 ns;
    resAll <= '0';
    
    aWrite <= (OTHERS => '0');
    
    writing: LOOP 
      EXIT WHEN endfile(codeFile);
      pos1 := 1;
      readline(codeFile, codeLine);
      -- aukommentieren mit "-"
      WHILE pos1 < codeLine'length-1 LOOP
        isWhitespace(codeLine, pos1, pos2);
        IF pos1 < pos2 THEN	-- bei mehreren Leerzeichen true
          charType := objType(codeLine(pos1));
          IF charType = isMinus THEN
            EXIT;
          ELSIF charType = isInt THEN
            dFile <= bit_vector(to_unsigned(integer'value(codeLine(pos1 to pos2)), data_width));
            aWrite <= aWrite+1;
          ELSIF charType = isChar THEN
            IF codeLine(pos1 to pos2) = "NOP" THEN
              dFile <= B"00_0000"&code_nop;
            ELSIF codeLine(pos1 to pos2) = "STOP" THEN
              dFile <= B"00_0000"&code_stop;
            ELSIF codeLine(pos1 to pos2) = "ADD" THEN
              dFile <= B"00_0000"&code_add;
            ELSIF codeLine(pos1 to pos2) = "ADDC" THEN
              dFile <= B"00_0000"&code_addc;
            ELSIF codeLine(pos1 to pos2) = "SUB" THEN
              dFile <= B"00_0000"&code_sub;
            ELSIF codeLine(pos1 to pos2) = "SUBC" THEN
              dFile <= B"00_0000"&code_subc;
            ELSIF codeLine(pos1 to pos2) = "NOT" THEN
              dFile <= B"00_0000"&code_not;
            ELSIF codeLine(pos1 to pos2) = "AND" THEN
              dFile <= B"00_0000"&code_and;
            ELSIF codeLine(pos1 to pos2) = "OR" THEN
              dFile <= B"00_0000"&code_or;
            ELSIF codeLine(pos1 to pos2) = "XOR" THEN
              dFile <= B"00_0000"&code_xor;
            ELSIF codeLine(pos1 to pos2) = "REA" THEN
              dFile <= B"00_0000"&code_rea;
            ELSIF codeLine(pos1 to pos2) = "REO" THEN
              dFile <= B"00_0000"&code_reo;
            ELSIF codeLine(pos1 to pos2) = "REX" THEN
              dFile <= B"00_0000"&code_rex;
            ELSIF codeLine(pos1 to pos2) = "SLL" THEN
              dFile <= B"00_0000"&code_sll;
            ELSIF codeLine(pos1 to pos2) = "SRL" THEN
              dFile <= B"00_0000"&code_srl;
            ELSIF codeLine(pos1 to pos2) = "SRA" THEN
              dFile <= B"00_0000"&code_sra;
            ELSIF codeLine(pos1 to pos2) = "ROL" THEN
              dFile <= B"00_0000"&code_rol;
            ELSIF codeLine(pos1 to pos2) = "ROLC" THEN
              dFile <= B"00_0000"&code_rolc;
            ELSIF codeLine(pos1 to pos2) = "ROR" THEN
              dFile <= B"00_0000"&code_ror;
            ELSIF codeLine(pos1 to pos2) = "RORC" THEN
              dFile <= B"00_0000"&code_rorc;
            ELSIF codeLine(pos1 to pos2) = "LDC" THEN
              dFile <= B"00_0000"&code_ldc;
            ELSIF codeLine(pos1 to pos2) = "LDD" THEN
              dFile <= B"00_0000"&code_ldd;
            ELSIF codeLine(pos1 to pos2) = "LDR" THEN
              dFile <= B"00_0000"&code_ldr;
            ELSIF codeLine(pos1 to pos2) = "STD" THEN
              dFile <= B"00_0000"&code_std;
            ELSIF codeLine(pos1 to pos2) = "STR" THEN
              dFile <= B"00_0000"&code_str;
            ELSIF codeLine(pos1 to pos2) = "IN" THEN
              dFile <= B"00_0000"&code_in;
            ELSIF codeLine(pos1 to pos2) = "OUT" THEN
              dFile <= B"00_0000"&code_out;
            ELSIF codeLine(pos1 to pos2) = "JMP" THEN
              dFile <= B"00_0000"&code_jmp;
            ELSIF codeLine(pos1 to pos2) = "JZ" THEN
              dFile <= B"00_0000"&code_jz;
            ELSIF codeLine(pos1 to pos2) = "JC" THEN
              dFile <= B"00_0000"&code_jc;
            ELSIF codeLine(pos1 to pos2) = "JN" THEN
              dFile <= B"00_0000"&code_jn;
            ELSIF codeLine(pos1 to pos2) = "JO" THEN
              dFile <= B"00_0000"&code_jo;
            ELSIF codeLine(pos1 to pos2) = "JNZ" THEN
              dFile <= B"00_0000"&code_jnz;
            ELSIF codeLine(pos1 to pos2) = "JNC" THEN
              dFile <= B"00_0000"&code_jnc;
            ELSIF codeLine(pos1 to pos2) = "JNN" THEN
              dFile <= B"00_0000"&code_jnn;
            ELSIF codeLine(pos1 to pos2) = "JNO" THEN
              dFile <= B"00_0000"&code_jno;
            ELSE
              ASSERT FALSE;
              REPORT "ungueltiges Komando"
			        SEVERITY error;
            END IF; 
          ELSE
            ASSERT FALSE;
            REPORT "ungueltige Eingabe";
          END IF;
        END IF;
        pos1 := pos1+1;
      END LOOP;
    END LOOP;
    dFile <= (OTHERS => '0');
    
    WAIT FOR 50 ns;
    resCpu <= '1';
    WAIT FOR 50 ns;
    resCpu <= '1';
    WAIT;
  END PROCESS;
  
  memAddr: PROCESS(aOut, aWrite) BEGIN
    IF aWrite'EVENT THEN
      aMEM <= bit_vector(aWrite);
    ELSIF aOut'EVENT THEN
      aMEM <= aOut;
    END IF;
  END PROCESS memAddr;
  
  memData: PROCESS(dFile, dOutCpu) BEGIN
    IF aWrite'EVENT THEN
      dInMem <= dFile;
    ELSIF aOut'EVENT THEN
      dInMem <= dOutCpu;
    END IF;
  END PROCESS memData;
  
  
END simul;
