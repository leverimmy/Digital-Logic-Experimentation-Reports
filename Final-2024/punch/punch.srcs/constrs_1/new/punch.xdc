#CLK input
set_property -dict {PACKAGE_PIN J19 IOSTANDARD LVCMOS33} [get_ports CLK];     #CLK½Ó²å¿×

#RST input
set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports RST];     #IO0½Ó²å¿×

#Submit input
set_property -dict {PACKAGE_PIN P20 IOSTANDARD LVCMOS33} [get_ports Submit];     #IO10½Ó²å¿×

# Switch output
set_property -dict {PACKAGE_PIN M21 IOSTANDARD LVCMOS33} [get_ports Switch[3]];     #IO1½Ó²å¿×
set_property -dict {PACKAGE_PIN N20 IOSTANDARD LVCMOS33} [get_ports Switch[2]];     #IO2½Ó²å¿×
set_property -dict {PACKAGE_PIN N22 IOSTANDARD LVCMOS33} [get_ports Switch[1]];     #IO3½Ó²å¿×
set_property -dict {PACKAGE_PIN P21 IOSTANDARD LVCMOS33} [get_ports Switch[0]];     #IO4½Ó²å¿×

# Obj output
set_property -dict {PACKAGE_PIN W21 IOSTANDARD LVCMOS33} [get_ports Obj[3]];     #IO11½Ó²å¿×
set_property -dict {PACKAGE_PIN W22 IOSTANDARD LVCMOS33} [get_ports Obj[2]];     #IO12½Ó²å¿×
set_property -dict {PACKAGE_PIN Y22 IOSTANDARD LVCMOS33} [get_ports Obj[1]];     #IO13½Ó²å¿×
set_property -dict {PACKAGE_PIN Y21 IOSTANDARD LVCMOS33} [get_ports Obj[0]];     #IO14½Ó²å¿×

# Score output
set_property -dict {PACKAGE_PIN AB18 IOSTANDARD LVCMOS33} [get_ports Score[3]];     #IO17½Ó²å¿×
set_property -dict {PACKAGE_PIN AA20 IOSTANDARD LVCMOS33} [get_ports Score[2]];     #IO18½Ó²å¿×
set_property -dict {PACKAGE_PIN AB21 IOSTANDARD LVCMOS33} [get_ports Score[1]];     #IO19½Ó²å¿×
set_property -dict {PACKAGE_PIN AA21 IOSTANDARD LVCMOS33} [get_ports Score[0]];     #IO20½Ó²å¿×

# required if touch button used as manual clock source
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_IBUF]

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
