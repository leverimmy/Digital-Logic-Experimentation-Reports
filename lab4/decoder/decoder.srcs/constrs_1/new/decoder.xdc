# sw input
set_property -dict {PACKAGE_PIN M21 IOSTANDARD LVCMOS33} [get_ports sw[3]];
set_property -dict {PACKAGE_PIN N20 IOSTANDARD LVCMOS33} [get_ports sw[2]];
set_property -dict {PACKAGE_PIN N22 IOSTANDARD LVCMOS33} [get_ports sw[1]];
set_property -dict {PACKAGE_PIN P21 IOSTANDARD LVCMOS33} [get_ports sw[0]];

# seg output
set_property -dict {PACKAGE_PIN Y21 IOSTANDARD LVCMOS33} [get_ports seg[6]];
set_property -dict {PACKAGE_PIN AB22 IOSTANDARD LVCMOS33} [get_ports seg[5]];
set_property -dict {PACKAGE_PIN AA18 IOSTANDARD LVCMOS33} [get_ports seg[4]];
set_property -dict {PACKAGE_PIN AB18 IOSTANDARD LVCMOS33} [get_ports seg[3]];
set_property -dict {PACKAGE_PIN AA20 IOSTANDARD LVCMOS33} [get_ports seg[2]];
set_property -dict {PACKAGE_PIN AB21 IOSTANDARD LVCMOS33} [get_ports seg[1]];
set_property -dict {PACKAGE_PIN AA21 IOSTANDARD LVCMOS33} [get_ports seg[0]];

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]