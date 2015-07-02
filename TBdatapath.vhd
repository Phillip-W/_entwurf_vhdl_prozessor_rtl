use work.def_package.all;

entity TBDataPath is
end TBDataPath;


architecture TB of TBDataPath is

component datapath is 
port( 
	CLK	: in bit;
	RST	: in bit;
	D_OUT_1	: out data_type;
	D_OUT_2	: buffer data_type;
	FLAGS	: buffer flag_type;
	D_IN	: in data_type;
	FC_SEL, REG_EN: in bit;
	OP: in opcode_type;
	SEL_IN, SEL_OUT_A, SEL_OUT_B, SEL_OUT_C: in reg_addr_type
	);
end component;

signal CLK : bit;
signal RST: bit;
signal D_OUT_1: data_type;
signal D_OUT_2: data_type;
signal FLAGS: flag_type;
signal D_IN: data_type;
signal FC_SEL, REG_EN: bit;
signal OP: opcode_type;
signal SEL_IN, SEL_OUT_A, SEL_OUT_B, SEL_OUT_C: reg_addr_type;
begin


end TB;
