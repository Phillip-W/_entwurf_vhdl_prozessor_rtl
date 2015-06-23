
USE work.def_package.ALL;

ENTITY addr IS -- geschrieben von Flo Maurer
	port ( 	clk, rst, enab: in bit;
		addr_in: in bit_vector (data_width-1 downto 0);
		addr_out : out bit_vector (data_width-1 downto 0));
END ENTITY;

ARCHITECTURE behav OF addr IS
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
	for addr: reg use entity work.reg(RTL);
Begin 
	addr: reg 	generic map (N=>data_width)
			port map (D_IN => addr_in ,RST => rst, Enable => enab, clk => clk, Q_OUT => addr_out);
END behav;
