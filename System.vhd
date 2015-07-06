-- hier steht unser System, an welches noch IO, Mem und clk, rst hinkommen (auch die TB)
use work.def_package.all;
ENtity System IS
  port (  rst, clk, dev_ready_in, dev_ready_out: in bit;
          in_dat_IO, in_dat_mem: in data_type;
          active, IO_type, IO_en, w_en: out bit; -- IO_type und IO_en sind sowohl an Input device, als auch am output device anzulegen
          A_IN_2: out addr_type;
          A_out_mem: out addr_type);
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
    	A_OUT		: out addr_type;	-- warum buffer? zwischensignal
    	W_EN, D_IN_MUX	: out bit;
    	IO_TYPE, IO_EN	: out bit;
    	
    -- active signal
    	ACTVE		: out bit
    	);
  END COMPONENT;
  
  component muxdata is
    port (  select_input                  :in bit;
          d_in_a, d_in_b                  :in data_type;
          d_out                           :out data_type);
  END component;
  
  component muxsig is
    port (  select_input                    :in bit ;
          d_in_a, d_in_b                    :in bit;
          d_out                             :out bit);
  END component;
  
  Signal intern_IO_type, intern_dev_ready, intern_D_IN_MUX: bit;
  Signal intern_D_in: data_type;
  
  Begin
  
  mux_sig: muxsig  port map (intern_IO_type, dev_ready_in, dev_ready_out, intern_dev_ready); 
  mux_data: muxdata port map (intern_D_IN_MUX, in_dat_IO, in_dat_mem, intern_D_in);
  UPC: CPU port map (
        CLK		=> clk,
	      RST		=> rst,
	     D_IN		=> intern_D_in,
	A_IN_2		=> A_in_2,
	DEV_RDY		=> intern_dev_ready,
	A_OUT		=> a_out_mem,
	W_EN => w_en, D_IN_MUX	=>intern_D_IN_MUX,
	IO_TYPE=> IO_type, IO_EN	=> IO_en,
	ACTVE	=>active	);   
END Architecture;

