USE work.def_package.ALL;

ENTITY reg_file IS -- geschrieben von Flo Maurer
	generic (N: natural);
	port ( 	clk, rst, enab: in bit;
		SEL_in, SEL_out_A, SEL_out_B, SEL_out_C: in bit_vector (1 downto 0);
		RF_IN: in bit_vector (data_width-1 downto 0);
		ALU_IN, D_OUT_1, D_OUT_2 : out bit_vector (data_width-1 downto 0));
END ENTITY;

ARCHITECTURE behav OF reg_file IS
	component reg is
		generic (N: natural);
		port(
			D_IN : in bit_vector (N-1 downto 0);
			RST  : in bit;
			ENABLE: in bit;
			CLK  : in bit;
			Q_OUT: out bit_vector (N-1 downto 0)
		);
	end component;
	component muxN_4x1 is
		generic (N: natural);
  		port (  select_input                    :in bit_vector  (1 downto 0);
          		d_in_a, d_in_b, d_in_c, d_in_d  :in bit_vector  (N-1 downto 0);
          		d_out                           :out bit_vector (N-1 downto 0));
	end component;
	component demux1_1x4 is
  		generic (N: natural);
  		port (  select_input                        :in bit_vector  (1 downto 0);
          		d_in                                :in bit;
          		d_out_a, d_out_b, d_out_c, d_out_d  :out bit);
	end component;

	for mux_alu_in: muxN_4x1 use entity work.muxN_4x1(RTL);
	for mux_D_OUT_1: muxN_4x1 use entity work.muxN_4x1(RTL);
	for mux_D_OUT_2: muxN_4x1 use entity work.muxN_4x1(RTL);
	for reg1: reg use entity work.reg(RTL);
	for reg2: reg use entity work.reg(RTL);
	for reg3: reg use entity work.reg(RTL);
	for reg4: reg use entity work.reg(RTL);
	for demux_enab: demux1_1x4 use entity work.demux1_1x4(RTL);
	
	Signal en_a, en_b, en_c, en_d: bit;
	Signal d_out_a, d_out_b, d_out_c, d_out_d: bit_vector (data_width-1 downto 0);
begin
	mux_alu_in: muxN_4x1 	generic map (N=>data_width)
				port map (select_input => SEL_OUT_A, d_in_a => d_out_a, d_in_b=> d_out_b, d_in_c=> d_out_c, d_in_d=> d_out_d, d_out => ALU_IN);
	mux_D_OUT_1: muxN_4x1 	generic map (N=>data_width)
				port map (select_input => SEL_OUT_B, d_in_a => d_out_a, d_in_b=> d_out_b, d_in_c=> d_out_c, d_in_d=> d_out_d, d_out => D_OUT_1);
	mux_D_OUT_2: muxN_4x1 	generic map (N=>data_width)
				port map (select_input => SEL_OUT_C, d_in_a => d_out_a, d_in_b=> d_out_b, d_in_c=> d_out_c, d_in_d=> d_out_d, d_out => D_OUT_2);

	reg1: reg 	generic map (N=>data_width)
			port map (D_IN => RF_IN ,RST => rst, Enable => en_a, clk => clk, Q_OUT => d_out_a);
	reg2: reg 	generic map (N=>data_width)
			port map (D_IN => RF_IN ,RST => rst, Enable => en_b, clk => clk, Q_OUT => d_out_b);
	reg3: reg 	generic map (N=>data_width)
			port map (D_IN => RF_IN ,RST => rst, Enable => en_c, clk => clk, Q_OUT => d_out_c);
	reg4: reg 	generic map (N=>data_width)
			port map (D_IN => RF_IN ,RST => rst, Enable => en_d, clk => clk, Q_OUT => d_out_d);

	demux_enab: demux1_1x4	generic map (N=>1)
			port map (select_input => SEL_IN, d_in => enab, d_out_a => en_a, d_out_b => en_b, d_out_c => en_c, d_out_d => en_d);
END behav;
