USE work.def_package.all;

ENTITY flag_check IS
  PORT(
    SIGNAL flag_in: IN flag_type;
    SIGNAL alu_res: IN data_type;
    SIGNAL pc: IN addr_type;
    SIGNAL flag_out: OUT flag_type
    
  );
END flag_check;

ARCHITECTURE behav OF flag_check IS
  CONSTANT zero: data_type := (OTHERS => '0'); 
BEGIN
  check: PROCESS(alu_res, pc)
  BEGIN
    flag_out <= flag_in(3 downto 1) & '0';
    IF alu_res = zero OR pc = zero THEN
      flag_out(0) <= '1';
    END IF;
  END PROCESS check;
END behav;
