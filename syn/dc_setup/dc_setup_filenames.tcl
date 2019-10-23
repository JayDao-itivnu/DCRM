puts "RM-Info: Running script [info script]\n"

#################################################################################
# Design Compiler Reference Methodology Filenames Setup
# Script: dc_setup_filenames.tcl
# Modified date: 15.06.2019
# Version: 2019.06
# Copyright (C) 2017-2019 Viettel IC Design Center. All rights reserved.
#################################################################################

#################################################################################
# General Flow Files
#################################################################################

##########################
# Milkyway Library Names #
##########################

set DCRM_MW_LIBRARY_NAME                                ${DESIGN_NAME}_LIB
set DCRM_FINAL_MW_CEL_NAME                              ${DESIGN_NAME}_DCT

##############
# Input Files #
###############

set DCRM_CONSTRAINTS_INPUT_FILE                         ${DESIGN_NAME}.constraints.tcl

###########
# Reports #
###########

set TIMING_LOOP_REPORT					${DESIGN_NAME}.timing_loop.rpt

set DCRM_CHECK_LIBRARY_REPORT                           ${DESIGN_NAME}.check_library.rpt
set DCRM_CONSISTENCY_CHECK_ENV_FILE                     ${DESIGN_NAME}.compile_ultra.env
set DCRM_CHECK_DESIGN_REPORT                            ${DESIGN_NAME}.check_design.rpt
set DCRM_ANALYZE_DATAPATH_EXTRACTION_REPORT             ${DESIGN_NAME}.analyze_datapath_extraction.rpt

set DCRM_FINAL_QOR_REPORT                               ${DESIGN_NAME}.mapped.qor.rpt
set DCRM_FINAL_TIMING_REPORT                            ${DESIGN_NAME}.mapped.timing.rpt
set DCRM_FINAL_AREA_REPORT                              ${DESIGN_NAME}.mapped.area.rpt
set DCRM_FINAL_POWER_REPORT                             ${DESIGN_NAME}.mapped.power.rpt
set DCRM_FINAL_CLOCK_GATING_REPORT                      ${DESIGN_NAME}.mapped.clock_gating.rpt
set DCRM_FINAL_SELF_GATING_REPORT                       ${DESIGN_NAME}.mapped.self_gating.rpt

################
# Output Files #
################

set DCRM_FINAL_DDC_OUTPUT_FILE                          ${DESIGN_NAME}.mapped.ddc
set DCRM_FINAL_VERILOG_OUTPUT_FILE                      ${DESIGN_NAME}.mapped.v
set DCRM_FINAL_SDC_OUTPUT_FILE                          ${DESIGN_NAME}.mapped.sdc
set DCT_FINAL_SPEF_OUTPUT_FILE     			${DESIGN_NAME}.mapped.spef

# The following procedures are used to control the naming of the updated blocks
# after transparent interface optimization.
# Modify this procedure if you want to use different names.

proc dcrm_compile_ultra_tio_filename { design } {
  return $design.compile_ultra.tio.ddc
}
proc dcrm_mapped_tio_filename { design } {
  return $design.mapped.tio.ddc
}


#################################################################################
# DCT Flow Files
#################################################################################

###################
# DCT Input Files #
###################

set DCRM_DCT_DEF_INPUT_FILE                             ${DESIGN_NAME}.def
set DCRM_DCT_FLOORPLAN_INPUT_FILE                       ${DESIGN_NAME}.fp
set DCRM_DCT_PHYSICAL_CONSTRAINTS_INPUT_FILE            ${DESIGN_NAME}.physical_constraints.tcl


###############
# DCT Reports #
###############

set DCRM_DCT_FINAL_CONGESTION_REPORT                    ${DESIGN_NAME}.mapped.congestion.rpt

####################
# DCT Output Files #
####################

set DCRM_DCT_FINAL_FLOORPLAN_OUTPUT_FILE                ${DESIGN_NAME}.mapped.fp
set DCRM_DCT_FINAL_SPEF_OUTPUT_FILE                     ${DESIGN_NAME}.mapped.spef
set DCRM_DCT_FINAL_SDF_OUTPUT_FILE                      ${DESIGN_NAME}.mapped.sdf
set DCRM_FINAL_SDC_OUTPUT_FILE				${DESIGN_NAME}.mapped.sdc

puts "RM-Info: Completed script [info script]\n"
