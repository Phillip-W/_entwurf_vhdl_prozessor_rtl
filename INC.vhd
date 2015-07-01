Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_bit.ALL;
USE work.def_package.ALL;

ENTITY INC IS
  port( inc_in: in bit_vector(addr_width-1 downto 0);
        inc_out: out bit_vector(addr_width-1 downto 0));
END ENTITY;

ARCHITECTURE behav OF INC IS
  BEGIN
    inc_out <= bit_vector((unsigned(inc_in)+1)MOD 2**addr_width);      
END ARCHITECTURE;
