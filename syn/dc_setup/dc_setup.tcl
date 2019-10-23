#################################################################################
# Design Compiler Reference Methodology Setup for Hierarchical MCMM Flow
# Script: dc_setup.tcl
# Version: P-2019.03 
# Copyright (C) 2007-2019 Synopsys, Inc. All rights reserved.
#################################################################################

################################################################################
# Setup Variables
#
# Modify settings in this section to customize your Design Compiler Reference 
# Methodology run.
# Portions of dc_setup.tcl may be used by other tools so program name checks
# are performed where necessary.
#################################################################################

source -echo -verbose ${PROJECT_DIR}/common/common_setup.tcl
source -echo -verbose ./dc_setup/dc_setup_filenames.tcl

puts "RM-Info: Running script [info script]\n"

set_app_var sh_new_variable_message false
set_host_options -max_cores 8

set REPORTS_DIR "reports"
set RESULTS_DIR "results"

file mkdir ${REPORTS_DIR}
file mkdir ${RESULTS_DIR}


#################################################################################
# Search Path Setup
#
# Set up the search path to find the libraries and design files.
#################################################################################

set_app_var search_path ". ${ADDITIONAL_SEARCH_PATH} $search_path"

################################################################################
# Library Setup
#
# This section is designed to work with the settings from common_setup.tcl
# without any additional modification.
#################################################################################
# Milkyway variable settings

# Make sure to define the Milkyway library variable
# mw_design_library, it is needed by write_milkyway command

set mw_reference_library ${MW_REFERENCE_LIB_DIRS}
set mw_design_library ${DCRM_MW_LIBRARY_NAME}
set mw_site_name_mapping { {CORE unit} {Core unit} {core unit} }



set_app_var target_library ${TARGET_LIBRARY_FILES}
set_app_var synthetic_library dw_foundation.sldb


set_app_var link_library "* $target_library $ADDITIONAL_LINK_LIB_FILES $synthetic_library"

puts "RM-Info: Completed script [info script]\n"
