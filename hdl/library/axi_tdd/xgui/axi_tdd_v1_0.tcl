# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set ADI_AXI_TDD_Controller [ipgui::add_page $IPINST -name "ADI AXI TDD Controller"]
  #Adding Group
  ipgui::add_group $IPINST -name "General Configuration" -parent ${ADI_AXI_TDD_Controller}

  ipgui::add_param $IPINST -name "ASYNC_TDD_SYNC" -parent ${ADI_AXI_TDD_Controller} -widget checkBox


}

proc update_PARAM_VALUE.ASYNC_TDD_SYNC { PARAM_VALUE.ASYNC_TDD_SYNC } {
	# Procedure called to update ASYNC_TDD_SYNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ASYNC_TDD_SYNC { PARAM_VALUE.ASYNC_TDD_SYNC } {
	# Procedure called to validate ASYNC_TDD_SYNC
	return true
}


proc update_MODELPARAM_VALUE.ASYNC_TDD_SYNC { MODELPARAM_VALUE.ASYNC_TDD_SYNC PARAM_VALUE.ASYNC_TDD_SYNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ASYNC_TDD_SYNC}] ${MODELPARAM_VALUE.ASYNC_TDD_SYNC}
}

