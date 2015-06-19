

use work.def_package.all;

entity LogicUnit is
	port (
		O1 : in data_type;
		O2 : in data_type;
		Operation : in opcode_type;
		Result : out data_type;
		FZero: out bit;
		FCarry: out bit;
		FOverflow: out bit;
		FNegative: out bit
	);
end LogicUnit;


architecture RTL of LogicUnit is
begin
process(O1, O2, Operation)
begin
case Operation is
when "000110" => Result<= NOT (O1);
when "000111" => Result<= O1 AND O2;
when "001000" => Result<= O1 OR O2;
when "001001" => Result<= O1 XOR O2;
when "001010" => Result(0)<= REA(O1);
when "001011" => Result(0)<= REO(O1);
when "001100" => Result(0)<= REX(O1);
when others =>
end case;

end process;
FCarry<= '0';
FOverflow<='0';
FNegative<= '0';
end RTL;
		
