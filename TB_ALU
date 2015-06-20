use work.def_package.all;

entity TB_ALU is
end TB_ALU;


architecture TB of TB_ALU is 
component ALU 
port( O1, O2: in data_type; Carry: in bit; Operation: in opcode_type;
	Result: out data_type; Flags: out flag_type
	);

end component;

signal O1, O2: data_type; 
signal	Carry: bit;
signal	Operation: opcode_type;
signal  Result: data_type;
signal Flags: flag_type;

begin
I1: ALU port map(O1, O2, Carry, Operation, Result, Flags);
Operation<= "000111" after 10 ns;
O1<= B"1111_1111_1111" after 9 ns;
O2<= B"0011_1111_1111" after 9 ns;
end TB;
