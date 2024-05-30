#CLK input
set_property -dict {PACKAGE_PIN J19 IOSTANDARD LVCMOS33} [get_ports CLK];     #CLK½Ó²å¿×

#RST input
set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports RST];     #IO0½Ó²å¿×

# inputs input
set_property -dict {PACKAGE_PIN M21 IOSTANDARD LVCMOS33} [get_ports inputs[3]];     #IO1½Ó²å¿×
set_property -dict {PACKAGE_PIN N20 IOSTANDARD LVCMOS33} [get_ports inputs[2]];     #IO2½Ó²å¿×
set_property -dict {PACKAGE_PIN N22 IOSTANDARD LVCMOS33} [get_ports inputs[1]];     #IO3½Ó²å¿×
set_property -dict {PACKAGE_PIN P21 IOSTANDARD LVCMOS33} [get_ports inputs[0]];     #IO4½Ó²å¿×

# mode input
set_property -dict {PACKAGE_PIN W21 IOSTANDARD LVCMOS33} [get_ports mode];     #IO11½Ó²å¿×

# acc output
set_property -dict {PACKAGE_PIN AA18 IOSTANDARD LVCMOS33} [get_ports acc];     #IO16½Ó²å¿×

# rej output
set_property -dict {PACKAGE_PIN AB18 IOSTANDARD LVCMOS33} [get_ports rej];     #IO17½Ó²å¿×

# alert output
set_property -dict {PACKAGE_PIN AA20 IOSTANDARD LVCMOS33} [get_ports alert];     #IO18½Ó²å¿×

# state output
set_property -dict {PACKAGE_PIN P20 IOSTANDARD LVCMOS33} [get_ports state[2]];     #IO10²å¿×
set_property -dict {PACKAGE_PIN Y21 IOSTANDARD LVCMOS33} [get_ports state[1]];     #IO14½Ó²å¿×
set_property -dict {PACKAGE_PIN AB22 IOSTANDARD LVCMOS33} [get_ports state[0]];     #IO15½Ó²å¿×

# required if touch button used as manual clock source
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_IBUF]

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]