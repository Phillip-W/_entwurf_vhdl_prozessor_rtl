-- Hier wird die Verkabelung der einzlnen Komponenten statt finden, aber keine eigene Logik!
use work.def_package.all;

entity CPU is
port (
	CLK		: in bit;
	RST		: in bit;
	
-- command and address in, flags
	D_IN		: in data_type;
	A_IN_2		: buffer data_type;	

-- memory and other external interface

	DEV_RDY		: in bit;
	A_OUT		: buffer data_type;
	W_EN, D_IN_MUX	: out bit;
	IO_TYPE, IO_EN	: out bit;
	
-- active signal
	ACTVE		: out bit
	);
end CPU;


architecture RTL of Controller is

-- datapath signals
signal	FC_SEL, REG_EN	: bit;
signal	SEL_IN		: reg_addr_type;
signal	SEL_OUT_A	: reg_addr_type;
signal	SEL_OUT_B	: reg_addr_type;
signal	SEL_OUT_C	: reg_addr_type;
signal	OP		: opcode_type;
signal	D_OUT		: data_type;
	
-- controller signals 
signal D_OUT_MUX: bit;
signal INSTR: instruction_type;
signal CTRL: bit_vector (10 downto 0); --in the following order take_jump, store, cmd_calc, cmd_const, cmd_dir, cmd_reg, cmd_IO, cmd_PC, cmd_jump, cmd_stop
signal INSTR_EN: bit;
signal PC_MUX: bit;
signal PC_EN: bit;
signal ADDR_EN: bit;
signal ADDR: addr_type;
signal PC_IN: addr_type;
signal PC: addr_type;
signal signal_A_IN_2: data_type;
signal A_OUT_MUX: bit_vector (1 downto 0);
signal A_IN_1: data_type;
signal FLAGS: flag_type;
signal INC_OUT: addr_type;

begin 


ID: entity work.ID(RTL) port map (INSTR, FLAGS, OP, SEL_IN, SEL_OUT_A, SEL_OUT_B, SEL_OUT_C, CTRL(0), CTRL(1), CTRL(2), CTRL(3), CTRL(4), CTRL(5), CTRL(6), CTRL(7),CTRL(8), CTRL(9));


FS: entity work.FSM(behav) port map (CTRL(0), CTRL(1), CTRL(2), CTRL(3), CTRL(4), CTRL(5), CTRL(6),
			 CTRL(7), CTRL(8), CTRL(9), DEV_RDY, CLK, RST, INSTR_EN, ADDR_EN, PC_EN, 
			PC_MUX, REG_EN, FC_SEL, D_IN_MUX, D_OUT_MUX, W_EN, IO_TYPE, IO_EN, A_OUT_MUX);

INS: entity work.instr(behav) port map (CLK, RST, INSTR_EN, D_IN, INSTR);

AD: entity work.addr(behav) port map (CLK, RST, ADDR_EN, D_IN, ADDR); 

PCO: entity work.PC(behav) port map (CLK, RST, PC_EN, PC_IN, PC);

INC: entity work.INC(behav) port map (A_OUT, INC_OUT);

M1: entity work.mux12_2x1(RTL_clk) port map (D_OUT_MUX ,D_IN, PC, D_OUT); --muss noch korrigiert werden, nicht sicher ob die Reihenfolge von D_IN und PC stimmt

M2: entity work.mux12_2x1(RTL_clk) port map (PC_MUX, signal_A_IN_2, INC_OUT, PC_IN);-- auch nicht sicher, wo welches signals sein muss 

M3: entity work.mux12_4x1(RTL_clk) port map ( A_OUT_MUX, "000000000000",A_IN_1, ADDR, PC,  A_OUT);-- muss noch korrigiert werden

DP: entity work.datapath(RTL) port map (CLK, RST, A_IN_2, A_IN_1, FLAGS, D_OUT, FC_SEL, REG_EN, OP,
			 SEL_IN, SEL_OUT_A, SEL_OUT_B, SEL_OUT_C);




end RTL;
