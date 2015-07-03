Configuration conf of System is
  for behav
    for mux_data: mux 
      use entity work.mux12_4x1(RTL);
    end for;
    for mux_sig: mux
      use entity work.mux12_4x1(RTL);
    end for;
  End for;
End configuration;
