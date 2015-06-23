
USE work.def_package.ALL;

ENTITY instr IS -- geschrieben von Flo Maurer
	port ( 	clk, rst, enab: in bit;
		instr_in: in bit_vector (opcode_width-1 downto 0);
		instr_out : out bit_vector (opcode_width-1 downto 0));
END ENTITY;

ARCHITECTURE behav OF instr IS
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
	for instr: reg use entity work.reg(RTL);
Begin 
	instr: reg 	generic map (N=>data_width)
			port map (D_IN => instr_in ,RST => rst, Enable => enab, clk => clk, Q_OUT => instr_out);
END behav;
