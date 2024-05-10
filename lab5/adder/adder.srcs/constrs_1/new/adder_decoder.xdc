# A input
set_property -dict {PACKAGE_PIN M21 IOSTANDARD LVCMOS33} [get_ports A[3]];     #IO1½Ó²å¿×
set_property -dict {PACKAGE_PIN N20 IOSTANDARD LVCMOS33} [get_ports A[2]];     #IO2½Ó²å¿×
set_property -dict {PACKAGE_PIN N22 IOSTANDARD LVCMOS33} [get_ports A[1]];     #IO3½Ó²å¿×
set_property -dict {PACKAGE_PIN P21 IOSTANDARD LVCMOS33} [get_ports A[0]];     #IO4½Ó²å¿×

# B input
set_property -dict {PACKAGE_PIN T21 IOSTANDARD LVCMOS33} [get_ports B[3]];     #IO6½Ó²å¿×
set_property -dict {PACKAGE_PIN U21 IOSTANDARD LVCMOS33} [get_ports B[2]];     #IO7½Ó²å¿×
set_property -dict {PACKAGE_PIN R21 IOSTANDARD LVCMOS33} [get_ports B[1]];     #IO8½Ó²å¿×
set_property -dict {PACKAGE_PIN R22 IOSTANDARD LVCMOS33} [get_ports B[0]];     #IO9½Ó²å¿×

# Cin input
set_property -dict {PACKAGE_PIN P22 IOSTANDARD LVCMOS33} [get_ports Cin];     #IO5½Ó²å¿×

# Seg0 output
set_property -dict {PACKAGE_PIN AB18 IOSTANDARD LVCMOS33} [get_ports seg0[3]];     #IO17½Ó²å¿×
set_property -dict {PACKAGE_PIN AA20 IOSTANDARD LVCMOS33} [get_ports seg0[2]];     #IO18½Ó²å¿×
set_property -dict {PACKAGE_PIN AB21 IOSTANDARD LVCMOS33} [get_ports seg0[1]];     #IO19½Ó²å¿×
set_property -dict {PACKAGE_PIN AA21 IOSTANDARD LVCMOS33} [get_ports seg0[0]];     #IO20½Ó²å¿×

# Seg1 output
set_property -dict {PACKAGE_PIN AB22 IOSTANDARD LVCMOS33} [get_ports seg1[1]];     #IO15½Ó²å¿×
set_property -dict {PACKAGE_PIN AA18 IOSTANDARD LVCMOS33} [get_ports seg1[0]];     #IO16½Ó²å¿×

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]