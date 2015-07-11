library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_bit.all; 
USE work.def_package.ALL;

entity Memory is -- für unsere TB
  port (addr, addr_init: in bit_vector(addr_width-1 downto 0); -- init-Eingänge sind Testbench spezifiisch
        d_in, d_in_init: in bit_vector(data_width-1 downto 0);
        w_en, w_en_init, rst, clk, clk_init: in bit;
        d_out: out bit_vector(data_width-1 downto 0));
end entity;

Architecture behav of Memory is
  type  mem_type is array (0 to 2**addr_width-1) of
        bit_vector(data_width-1 downto 0);
  Signal mem: mem_type;
  
  Begin
    process(clk, clk_init)
    Begin
      if clk='1' and clk'event then
        if rst='1' then
          mem <= (others => (others => '0'));
        elsif w_en='1' then
          mem(TO_INTEGER(UNSIGNED(addr))) <= d_in;
        else
          d_out <= mem(TO_INTEGER(UNSIGNED(addr)));
        end if;
      elsif clk_init='1' and clk_init'event then
        if rst='1' then
          mem <= (others => (others => '0'));
        elsif w_en_init='1' then
          mem(TO_INTEGER(UNSIGNED(addr_init))) <= d_in_init;
        ENd if;
      end if;
    end process;            
END Architecture; 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_bit.all; 
USE work.def_package.ALL;

entity Memory_S is -- für System.vhd
  port (addr: in bit_vector(addr_width-1 downto 0); 
        d_in: in bit_vector(data_width-1 downto 0);
        w_en, rst, clk: in bit;
        d_out: out bit_vector(data_width-1 downto 0));
end entity;

Architecture behav of Memory_S is
  type  mem_type is array (0 to 2**addr_width-1) of
        bit_vector(data_width-1 downto 0);
  Signal mem: mem_type;
  
  Begin
    process(clk)
    Begin
      if clk='1' and clk'event then
        if rst='1' then
          mem <= (others => (others => '0'));
        elsif w_en='1' then
          mem(TO_INTEGER(UNSIGNED(addr))) <= d_in;
        else
          d_out <= mem(TO_INTEGER(UNSIGNED(addr)));
        end if;
      end if;
    end process;            
END Architecture; 

