use work.def_package.all;

Entity mux12_4x1 is
  port (  select_input                    :in bit_vector  (1 downto 0);
          d_in_a, d_in_b, d_in_c, d_in_d  :in bit_vector  (11 downto 0);
          d_out                           :out bit_vector (11 downto 0));
end mux12_4x1;

architecture RTL of mux12_4x1 is	
begin
  with select_input select
    d_out <=  d_in_d when "11",
              d_in_c when "10",
              d_in_b when "01",
              d_in_a when others;
end RTL;

architecture RTL_clk of mux12_4x1 is	-- als Process, falls man es takten muss
begin
	process (d_in_a, d_in_b, d_in_c, d_in_d)
	begin
		if select_input 	= "11" then d_out <= d_in_d;
			elsif select_input 	= "10" then d_out <= d_in_c;
			elsif select_input	= "01" then d_out <= d_in_b;
			else				    d_out <= d_in_a;
		end if;
	end process;
end RTL_clk;

use work.def_package.all;
Entity muxdata is
  port (  select_input                    :in bit;
          d_in_a, d_in_b                  :in data_type;
          d_out                           :out data_type);
end muxdata;

architecture RTL of muxdata is	
begin
  with select_input select
    d_out <=  d_in_a when '0',
              d_in_b when others;
end RTL;

use work.def_package.all;
Entity muxsig is
  port (  select_input                    :in bit;
          d_in_a, d_in_b                  :in bit;
          d_out                           :out bit);
end muxsig;

architecture RTL of muxsig is	
begin
  with select_input select
    d_out <=  d_in_a when '0',
              d_in_b when others;
end RTL;

