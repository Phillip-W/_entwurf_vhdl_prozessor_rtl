
use work.def_package.all;

entity LogicUnit is
	port (
		O1 : in data_type;
		O2 : in data_type;
		Operation : in opcode_type;
		Result : out data_type;
		FlagsOut: out flag_type
	);
end LogicUnit;


architecture RTL of LogicUnit is
begin
process(O1, O2, Operation)
begin
case Operation is
when code_not  => Result<= NOT (O1);
when code_and => Result<= O1 AND O2;
when code_or => Result<= O1 OR O2;
when code_xor => Result<= O1 XOR O2;
when code_rea => Result(0)<= REA(O1);
when code_reo => Result(0)<= REO(O1);
when code_rex => Result(0)<= REX(O1);
when others =>
end case;
end process;

FlagsOut(0)<= '0';
FlagsOut(1)<= '0';
FlagsOut(2)<='0';
FlagsOut(3)<= '0';
end RTL;
		
