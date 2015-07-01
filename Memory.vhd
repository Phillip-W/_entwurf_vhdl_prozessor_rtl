library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_bit.all; 
USE work.def_package.ALL;

entity Memory is
  port (addr: in bit_vector(addr_width-1 downto 0);
        d_in: in bit_vector(data_width-1 downto 0);
        w_en, rst, clk: in bit;
        d_out: out bit_vector(data_width-1 downto 0));
end entity;

Architecture behav of Memory is
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
