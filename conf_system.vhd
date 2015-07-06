Configuration conf of System is
  for behav
    for mux_data: muxdata 
      use entity work.muxdata(RTL);
    end for;
    for mux_sig: muxsig
      use entity work.muxsig(RTL);
    end for;
    for UPC: CPU
      use entity work.CPU(RTL);
    END FOR;
  End for;
End configuration;

