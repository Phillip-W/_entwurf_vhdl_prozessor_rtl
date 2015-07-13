-- Hier wird von einem Memory File in die CPU eingelesen.
-- Die CPU an sich kann nur mit bit_vector arbeiten.
LIBRARY IEEE;
USE work.def_package.ALL;
USE std.textio.ALL;
USE work.CPU_tb_pac.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_bit.all;
USE work.CPU_tb_pac.all;


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
     port (addr, addr_init: in bit_vector(addr_width-1 downto 0); -- init-Eingänge sind Testbench spezifiisch
        d_in, d_in_init: in bit_vector(data_width-1 downto 0);
        w_en, w_en_init, rst, clk, clk_init: in bit;
        d_out: out bit_vector(data_width-1 downto 0));
  END COMPONENT;
  
  SIGNAL inputData, outputData: data_type; -- nur Loc in TB
  
  SIGNAL clk_init_tmp, clkTemp, resTemp, resCpu, resAll: bit:='1';
  SIGNAL dInCpu, dInMem, dInMem_init, dFile: data_type; -- data In signale
  SIGNAL dOutMem, dOutCpu, dOut: data_type; -- data Out Signale
  SIGNAL inDevRdy, outDevRdy, devRdy: bit; -- für IO Mux, IO dev rdy gesetzt wenn Input vorhanden/Output Clear
  SIGNAL inDevData, outDevData: data_type; -- IO Device Daten
  SIGNAL ioType, ioEn: bit; -- für IOrdy Mux
  SIGNAL act: bit; -- CPU active
  SIGNAL wEnCpu, wEnWrite, wEn, wEN_init: bit; -- für Memory beschreiben
  SIGNAL aOut, aMem, aMem_init: addr_type; -- für Memory bechreiben
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
    addr_init => aMem_init,
    d_in => dInMem,
    d_in_init => dInMem_init,
    w_en => wEn, 
    w_en_init => wEN_init,
    rst => resAll, 
    clk => clkTemp,
    d_out => dOutMem,
    clk_init => clk_init_tmp
  );
  
  resTemp <= resAll OR resCpu; -- cpu nach memory initialisierung neustartbar mit res cpu <= 1
  
  -- IOrdyMux
  with ioType select
    devRdy <= inDevRdy when '0',
              outDevRdy when others;
  
  clkTemp <= NOT clkTemp after 50 ns when act = '1' else '0';
  
  -- dataInMux
  with dInMux select
    dInCpu <= inDevData when '1',
              dOutMem when others;
  
  write_reset: PROCESS
  Variable Parm: BOOLEAN:=FALSE; -- gibt an, ob Parameter erwartet werden  
	Variable OPC: data_type:= (others => '0');
	Variable Memory_array: mem_type;
  BEGIN
    
    init_memory(Parm, OPC, Memoryfile, Memory_array); -- Speicher mit init_memory initialisieren
    for i in 0 to 2**addr_width - 1 loop
      clk_init_tmp <= '0'; 
      aMem_init <= bit_vector(to_unsigned(i,addr_width));
      dInMem_init <= Memory_array(i);
      wEN_init<= '1'; wait for 0 ns;
      clk_init_tmp <= '1'; wait for 0 ns;
      resCPU <= '0'; wait for 0 ns; resCPU <= '1';
    END loop;
    wait;
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
