puts "RM-Info: Running script [info script]\n"

##########################################################################################
# Variables common to all reference methodology scripts
# Script: common_setup.tcl
# Modified date: 15.06.2019
# Version: 2019.06 
# Copyright (C) 2017-2019 Viettel IC Design Center. All rights reserved.
##########################################################################################

set DESIGN_NAME           $env(DESIGN_NAME)  ;#  The name of the top-level design
set LIB_DIR 			  $env(LIB_DIR)	     ;#	 The direc- of the reference library

set DESIGN_KIT_PATH		  "${LIB_DIR}/db"	;
set PROJECT_DIR			  $env(PROJECT_DIR)
# Library Setup Variables
##########################################################################################

# For the following variables, use a blank space to separate multiple entries.
# Example: set TARGET_LIBRARY_FILES "lib1.db lib2.db lib3.db"

set ADDITIONAL_SEARCH_PATH        "${PROJECT_DIR}/syn/setup\
			           ${LIB_DIR}\
				   ${LIB_DIR}/mw_lib"
# Additional search path  
set TARGET_LIBRARY_FILES          "${DESIGN_KIT_PATH}/saed90nm_min.db";#  Target technology logical libraries
set ADDITIONAL_LINK_LIB_FILES     ""  ;#  Extra link logical libraries not included in TARGET_LIBRARY_FILES

set MIN_LIBRARY_FILES             "saed90nm_min.db"   ;#  List of max min library pairs "max1 min1 max2 min2 max3 min3"...

set MW_REFERENCE_LIB_DIRS         "${LIB_DIR}/mw_lib" ;	# Milky-way library
set MW_REFERENCE_CONTROL_FILE     ""  ;#  Reference Control file to define the Milkyway reference libs

set TECH_FILE                     "${LIB_DIR}/tech/saed90nm.tf"  ;#  Milkyway technology file
set MAP_FILE                      "${LIB_DIR}/tlup/tech2itf.map"  ;#  Mapping file for TLUplus
set TLUPLUS_MAX_FILE              "${LIB_DIR}/tlup/saed90nm_1p9m_1t_Cmax.tluplus"  ;#  Max TLUplus file
set TLUPLUS_MIN_FILE              "${LIB_DIR}/tlup/saed90nm_1p9m_1t_Cmin.tluplus"  ;#  Min TLUplus file
puts "RM-Info: Completed script [info script]\n"
