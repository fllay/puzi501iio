# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set AXI_PWM_Generator [ipgui::add_page $IPINST -name "AXI PWM Generator"]
  set ASYNC_CLK_EN [ipgui::add_param $IPINST -name "ASYNC_CLK_EN" -parent ${AXI_PWM_Generator}]
  set_property tooltip {External clock for the counter} ${ASYNC_CLK_EN}
  set EXT_ASYNC_SYNC [ipgui::add_param $IPINST -name "EXT_ASYNC_SYNC" -parent ${AXI_PWM_Generator} -widget checkBox]
  set_property tooltip {NOTE: If active the ext_sync will be delayed 2 clock cycles.} ${EXT_ASYNC_SYNC}
  ipgui::add_param $IPINST -name "N_PWMS" -parent ${AXI_PWM_Generator}
  set PWM_EXT_SYNC [ipgui::add_param $IPINST -name "PWM_EXT_SYNC" -parent ${AXI_PWM_Generator} -widget checkBox]
  set_property tooltip {NOTE: If active the whole pwm gen module will be waiting for the ext_sync to be set low. A load config or reset must be used before deaserting the ext_sync} ${PWM_EXT_SYNC}
  set PULSE_0_WIDTH [ipgui::add_param $IPINST -name "PULSE_0_WIDTH" -parent ${AXI_PWM_Generator}]
  set_property tooltip {PULSE width of the generated signal. The unit interval is the system or external clock period.} ${PULSE_0_WIDTH}
  set PULSE_0_PERIOD [ipgui::add_param $IPINST -name "PULSE_0_PERIOD" -parent ${AXI_PWM_Generator}]
  set_property tooltip {Period of the generated signal. The unit interval is the system or external clock period.} ${PULSE_0_PERIOD}
  set PULSE_0_OFFSET [ipgui::add_param $IPINST -name "PULSE_0_OFFSET" -parent ${AXI_PWM_Generator}]
  set_property tooltip {Offset of the generated signal referenced to PULSE 1. The unit interval is the system or external clock period.} ${PULSE_0_OFFSET}
  set PULSE_1_WIDTH [ipgui::add_param $IPINST -name "PULSE_1_WIDTH" -parent ${AXI_PWM_Generator}]
  set_property tooltip {PULSE width of the generated signal. The unit interval is the system or external clock period.} ${PULSE_1_WIDTH}
  set PULSE_1_PERIOD [ipgui::add_param $IPINST -name "PULSE_1_PERIOD" -parent ${AXI_PWM_Generator}]
  set_property tooltip {Period of the generated signal. The unit interval is the system or external clock period.} ${PULSE_1_PERIOD}
  set PULSE_1_OFFSET [ipgui::add_param $IPINST -name "PULSE_1_OFFSET" -parent ${AXI_PWM_Generator}]
  set_property tooltip {Offset of the generated signal referenced to PULSE 1. The unit interval is the system or external clock period.} ${PULSE_1_OFFSET}
  set PULSE_2_WIDTH [ipgui::add_param $IPINST -name "PULSE_2_WIDTH" -parent ${AXI_PWM_Generator}]
  set_property tooltip {PULSE width of the generated signal. The unit interval is the system or external clock period.} ${PULSE_2_WIDTH}
  set PULSE_2_PERIOD [ipgui::add_param $IPINST -name "PULSE_2_PERIOD" -parent ${AXI_PWM_Generator}]
  set_property tooltip {Period of the generated signal. The unit interval is the system or external clock period.} ${PULSE_2_PERIOD}
  set PULSE_2_OFFSET [ipgui::add_param $IPINST -name "PULSE_2_OFFSET" -parent ${AXI_PWM_Generator}]
  set_property tooltip {Offset of the generated signal referenced to PULSE 1. The unit interval is the system or external clock period.} ${PULSE_2_OFFSET}
  set PULSE_3_WIDTH [ipgui::add_param $IPINST -name "PULSE_3_WIDTH" -parent ${AXI_PWM_Generator}]
  set_property tooltip {PULSE width of the generated signal. The unit interval is the system or external clock period.} ${PULSE_3_WIDTH}
  set PULSE_3_PERIOD [ipgui::add_param $IPINST -name "PULSE_3_PERIOD" -parent ${AXI_PWM_Generator}]
  set_property tooltip {Period of the generated signal. The unit interval is the system or external clock period.} ${PULSE_3_PERIOD}
  set PULSE_3_OFFSET [ipgui::add_param $IPINST -name "PULSE_3_OFFSET" -parent ${AXI_PWM_Generator}]
  set_property tooltip {Offset of the generated signal referenced to PULSE 1. The unit interval is the system or external clock period.} ${PULSE_3_OFFSET}


}

