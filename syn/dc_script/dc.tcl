#################################################################################
# Design Compiler Script 
# Script: dc.tcl
# Modified date: 10.7.2019
# Version: 2019.06  
################################################################################

set PROJECT_DIR		$env(PROJECT_DIR)
set DESIGN_NAME		$env(DESIGN_NAME)
set LIB_DIR		$env(LIB_DIR)

source -echo -verbose ./dc_setup/dc_setup.tcl
set_app_var spg_enable_via_resistance_support true
#################################################################################
# Read the top-down RTL Design
#################################################################################
define_design_lib WORK -path ./WORK
source -echo -verbose ./dc_setup/read_design.tcl
link
write -hierarchy -format ddc -output ${RESULTS_DIR}/${DCRM_FINAL_DDC_OUTPUT_FILE}
# return 1
#################################################################################
# Read the Design Timing Constraints 
#################################################################################
source -echo -verbose ${PROJECT_DIR}/syn/inputs/${DCRM_CONSTRAINTS_INPUT_FILE}
	
#################################################################################
# Group nets, pins
#################################################################################
set ports_clock_root [filter_collection [get_attribute [get_clocks] sources] object_class==port]
group_path -name REGOUT -to [all_outputs] 
group_path -name REGIN -from [remove_from_collection [all_inputs] ${ports_clock_root}] 
group_path -name COMBO -from [remove_from_collection [all_inputs] ${ports_clock_root}] -to [all_outputs]
# return 1
#################################################################################
# Apply Additional Optimization Constraints
#################################################################################

# Prevent assignment statements in the Verilog netlist.
set_fix_multiple_port_nets -all -buffer_constants

# Check the current design for consistency
check_design -summary
check_design > ${REPORTS_DIR}/${DCRM_CHECK_DESIGN_REPORT}

# The following variable enables register replication across the hierarchy by creating new ports
# on the instances of the subdesigns if it is necessary to improve the timing of the design

set_app_var compile_register_replication_across_hierarchy false 

compile_ultra -area_high_effort_script 

#################################################################################
# Write out Design
#################################################################################
write -format verilog -hierarchy -output ${RESULTS_DIR}/${DCRM_FINAL_VERILOG_OUTPUT_FILE}
write -format ddc     -hierarchy -output ${RESULTS_DIR}/${DCRM_FINAL_DDC_OUTPUT_FILE}

# Write and close SVF file and make it available for immediate use
set_svf -off

#################################################################################
# Write out Design Data
#################################################################################
# Do not write out net RC info into SDC
set_app_var write_sdc_output_lumped_net_capacitance false
set_app_var write_sdc_output_net_resistance false

# Write parasitics data from Design Compiler Topographical placement for static timing analysis
write_parasitics -output ${RESULTS_DIR}/${DCRM_DCT_FINAL_SPEF_OUTPUT_FILE}

write_sdc -nosplit ${RESULTS_DIR}/${DCRM_FINAL_SDC_OUTPUT_FILE}


# If SAIF is used, write out SAIF name mapping file for PrimeTime-PX
 saif_map -type ptpx -write_map ${RESULTS_DIR}/${DESIGN_NAME}.mapped.SAIF.namemap


#################################################################################
# Generate Final Reports
#################################################################################

report_qor > ${REPORTS_DIR}/${DCRM_FINAL_QOR_REPORT}

report_timing -transition_time -nets -attributes -nosplit > ${REPORTS_DIR}/${DCRM_FINAL_TIMING_REPORT}

report_timing -loops > ${REPORTS_DIR}/${TIMING_LOOP_REPORT}

report_area -nosplit > ${REPORTS_DIR}/${DCRM_FINAL_AREA_REPORT}

report_clock_gating -nosplit > ${REPORTS_DIR}/${DCRM_FINAL_CLOCK_GATING_REPORT}

report_power -nosplit > ${REPORTS_DIR}/${DCRM_FINAL_POWER_REPORT}

report_self_gating  -nosplit > ${REPORTS_DIR}/${DCRM_FINAL_SELF_GATING_REPORT}

report_congestion > ${REPORTS_DIR}/${DCRM_DCT_FINAL_CONGESTION_REPORT}
exit
