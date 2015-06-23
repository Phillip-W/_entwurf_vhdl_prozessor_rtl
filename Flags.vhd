
USE work.def_package.ALL;

ENTITY flags IS -- geschrieben von Flo Maurer
	port ( 	clk, rst, enab: in bit;
		Flags_in: in bit_vector (flag_width-1 downto 0);
		Flags_out : out bit_vector (flag_width-1 downto 0));
END ENTITY;

ARCHITECTURE behav OF flags IS
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
	for Flags: reg use entity work.reg(RTL);
Begin 
	flags: reg 	generic map (N=>flag_width)
			port map (D_IN => Flags_in ,RST => rst, Enable => enab, clk => clk, Q_OUT => Flags_out);
END behav;
