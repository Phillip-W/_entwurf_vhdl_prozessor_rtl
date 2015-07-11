
use work.def_package.all;

entity datapath is 
	port( 
	CLK	: in bit;
	RST	: in bit;
	D_OUT_1	: out data_type;
	D_OUT_2	: out data_type;
	FLAGS	: out flag_type;
	D_IN	: in data_type;
	FC_SEL, REG_EN: in bit;
	OP: in opcode_type;
	SEL_IN, SEL_OUT_A, SEL_OUT_B, SEL_OUT_C: in reg_addr_type
	);
end datapath;

architecture RTL of datapath is
signal flags_FL_AL: flag_type;
signal flags_FC_FL: flag_type;
signal result_FC_RF: data_type;
signal result_AL_FC: data_type;
signal flags_AL_FC: flag_type;
signal O1_RF_AL: data_type;
Signal Flags_intern: flag_type;
Signal D_out_2_intern: data_type;
begin

FC: entity work.flag_check(behav) port map (FC_SEL, flags_AL_FC, result_AL_FC, D_IN, flags_FC_FL, Result_FC_RF);

FL: entity work.flags(behav) port map ( CLK, RST, REG_EN, flags_FC_FL, FLAGS_intern);

AL: entity work.ALU(RTL) port map ( O1_RF_AL, D_OUT_2_intern, Flags_intern, OP, result_AL_FC, flags_AL_FC);

RF: entity work.reg_file(behav) port map ( CLK, RST, REG_EN, SEL_IN, SEL_OUT_A, SEL_OUT_B, SEL_OUT_C, result_FC_RF, O1_RF_AL, D_OUT_1, D_OUT_2_intern);
  
D_out_2 <= D_out_2_intern;
Flags <= Flags_intern;


end RTL;
