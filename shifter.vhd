USE work.def_package.ALL;

Entity shifter Is
  Port (OPCode: in opcode_type;
        Flags: in flag_type;
        OP1, OP2: in data_type;
        result: out data_type);
END ENTITY;

ARCHITECTURE shift of shifter IS
  Constant OPlength: Integer:= OP1'length-1;
  BEGIN
    Process
      Begin
        if OPCode = code_sll then     -- muss mir die einzelnen shifts noch anschauen
          RESULT(OPlength downto 1)<=OP1(OPlength-1 downto 0);
        elsif OPCode = code_srl then
          RESULT(OPlength-1 downto 0)<=OP1(OPlength downto 1);
        elsif OPCode = code_sra then
          RESULT(OPlength-1 downto 0)<=OP1(OPlength downto 1);
        End IF;
      END Process;
END shift;