proc update_PARAM_VALUE.ASYNC_CLK_EN { PARAM_VALUE.ASYNC_CLK_EN } {
	# Procedure called to update ASYNC_CLK_EN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ASYNC_CLK_EN { PARAM_VALUE.ASYNC_CLK_EN } {
	# Procedure called to validate ASYNC_CLK_EN
	return true
}

proc update_PARAM_VALUE.EXT_ASYNC_SYNC { PARAM_VALUE.EXT_ASYNC_SYNC } {
	# Procedure called to update EXT_ASYNC_SYNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EXT_ASYNC_SYNC { PARAM_VALUE.EXT_ASYNC_SYNC } {
	# Procedure called to validate EXT_ASYNC_SYNC
	return true
}

proc update_PARAM_VALUE.ID { PARAM_VALUE.ID } {
	# Procedure called to update ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ID { PARAM_VALUE.ID } {
	# Procedure called to validate ID
	return true
}

proc update_PARAM_VALUE.N_PWMS { PARAM_VALUE.N_PWMS } {
	# Procedure called to update N_PWMS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.N_PWMS { PARAM_VALUE.N_PWMS } {
	# Procedure called to validate N_PWMS
	return true
}

proc update_PARAM_VALUE.PULSE_0_OFFSET { PARAM_VALUE.PULSE_0_OFFSET } {
	# Procedure called to update PULSE_0_OFFSET when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PULSE_0_OFFSET { PARAM_VALUE.PULSE_0_OFFSET } {
	# Procedure called to validate PULSE_0_OFFSET
	return true
}

proc update_PARAM_VALUE.PULSE_0_PERIOD { PARAM_VALUE.PULSE_0_PERIOD } {
	# Procedure called to update PULSE_0_PERIOD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PULSE_0_PERIOD { PARAM_VALUE.PULSE_0_PERIOD } {
	# Procedure called to validate PULSE_0_PERIOD
	return true
}

proc update_PARAM_VALUE.PULSE_0_WIDTH { PARAM_VALUE.PULSE_0_WIDTH } {
	# Procedure called to update PULSE_0_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PULSE_0_WIDTH { PARAM_VALUE.PULSE_0_WIDTH } {
	# Procedure called to validate PULSE_0_WIDTH
	return true
}

proc update_PARAM_VALUE.PULSE_1_OFFSET { PARAM_VALUE.PULSE_1_OFFSET } {
	# Procedure called to update PULSE_1_OFFSET when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PULSE_1_OFFSET { PARAM_VALUE.PULSE_1_OFFSET } {
	# Procedure called to validate PULSE_1_OFFSET
	return true
}

proc update_PARAM_VALUE.PULSE_1_PERIOD { PARAM_VALUE.PULSE_1_PERIOD } {
	# Procedure called to update PULSE_1_PERIOD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PULSE_1_PERIOD { PARAM_VALUE.PULSE_1_PERIOD } {
	# Procedure called to validate PULSE_1_PERIOD
	return true
}

