ENTITY adder IS
  PORT(
    SIGNAL mode: IN bit;                            -- ADD = 0 or SUB = 1
    SIGNAL c_in: IN bit;                            -- bei ADDC = 0 sonst Carry weitergeben
    SIGNAL op1, op2: IN bit_vector(11 downto 0);    -- Eingangsoperanten
    SIGNAL c_out,n_out,o_out: OUT bit;              -- Flags
    SIGNAL re: OUT bit_vector(11 downto 0)          -- Ergebnis
  );
END adder;

ARCHITECTURE behav1 OF adder IS
  --SIGNAL op2_loc: bit_vector(11 downto 0);
  SIGNAL c_loc: bit_vector(12 downto 0);
  SIGNAL re_and, re_xor, rec: bit_vector(11 downto 0);
  SIGNAL re_loc: bit_vector(11 downto 0);
  SIGNAL n_loc: bit;
  
BEGIN
  PROCESS(mode, c_in, op1, op2)
  BEGIN
    c_loc <= (0 => c_in XOR mode, OTHERS => '0');
    
    FOR i IN 0 TO 11 LOOP
      re_and(i) <= op1(i) AND (op2(i) XOR mode);
      re_xor(i) <= op1(i) XOR (op2(i) XOR mode);
      rec(i) <= re_xor(i) AND c_loc(i);
      c_loc(i+1) <= re_and(i) OR c_loc(i);
      re_loc(i) <= c_loc(i) XOR re_xor(i);
    END LOOP;
    
    n_loc <= re_xor(11) XOR c_loc(12);
  END PROCESS;
  
  c_out <= c_loc(12);
  o_out <= n_loc XOR re_loc(11);
  n_out <= n_loc;
  re <= re_loc;

END behav1;

ARCHITECTURE behav2 OF adder IS
  SIGNAL mode_vec: bit_vector(11 downto 0);
  SIGNAL c_loc: bit_vector(11 downto 0);
  SIGNAL re_and, re_xor, rec: bit_vector(11 downto 0);
  SIGNAL re_loc: bit_vector(11 downto 0);
  SIGNAL n_loc: bit;
  
BEGIN
  mode_vec <= (OTHERS => mode);
  re_and <= op1 AND (op2 XOR mode_vec);
  re_xor <= op1 XOR (op2 XOR mode_vec);
  rec <= (c_loc(10 downto 0) & (c_in XOR mode)) AND re_xor;
  c_loc <= re_and OR rec;
  c_out <= c_loc(11);
  re <= (c_loc(10 downto 0) & (c_in XOR mode)) XOR re_xor;
  
  n_out <= c_loc(11) XOR re_xor(11);
  o_out <= c_loc(11) XOR c_loc(10);
END behav2;
