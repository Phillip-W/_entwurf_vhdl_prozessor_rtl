# Änderungen
Spec bleibt die selbe.

Dies sind nur Änderungsvorschläge die ich gerne Implimentieren würde um einen möglichst realitätsgetreuen Prozessor zu entwerfen.

1. In unserem Modell werden wir nurnoch mit Bit Vektoren bzw std_logic Vektoren arbeiten.
2. Es wird eine CPU_tb (Testbench) geben, welche von ADD x y z in Bit Vektoren übersetzt.
3. Die ganzen Files wird es so in unserer CPU natürlich nicht mehr geben, da man sowas nicht syntetisieren kann.
4. System.vhd ist unsere oberste Instanz, daran werden clk- und res-gen, sowie IO angeschlossen.
