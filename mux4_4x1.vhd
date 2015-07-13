Entity mux4_4x1 is
  port (  select_input                    :in bit_vector  (1 downto 0);
          d_in_a, d_in_b, d_in_c, d_in_d  :in bit_vector  (3 downto 0);
          d_out                           :out bit_vector (3 downto 0));
end mux4_4x1;

architecture RTL of mux4_4x1 is	
begin
  with select_input select
    d_out <=  d_in_d when "11",
              d_in_c when "10",
              d_in_b when "01",
              d_in_a when others;
end RTL;

architecture RTL_clk of mux4_4x1 is	
begin
  with select_input select
    d_out <=  d_in_d when "11",
              d_in_c when "10",
              d_in_b when "01",
              d_in_a when others;
end RTL_clk;

Entity muxN_4x1 is
generic (N: natural);
  port (  select_input                    :in bit_vector  (1 downto 0);
          d_in_a, d_in_b, d_in_c, d_in_d  :in bit_vector  (N-1 downto 0);
          d_out                           :out bit_vector (N-1 downto 0));
end muxN_4x1;

architecture RTL of muxN_4x1 is	
begin
  with select_input select
    d_out <=  d_in_d when "11",
              d_in_c when "10",
              d_in_b when "01",
              d_in_a when others;
end RTL;
