#CLK input
set_property -dict {PACKAGE_PIN J19 IOSTANDARD LVCMOS33} [get_ports CLK];     #CLK½Ó²å¿×

#RST input
set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports RST];     #IO0½Ó²å¿×

#Switch input
set_property -dict {PACKAGE_PIN Y21 IOSTANDARD LVCMOS33} [get_ports Switch];     #IO14½Ó²å¿×

# Velo output
set_property -dict {PACKAGE_PIN M21 IOSTANDARD LVCMOS33} [get_ports Velo[3]];     #IO1½Ó²å¿×
set_property -dict {PACKAGE_PIN N20 IOSTANDARD LVCMOS33} [get_ports Velo[2]];     #IO2½Ó²å¿×
set_property -dict {PACKAGE_PIN N22 IOSTANDARD LVCMOS33} [get_ports Velo[1]];     #IO3½Ó²å¿×
set_property -dict {PACKAGE_PIN P21 IOSTANDARD LVCMOS33} [get_ports Velo[0]];     #IO4½Ó²å¿×

#Mode output
set_property -dict {PACKAGE_PIN P22 IOSTANDARD LVCMOS33} [get_ports Mode[3]];     #IO5½Ó²å¿×
set_property -dict {PACKAGE_PIN T21 IOSTANDARD LVCMOS33} [get_ports Mode[2]];     #IO6½Ó²å¿×
set_property -dict {PACKAGE_PIN U21 IOSTANDARD LVCMOS33} [get_ports Mode[1]];     #IO7½Ó²å¿×
set_property -dict {PACKAGE_PIN R21 IOSTANDARD LVCMOS33} [get_ports Mode[0]];     #IO8½Ó²å¿×

#Chg input
set_property -dict {PACKAGE_PIN AA21 IOSTANDARD LVCMOS33} [get_ports Chg];     #IO20½Ó²å¿×

# Brk output
set_property -dict {PACKAGE_PIN AB21 IOSTANDARD LVCMOS33} [get_ports Brk];     #IO19½Ó²å¿×

# required if touch button used as manual clock source
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_IBUF]

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]