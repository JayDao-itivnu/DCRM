# Author: Manh-Hiep Dao: 197.hiepmanhdao@gmail.com
# Le Quy Don Technical University
puts "RM-Info: Running time constraints script [info script]\n"
##################################################
# Define clock pin
##################################################
set CLOCK_PERIOD $env(CLOCK_PERIOD)

if {[sizeof_collection [get_ports clock]] > 0} {
  set CLOCK_PIN clock
  set RETIME 1

  create_clock -period $CLOCK_PERIOD -waveform {0 1} [get_ports clock]
  
  # Define IO Constraints
  set_input_delay \
         [expr {$CLOCK_PERIOD*0.05}] \
         -clock $CLOCK_PIN \
         [remove_from_collection \
                   [all_inputs] \
                   [get_ports {clock}]]
  set_output_delay \
        [expr {$CLOCK_PERIOD*0.05}] \
        -clock $CLOCK_PIN \
        [remove_from_collection \
                    [all_outputs] \
                    [get_ports {clock}]]
}


set_fix_hold [get_ports clock]

##################################################
# Define timing constraints for your designs
##################################################
# Clock model
set_clock_gating_check -setup 0.1 -hold 0.1

set_clock_uncertainty 0.2 [get_ports clock]
set_clock_latency -source -max 1.5 [get_clocks clock]
set_clock_latency -max 1 [get_clocks clock]
set_clock_transition -max 0.1 [get_ports clock]
#set_clock_transition -max 0.10 [get_ports clock]

set_dont_touch_network [get_ports clock]

#read_sdc ./dc_scripts/.sdc

set_max_capacitance 50 [get_ports clock]

puts "RM-Info: Completed time constraint script [info script]\n"
