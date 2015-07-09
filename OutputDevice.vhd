USE work.def_package.ALL;

ENTITY OutputDevice IS
    PORT( 
      rst, clk, enab: IN bit;
      d_in: IN data_type;
      rdy: OUT bit;
      d_out: OUT data_type
    );
  END OutputDevice;
  
  ARCHITECTURE behav OF OutputDevice IS
  
    COMPONENT reg IS
		  GENERIC (N: natural);
		  PORT(
			  D_IN : IN bit_vector (N-1 downto 0);
			  RST  : IN bit;
			  ENABLE: IN bit;
			  CLK  : IN bit;
			  Q_OUT: OUT bit_vector (N-1 downto 0)
		  );
	  END COMPONENT;
	 
  BEGIN
  
  input: reg generic map (N=>data_width) port map (D_IN => d_in, RST => rst, Enable => enab, clk => clk, Q_OUT => d_out);

  ready: PROCESS (enab)
  BEGIN
    rdy <= '0';
    IF enab'EVENT AND enab = '0' THEN
      rdy <= '1';
    END IF;
  END PROCESS ready;

  END behav;
