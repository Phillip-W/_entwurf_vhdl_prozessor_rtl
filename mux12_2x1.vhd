Entity mux12_2x1 is
  port (  select_input                    :in bit  		 	;
          d_in_a, d_in_b		  :in bit_vector  (11 downto 0);
          d_out                           :out bit_vector (11 downto 0));
end mux12_2x1;

architecture RTL of mux12_2x1 is	
begin
  with select_input select
    d_out <=  d_in_a when '1',
              d_in_b when '0';
end RTL;

architecture RTL_clk of mux12_2x1 is	-- als Process, falls man es takten muss
begin
	process (d_in_a, d_in_b)
	begin
		if select_input 	= '1' then d_out <= d_in_a;
			elsif select_input 	= '0' then d_out <= d_in_b;
		end if;
	end process;
end RTL_clk;
