Entity demux1_1x4 is
  port (  select_input                        :in bit_vector  (1 downto 0);
          d_in                                :in bit;
          d_out_a, d_out_b, d_out_c, d_out_d  :out bit);
end demux1_1x4;

architecture RTL of demux1_1x4 is	
begin
  process (d_in, select_input)
    begin
      d_out_a <= '0'; d_out_b <= '0'; d_out_c <= '0'; d_out_d <= '0';
      case select_input is
        when "00" => d_out_a <= d_in;
        when "01" => d_out_b <= d_in;
        when "10" => d_out_c <= d_in;
        when "11" => d_out_d <= d_in;
      end case;
  end process;
end RTL;

Entity demuxN_1x4 is
  generic (N: natural);
  port (  select_input                        :in bit_vector  (1 downto 0);
          d_in                                :in bit_vector (N-1 downto 0);
          d_out_a, d_out_b, d_out_c, d_out_d  :out bit_vector (N-1 downto 0));
end demuxN_1x4;

architecture RTL of demuxN_1x4 is	
begin
  process (d_in, select_input)
    begin
      d_out_a <= (others => '0'); d_out_b <= (others => '0'); d_out_c <= (others => '0'); d_out_d <= (others => '0');
      case select_input is
        when "00" => d_out_a <= d_in;
        when "01" => d_out_b <= d_in;
        when "10" => d_out_c <= d_in;
        when "11" => d_out_d <= d_in;
      end case;
  end process;
end RTL;
