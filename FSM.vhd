USE work.def_package.all;

ENTITY FSM IS
PORT(
take_jmp, store, cmd_calc, cmd_const, cmd_dir, cmd_reg, cmd_io, cmd_pc, cmd_jmp, cmd_stop : IN bit;
dev_rdy, clk, rst: IN bit;
instr_en, addr_en, pc_en, pc_mux, reg_en, fc_sel, d_in_mux, d_out_mux, w_en, io_type, io_en: OUT bit; --aktiv mal auskommentiert
a_out_mux: OUT bit_vector(1 downto 0)
);
END FSM;

ARCHITECTURE behav OF FSM IS

SIGNAL state: state_type := "00000";

BEGIN
nextstate: PROCESS(clk, rst)
BEGIN
	IF rst = '0' THEN
		state <= s_if;
	ELSIF clk = '1' AND clk'EVENT THEN
		CASE state IS
			WHEN s_if =>
				state <= s_pfex;
			WHEN s_pfex =>
				IF cmd_io = '1' THEN
					state <= s_io;
				ELSIF cmd_dir = '1' THEN
					state <= s_mem;
				ELSIF cmd_stop = '1' THEN
					state <= s_stop;
				ELSE
					state <= s_if;
				END IF;
			WHEN s_io =>
				IF dev_rdy = '1' THEN
					state <= s_if;
				ELSE
					state <= s_io;
				END IF;
			WHEN s_mem => 
				state <= s_if;
			WHEN s_stop =>
				state <= s_stop;
			WHEN OTHERS => 
				state <= s_if;
		END CASE;
	END IF;
END PROCESS nextstate;

a_out_mux(1) <= state(3) AND cmd_reg;
a_out_mux(0) <= (state(4) AND take_jmp) OR state(1);
instr_en <= state(4);
addr_en <= state(3) AND (cmd_dir OR cmd_jmp);
pc_en <= state(4) OR (state(3) AND (cmd_const OR cmd_dir OR (cmd_pc AND store) OR cmd_jmp));
pc_mux <= state(3) AND cmd_pc;
reg_en <= (state(3) AND (cmd_calc OR cmd_const OR ((cmd_reg OR cmd_pc) AND NOT store))) OR (state(1) AND NOT store) OR (state(2) AND dev_rdy AND NOT store);
fc_sel <= NOT cmd_calc;
d_in_mux <= state(2);
d_out_mux <= cmd_pc;
w_en <= (state(3) AND cmd_reg AND store) OR (state(1) AND store);
io_type <= (state(3) AND cmd_reg AND store) OR (state(1) AND store);
io_en <= state(2) AND dev_rdy;
--aktiv <= NOT state(0);

END behav;
