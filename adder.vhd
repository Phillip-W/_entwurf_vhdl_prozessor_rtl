USE work.def_package.all;

ENTITY adder IS
  PORT(
    SIGNAL opcode: IN opcode_type;    -- ADD = 0 or SUB = 1
    SIGNAL flags_in: IN flag_type;                 
    SIGNAL op1, op2: IN data_type;    -- Eingangsoperanten
    SIGNAL flags_out: OUT flag_type;            -- Flags
    SIGNAL re: OUT data_type         -- Ergebnis
  );
END adder;

ARCHITECTURE behav OF adder IS
  
  SIGNAL mode_vec: data_type;
  SIGNAL c_loc: bit_vector(12 downto 0);
  SIGNAL re_and, re_xor, rec: data_type;
  SIGNAL re_loc: data_type;
  SIGNAL n_loc: bit;
  
BEGIN
  
  mode: PROCESS(opcode)
  BEGIN
    mode_vec <= (OTHERS => '0');
    c_loc <= (OTHERS => '0');
    IF opcode = code_addc THEN
        c_loc <= (0 => '1');
    ELSIF opcode = code_sub THEN
        mode_vec <=(OTHERS => '1');
    ELSIF opcode = code_subc THEN
        mode_vec <=(OTHERS => '1');
        c_loc <= (0 => '1');
    END IF;
  END PROCESS mode;
  
  re_and <= op1 AND (op2 XOR mode_vec);
  re_xor <= op1 XOR (op2 XOR mode_vec);
  rec <= (c_loc(11 downto 1) & (c_loc(0) XOR mode_vec(0))) AND re_xor;
  c_loc(12 downto 1) <= re_and OR rec;
  flags_out(2) <= c_loc(12);
  re <= (c_loc(11 downto 1) & (c_loc(0) XOR mode_vec(0))) XOR re_xor;
  
  flags_out(1) <= c_loc(12) XOR re_xor(11);
  flags_out(0) <= c_loc(12) XOR c_loc(10);
END behav;
