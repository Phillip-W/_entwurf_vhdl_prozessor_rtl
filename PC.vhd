USE work.def_package.ALL;

ENTITY PC IS -- geschrieben von Flo Maurer
	port ( 	clk, rst, enab: in bit;
		PC_IN: in bit_vector (addr_width-1 downto 0);
		PC : out bit_vector (addr_width-1 downto 0));
END ENTITY;

ARCHITECTURE behav OF PC IS
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
	for PCr: reg use entity work.reg(RTL);
Begin 
	PCr: reg 	generic map (N=>addr_width)
			port map (D_IN => PC_in ,RST => rst, Enable => enab, clk => clk, Q_OUT => PC);
END behav;
