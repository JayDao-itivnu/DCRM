puts "Info: Running script [info script]\n"

##########################################################################################
# Read and elaborate RTL design script.
# Script: read_design.tcl
# Modified date: 15.06.2019
# Version: 2019.06
# Copyright (C) 2017-2019 Viettel IC Design Center. All rights reserved.
##########################################################################################

# Create directory for work library
file mkdir WORK
define_design_lib WORK -path ./WORK

# Read verilog file
analyze -format verilog ${PROJECT_DIR}/src/halfadder.v

analyze -format vhdl ${PROJECT_DIR}/src/fulladder.vhd

elaborate -work work ${DESIGN_NAME}

puts "Info: Completed script [info script]\n"
