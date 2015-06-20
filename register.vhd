

use work.def_package.all;

entity D_REG12RE is
	port(
		D_IN : in bit_vector (data_width-1 downto 0);
		RST  : in bit;
		ENABLE: in bit;
		CLK  : in bit;
		Q_OUT: out bit_vector (data_width-1 downto 0)
	);
end D_REG12RE;

architecture RTL of D_REG12RE is
begin 
	process (RST, CLK)
	begin
		if RST = '0' then
		--Reset Action--
		Q_OUT <= B"0000_0000_0000";
		elsif CLK = '1' and CLK'event then
		--Action for operation modes
		if ENABLE = '1' then
			Q_OUT <= D_IN;
		end if;
	end if;
	end process;
end RTL;


architecture RTL2 of D_REG12RE is
begin
	process
	begin 
		wait until CLK = '1';
		if RST = '0' then
			Q_OUT <= B"0000_0000_0000";
		else
			if ENABLE = '1' then
				Q_OUT <= D_IN;
			end if;
		end if;

	end process;
end RTL2;
