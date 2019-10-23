puts "RM-Info: Running script [info script]\n"

##########################################################################################
# Variables common to all reference methodology scripts
# Script: common_setup.tcl
# Modified date: 15.06.2019
# Version: 2019.06 
# Copyright (C) 2017-2019 Viettel IC Design Center. All rights reserved.
##########################################################################################

set DESIGN_NAME           	  $env(DESIGN_NAME)  ;#  The name of the top-level design
set LIB_DIR 			  $env(LIB_DIR)	     ;#	 The direc- of the reference library

set DESIGN_KIT_PATH		  "${LIB_DIR}/db"	;
set PROJECT_DIR			  $env(PROJECT_DIR)
# Library Setup Variables
##########################################################################################

# For the following variables, use a blank space to separate multiple entries.
# Example: set TARGET_LIBRARY_FILES "lib1.db lib2.db lib3.db"

set ADDITIONAL_SEARCH_PATH        "${PROJECT_DIR}/syn/dc_setup\
			           ${LIB_DIR}"
				
# Additional search path  
set TARGET_LIBRARY_FILES          "${DESIGN_KIT_PATH}/LE8UL_LP_Ptt_V0p55_T25.db";#  Target technology logical libraries

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

set ADDITIONAL_LINK_LIB_FILES     ""  ;#  Extra link logical libraries not included in TARGET_LIBRARY_FILES

set MIN_LIBRARY_FILES             "LE8UL_LP_Ptt_V0p55_T25.db LE8UL_LP_Pss_V0p52_Tm5.db LE8UL_LP_Pff_V0p58_T75.db"   ;#  List of max min library pairs "max1 min1 max2 min2 max3 min3"...

# Follow libraries are used for Topographical Methodology. Please edit them before use Topo-Mode
set MW_REFERENCE_LIB_DIRS         "" ;	# Milky-way library
set MW_REFERENCE_CONTROL_FILE     ""  ;#  Reference Control file to define the Milkyway reference libs

set TECH_FILE                     ""  ;#  Milkyway technology file
set MAP_FILE                      ""  ;#  Mapping file for TLUplus
set TLUPLUS_MAX_FILE              ""  ;#  Max TLUplus file
set TLUPLUS_MIN_FILE              ""  ;#  Min TLUplus file
puts "RM-Info: Completed script [info script]\n"
