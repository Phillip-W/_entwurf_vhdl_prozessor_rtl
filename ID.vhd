
use work.def_package.all;

entity ID is
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
end ID;

architecture case_driven_with_default_assignment of ID is
begin

process(INSTR, FLAGS)
begin

OP<= INSTR (data_width-1 downto 6);
SEL_IN<= INSTR (5 downto 4);
SEL_OUT_C<= INSTR (5 downto 4);
SEL_OUT_B<= INSTR (3 downto 2);
SEL_OUT_A<= INSTR (1 downto 0);


TAKE_JMP<= '0'; STORE<= '0'; CMD_CALC<= '0'; CMD_CONST<= '0'; CMD_DIR<= '0'; CMD_REG<= '0'; CMD_IO<= '0'; CMD_PC<= '0'; CMD_JMP<= '0'; CMD_STOP<= '0';

case (INSTR (data_width-1 downto 6)) is
	when code_stop => CMD_STOP<= '1';
	when code_add | code_addc | code_sub | code_subc | code_not | code_and | code_or | code_xor | 
		code_rea | code_reo | code_rex | code_sll | code_srl | code_sra | code_rol | code_rolc |
		code_ror | code_rorc  => CMD_CALC<= '1';
	when code_ldc => CMD_CONST <= '1';
	when code_ldd => CMD_DIR <= '1';
	when code_std => CMD_DIR <= '1'; STORE <= '1';
	when code_ldr => CMD_REG <= '1';
	when code_str => CMD_REG <= '1'; STORE <= '1';
	when code_in => CMD_IO <= '1';
	when code_out => CMD_IO <= '1'; STORE <= '1';
	--when code_ldpc => CMD_PC <='1';
	--when code_stpc => CMD_PC <='1'; STORE <= '1'; steht im skript... haben wir aber eigentlich gar nicht
	when code_jmp => CMD_JMP <='1'; TAKE_JMP <= '1';
	when code_jz | code_jc | code_jn | code_jo | code_jnz | code_jnc | code_jnn | code_jno => CMD_JMP<= '1'; TAKE_JMP <= '1';
	when others => null;
end case;
end process;

end case_driven_with_default_assignment;
