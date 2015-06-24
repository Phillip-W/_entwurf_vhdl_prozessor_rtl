USE work.def_package.ALL;
-- geschrieben Flo Maurer (auf Basis des Verhaltensmodels von Lei)
Entity shifter Is
  Port (OPCode: in opcode_type;
        Flagsin: in flag_type;
	Flagsout: out flag_type;
        OP1, OP2: in data_type;
        result: out data_type);
END ENTITY;

ARCHITECTURE shift of shifter IS
  Constant OPlength: Integer:= OP1'length-1;
  BEGIN
    Process(OPCode)
      Begin
        if OPCode = code_sll then     
           Flagsout(2)<=OP1(OP1'left);
           if (OP1(OP1'left)='1') xor (OP1(OP1'left-1)='1') then
             Flagsout(0)<= '1';
           else
             Flagsout(0)<= '0';
           end if;
          result(result'left downto 1) <= OP1(OP1'left-1 downto 0);
          result(result'right) <= '0';
        elsif OPCode = code_srl then
            Flagsout(2)<=OP1(OP1'right);Flagsout(0)<= '0';
            result(result'left) <= '0';
            result(result'left-1 downto 0) <= OP1(OP1'left downto 1);
        elsif OPCode = code_sra then
          Flagsout(2)<=OP1(OP1'right); Flagsout(0)<= '0';
          result(result'left) <=OP1(OP1'left);
          result(result'left-1 downto 0) <= OP1(OP1'left downto 1);
        elsif OPCode = code_rol OR OPCode = code_rolc then
	  Flagsout(0)<= '0';
          if Flagsin(2)='1' then
	    Flagsout(2)<=OP1(OP1'left);
            result(result'left downto 1) <= OP1(OP1'left-1 downto 0);
            result(result'right) <= '1' ;
          else
	    Flagsout(2)<='0';
            result(result'left) <= OP1(OP1'right);
            result(result'left-1 downto 0) <= OP1(OP1'left downto 1);
          end if;
        elsif OPCODE = code_ror OR OPCode = code_RORC then
	  Flagsout(0)<= '0';
          if Flagsin(2)='1' then
	    Flagsout(2)<=OP1(OP1'right);
            result(result'left) <= '1';
            result(result'left-1 downto 0) <= OP1(OP1'left downto 1);
          else
	    Flagsout(2)<='0';
            result(result'right) <= OP1(OP1'left);
            result(result'left downto 1) <= OP1(OP1'left-1 downto 0);
          end if;
        End IF;
      END Process;
END shift;