proc update_PARAM_VALUE.PULSE_1_WIDTH { PARAM_VALUE.PULSE_1_WIDTH } {
	# Procedure called to update PULSE_1_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PULSE_1_WIDTH { PARAM_VALUE.PULSE_1_WIDTH } {
	# Procedure called to validate PULSE_1_WIDTH
	return true
}

proc update_PARAM_VALUE.PULSE_2_OFFSET { PARAM_VALUE.PULSE_2_OFFSET } {
	# Procedure called to update PULSE_2_OFFSET when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PULSE_2_OFFSET { PARAM_VALUE.PULSE_2_OFFSET } {
	# Procedure called to validate PULSE_2_OFFSET
	return true
}

proc update_PARAM_VALUE.PULSE_2_PERIOD { PARAM_VALUE.PULSE_2_PERIOD } {
	# Procedure called to update PULSE_2_PERIOD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PULSE_2_PERIOD { PARAM_VALUE.PULSE_2_PERIOD } {
	# Procedure called to validate PULSE_2_PERIOD
	return true
}

proc update_PARAM_VALUE.PULSE_2_WIDTH { PARAM_VALUE.PULSE_2_WIDTH } {
	# Procedure called to update PULSE_2_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PULSE_2_WIDTH { PARAM_VALUE.PULSE_2_WIDTH } {
	# Procedure called to validate PULSE_2_WIDTH
	return true
}

proc update_PARAM_VALUE.PULSE_3_OFFSET { PARAM_VALUE.PULSE_3_OFFSET } {
	# Procedure called to update PULSE_3_OFFSET when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PULSE_3_OFFSET { PARAM_VALUE.PULSE_3_OFFSET } {
	# Procedure called to validate PULSE_3_OFFSET
	return true
}

proc update_PARAM_VALUE.PULSE_3_PERIOD { PARAM_VALUE.PULSE_3_PERIOD } {
	# Procedure called to update PULSE_3_PERIOD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PULSE_3_PERIOD { PARAM_VALUE.PULSE_3_PERIOD } {
	# Procedure called to validate PULSE_3_PERIOD
	return true
}

proc update_PARAM_VALUE.PULSE_3_WIDTH { PARAM_VALUE.PULSE_3_WIDTH } {
	# Procedure called to update PULSE_3_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PULSE_3_WIDTH { PARAM_VALUE.PULSE_3_WIDTH } {
	# Procedure called to validate PULSE_3_WIDTH
	return true
}

proc update_PARAM_VALUE.PWM_EXT_SYNC { PARAM_VALUE.PWM_EXT_SYNC } {
	# Procedure called to update PWM_EXT_SYNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PWM_EXT_SYNC { PARAM_VALUE.PWM_EXT_SYNC } {
	# Procedure called to validate PWM_EXT_SYNC
	return true
}


proc update_MODELPARAM_VALUE.ID { MODELPARAM_VALUE.ID PARAM_VALUE.ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ID}] ${MODELPARAM_VALUE.ID}
}

proc update_MODELPARAM_VALUE.ASYNC_CLK_EN { MODELPARAM_VALUE.ASYNC_CLK_EN PARAM_VALUE.ASYNC_CLK_EN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ASYNC_CLK_EN}] ${MODELPARAM_VALUE.ASYNC_CLK_EN}
}

proc update_MODELPARAM_VALUE.N_PWMS { MODELPARAM_VALUE.N_PWMS PARAM_VALUE.N_PWMS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.N_PWMS}] ${MODELPARAM_VALUE.N_PWMS}
}

proc update_MODELPARAM_VALUE.PWM_EXT_SYNC { MODELPARAM_VALUE.PWM_EXT_SYNC PARAM_VALUE.PWM_EXT_SYNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PWM_EXT_SYNC}] ${MODELPARAM_VALUE.PWM_EXT_SYNC}
}

