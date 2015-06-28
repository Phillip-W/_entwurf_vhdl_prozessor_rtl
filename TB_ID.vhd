use work.def_package.all;

entity TBID is
end TBID;


architecture TB of TBID is

component ID  
port ( INSTR		: in instruction_type;
	FLAGS		: in flag_type;
	--control singals for datapaht
	OP		: out opcode_type;
	SEL_IN		: out reg_addr_type;
	SEL_OUT_A	: out reg_addr_type;	
	SEL_OUT_B	: out reg_addr_type;
	SEL_OUT_C	: out reg_addr_type;
	--control signals for FSM--
	TAKE_JMP	: out bit;
	STORE		: out bit;
	CMD_CALC	: out bit;
	CMD_CONST	: out bit;
	CMD_DIR		: out bit;
	CMD_REG		: out bit;
	CMD_IO		: out bit;
	CMD_PC		: out bit;
	CMD_JMP		: out bit;
	CMD_STOP	: out bit
	);
end component;

signal INSTR: data_type;
signal FLAGS: flag_type;
signal OP: opcode_type;
signal SEL_IN, SEL_OUT_A, SEL_OUT_B, SEL_OUT_C: reg_addr_type;
signal TAKE_JMP, STORE, CMD_CALC, CMD_CONST, CMD_DIR, CMD_REG, CMD_IO, CMD_PC, CMD_JMP, CMD_STOP: bit;

begin

I1: ID port map(INSTR, FLAGS, OP, SEL_IN, SEL_OUT_A, SEL_OUT_B, SEL_OUT_C, TAKE_JMP, STORE, CMD_CALC, CMD_CONST, CMD_DIR, CMD_REG, CMD_IO, CMD_PC, CMD_JMP, CMD_STOP);

INSTR (11 downto 6)<= code_add after 5 ns, code_jmp after 10 ns;
INSTR (5 downto 0) <= "011110" after 5 ns;
FLAGS (2) <= '1' after 5 ns;

end TB;
