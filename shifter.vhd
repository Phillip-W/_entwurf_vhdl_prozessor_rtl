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
    Process(OPCode)
      Begin
        if OPCode = code_sll then     -- muss mir die einzelnen shifts noch anschauen
          -- if OP1(OP1'left) = '1' then
            -- Flags(2)<= True;
          -- else
            -- Flags(2)<= FALSE;
          -- end if;
          -- if (OP1(OP1'left)='1') xor (OP1(OP1'left-1)='1') then
            -- Flags(0)<= True;
          -- else
            -- Flags(0)<= False;
          -- end if;
          result(result'left downto 1) <= OP1(OP1'left-1 downto 0);
          result(result'right) <= '0';
        elsif OPCode = code_srl then
          -- if OP1(OP1'right) = '1' then
            -- Flags(2)<= True;
          -- else
            -- Flags(2)<= False;
          -- end if;
            result(result'left) <= '0';
            result(result'left-1 downto 0) <= OP1(OP1'left downto 1);
        elsif OPCode = code_sra then
          -- if OP1(OP1'right) = '1' then
            -- Flags(2)<= True;
          -- else
            -- Flags(2)<= False;
          -- end if;
          result(result'left) <=OP1(OP1'left);
          result(result'left-1 downto 0) <= OP1(OP1'left downto 1);
        elsif OPCode = code_rol OR OPCode = code_rolc then
          if Flags(2)='1' then
            result(result'left downto 1) <= OP1(OP1'left-1 downto 0);
            result(result'right) <= '1' ;
          else
            result(result'left) <= OP1(OP1'right);
            result(result'left-1 downto 0) <= OP1(OP1'left downto 1);
          end if;
        elsif OPCODE = code_ror OR OPCode = code_RORC then
          if flags(2)='1' then
            result(result'left) <= '1';
            result(result'left-1 downto 0) <= OP1(OP1'left downto 1);
          else
            result(result'right) <= OP1(OP1'left);
            result(result'left downto 1) <= OP1(OP1'left-1 downto 0);
          end if;
        End IF;
      END Process;
END shift;