proc update_MODELPARAM_VALUE.EXT_ASYNC_SYNC { MODELPARAM_VALUE.EXT_ASYNC_SYNC PARAM_VALUE.EXT_ASYNC_SYNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EXT_ASYNC_SYNC}] ${MODELPARAM_VALUE.EXT_ASYNC_SYNC}
}

proc update_MODELPARAM_VALUE.PULSE_0_WIDTH { MODELPARAM_VALUE.PULSE_0_WIDTH PARAM_VALUE.PULSE_0_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PULSE_0_WIDTH}] ${MODELPARAM_VALUE.PULSE_0_WIDTH}
}

proc update_MODELPARAM_VALUE.PULSE_1_WIDTH { MODELPARAM_VALUE.PULSE_1_WIDTH PARAM_VALUE.PULSE_1_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PULSE_1_WIDTH}] ${MODELPARAM_VALUE.PULSE_1_WIDTH}
}

proc update_MODELPARAM_VALUE.PULSE_2_WIDTH { MODELPARAM_VALUE.PULSE_2_WIDTH PARAM_VALUE.PULSE_2_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PULSE_2_WIDTH}] ${MODELPARAM_VALUE.PULSE_2_WIDTH}
}

proc update_MODELPARAM_VALUE.PULSE_3_WIDTH { MODELPARAM_VALUE.PULSE_3_WIDTH PARAM_VALUE.PULSE_3_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PULSE_3_WIDTH}] ${MODELPARAM_VALUE.PULSE_3_WIDTH}
}

proc update_MODELPARAM_VALUE.PULSE_0_PERIOD { MODELPARAM_VALUE.PULSE_0_PERIOD PARAM_VALUE.PULSE_0_PERIOD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PULSE_0_PERIOD}] ${MODELPARAM_VALUE.PULSE_0_PERIOD}
}

proc update_MODELPARAM_VALUE.PULSE_1_PERIOD { MODELPARAM_VALUE.PULSE_1_PERIOD PARAM_VALUE.PULSE_1_PERIOD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PULSE_1_PERIOD}] ${MODELPARAM_VALUE.PULSE_1_PERIOD}
}

proc update_MODELPARAM_VALUE.PULSE_2_PERIOD { MODELPARAM_VALUE.PULSE_2_PERIOD PARAM_VALUE.PULSE_2_PERIOD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PULSE_2_PERIOD}] ${MODELPARAM_VALUE.PULSE_2_PERIOD}
}

proc update_MODELPARAM_VALUE.PULSE_3_PERIOD { MODELPARAM_VALUE.PULSE_3_PERIOD PARAM_VALUE.PULSE_3_PERIOD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PULSE_3_PERIOD}] ${MODELPARAM_VALUE.PULSE_3_PERIOD}
}

proc update_MODELPARAM_VALUE.PULSE_0_OFFSET { MODELPARAM_VALUE.PULSE_0_OFFSET PARAM_VALUE.PULSE_0_OFFSET } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PULSE_0_OFFSET}] ${MODELPARAM_VALUE.PULSE_0_OFFSET}
}

proc update_MODELPARAM_VALUE.PULSE_1_OFFSET { MODELPARAM_VALUE.PULSE_1_OFFSET PARAM_VALUE.PULSE_1_OFFSET } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PULSE_1_OFFSET}] ${MODELPARAM_VALUE.PULSE_1_OFFSET}
}

proc update_MODELPARAM_VALUE.PULSE_2_OFFSET { MODELPARAM_VALUE.PULSE_2_OFFSET PARAM_VALUE.PULSE_2_OFFSET } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PULSE_2_OFFSET}] ${MODELPARAM_VALUE.PULSE_2_OFFSET}
}

proc update_MODELPARAM_VALUE.PULSE_3_OFFSET { MODELPARAM_VALUE.PULSE_3_OFFSET PARAM_VALUE.PULSE_3_OFFSET } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PULSE_3_OFFSET}] ${MODELPARAM_VALUE.PULSE_3_OFFSET}
}

