-- hier steht unser System, an welches noch IO, Mem und clk, rst hinkommen (auch die TB)

ENtity System IS
  port (  rst, clk, dev_ready_in, dev_ready_out: in bit;
          in_dat_IO, in_dat_mem: in data_type;
          active, IO_type, IO_en, w_en: out bit;
          A_IN_2: out addr_type;
          A_out: out data_type);
END Entity;

Architecture behav of System IS
  component CPU is
    port (
    	CLK		: in bit;
    	RST		: in bit;
    	
    -- command and address in, flags
    	D_IN		: in data_type;
    	A_IN_2		: out data_type;	-- warum buffer?
    
    -- memory and other external interface
    
    	DEV_RDY		: in bit;
    	A_OUT		: out data_type;	-- warum buffer? zwischensignal
    	W_EN, D_IN_MUX	: out bit;
    	IO_TYPE, IO_EN	: out bit;
    	
    -- active signal
    	ACTVE		: out bit
    	);
  END COMPONENT;
  
  component mux is
    port (  select_input                    :in bit_vector  (1 downto 0);
          d_in_a, d_in_b, d_in_c, d_in_d  :in bit_vector  (11 downto 0);
          d_out                           :out bit_vector (11 downto 0));
  END component;
  
  Signal intern_IO_type, intern_dev_ready, intern_D_IN_MUX, intern_D_in: bit;
  
  Begin
  
  mux_data: mux port map (intern_IO_type, dev_ready_in, dev_ready_out, open, open, intern_dev_ready);
  mux_sig: mux port map (intern_D_IN_MUX, in_dat_IO, in_dat_mem, open, open, intern_D_in);
  -- hier fehlt noch die CPU (mach ich am Nachmittag aoder so)
  
END Architecture;
