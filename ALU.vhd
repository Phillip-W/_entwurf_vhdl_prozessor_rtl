
use work.def_package.all;

entity ALU is
	port( 
		O1, O2: in data_type; 
		Flags_in: in flag_type; 
		Operation: in opcode_type;
		Result: out data_type; 
		Flags_out: out flag_type
	);
end ALU;

architecture RTL of ALU is
signal AD_Res_out, LU_Res_out, SH_Res_out : data_type;
signal AD_Flags_out, LU_Flags_out, SH_Flags_out : flag_type;
signal select_it: bit_vector (1 downto 0);

COMPONENT adder 
  PORT(
    SIGNAL opcode: IN opcode_type;
    SIGNAL flags_in: IN flag_type;                               
    SIGNAL op1, op2: IN data_type; 
    SIGNAL flags_out: OUT flag_type; 
    SIGNAL re: OUT data_type
  );
END COMPONENT;

begin



--AD: entity work.adder(behav) port map (opcode=> Operation, Carry=> Carry, op1=> O1, op2=> O2, flags_out=>AD_Flags_out, re=> AD_Res_out);

LU: entity work.LogicUnit(RTL) port map(O1=> O1, O2=> O2, Operation=> Operation, Result=> LU_Res_out, FlagsOut=> LU_Flags_out);

SH: entity work.shifter(shift) port map(OPCode=> Operation, Flagsin=> Flags_in, Flagsout=> SH_Flags_out, OP1=>O1, OP2=> O2, result=> SH_Res_out);

AD: adder PORT MAP(opcode => Operation, flags_in => Flags_in, op1 => O1, op2 => O2, flags_out => AD_Flags_out, re => AD_Res_out);

mux1: entity work.mux12_4x1(RTL_clk) port map(select_input=> select_it, d_in_b=> AD_Res_out, d_in_c=> LU_Res_out, d_in_d=> SH_Res_out, d_in_a=> "000000000000", d_out=> Result);

mux2: entity work.mux4_4x1(RTL_clk) port map(select_input=> select_it, d_in_b=> AD_Flags_out, d_in_c=> LU_Flags_out, d_in_d=> SH_Flags_out, d_in_a=> "0000", d_out=> Flags_out);

process(O1, O2, Flags_in, Operation)
begin
case operation is
	when code_add=> select_it<= "01";
	when code_addc=> select_it<= "01";
	when code_sub=> select_it<= "01";
	when code_subc=> select_it<= "01";
	when code_not=> select_it<= "10";
	when code_and=> select_it<= "10";
	when code_or=> select_it<= "10";
	when code_xor=> select_it<= "10";
	when code_rea=> select_it<= "10";
	when code_reo=> select_it<= "10";
	when code_rex=> select_it<= "10";
	when code_sll=> select_it<= "11";
	when code_srl=> select_it<= "11";
	when code_sra=> select_it<= "11";
	when code_rol=> select_it<= "11";
	when code_rolc=> select_it<= "11";
	when code_ror=> select_it<= "11";
	when code_rorc=> select_it<= "11";
	when others => report "No valid opcode ALU" severity warning;
end case;
end process;

end RTL;
