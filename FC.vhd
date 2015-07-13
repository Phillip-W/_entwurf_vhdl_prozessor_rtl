USE work.def_package.all;

ENTITY flag_check IS
  PORT(
    SIGNAL fc_sel: IN bit;
    SIGNAL flag_in: IN flag_type;
    SIGNAL alu_res: IN data_type;
    SIGNAL d_in: IN data_type;
    SIGNAL flag_out: OUT flag_type;
    RF_IN : out data_type    
  );
END flag_check;

ARCHITECTURE behav OF flag_check IS
  CONSTANT zero: data_type := (OTHERS => '0'); 
BEGIN
  check: PROCESS(alu_res, d_in, fc_sel)
  BEGIN
    flag_out <= '0' & flag_in(2 downto 0);
    IF fc_sel = '0' THEN
      IF alu_res = zero THEN
        flag_out(3) <= '1';
      END IF;
      RF_IN <= alu_res;
    ELSE
      IF d_in = zero THEN
        flag_out(3) <= '1';        
      END IF;
      RF_IN <= d_in;
    END IF;
  END PROCESS check;
END behav;
