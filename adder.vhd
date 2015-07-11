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
  SIGNAL c_loc: bit_vector(11 downto 0);
  SIGNAL re_and, re_xor, re_c: data_type;
  SIGNAL re_loc: data_type;
  SIGNAL n_loc: bit;  -- für flags
  SIGNAL loc_xor: bit;
  
BEGIN
  mode: PROCESS(opcode) 
  BEGIN
    IF opcode = code_sub OR opcode = code_subc THEN
      mode_vec <= (OTHERS => '1');
    ELSE
      mode_vec <= (OTHERS => '0');
    END IF;
  END PROCESS mode;
  carry: PROCESS (opcode)
  BEGIN
    IF opcode = code_addc OR opcode = code_subc THEN
      re_c <= (c_loc(10 downto 0) & flags_in(3)) AND re_xor;
    ELSE
      re_c <= (c_loc(10 downto 0) & '0') AND re_xor;
    END IF;
  END PROCESS carry;
  re_and <= op1 AND (op2 XOR mode_vec);
  re_xor <= op1 XOR (op2 XOR mode_vec);
  c_loc <= re_and OR re_c;
  resault: PROCESS (opcode)
  BEGIN
    IF opcode = code_addc OR opcode = code_subc THEN
      re_loc <= (c_loc(10 downto 0) & flags_in(3)) XOR re_xor;
    ELSE
      re_loc <= (c_loc(10 downto 0) & '0') XOR re_xor;
    END IF;
  END PROCESS resault;
  re <= re_loc;

  loc_xor <= op1(11) XOR (op2(11) XOR mode_vec(11));
  n_loc <= loc_xor XOR c_loc(11);
  flags_out(3) <= flags_in(3);
  flags_out(2) <= c_loc(11);
  flags_out(1) <= n_loc;
  flags_out(0) <= n_loc XOR re_loc(11);

END behav;
