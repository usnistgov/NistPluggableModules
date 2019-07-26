<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="14008000">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">false</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Documentation" Type="Folder">
			<Item Name="errors.rst" Type="Document" URL="../../doc/sphinx/source/errors.rst"/>
		</Item>
		<Item Name="SyncModule.lvlib" Type="Library" URL="../SyncModule/SyncModule.lvlib"/>
		<Item Name="SyncPlugins.lvlib" Type="Library" URL="../SyncPlugins/SyncPlugins.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="instr.lib" Type="Folder">
				<Item Name="niSync Clear Clock.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Clear Clock.vi"/>
				<Item Name="niSync Clear Future Time Events.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Clear Future Time Events.vi"/>
				<Item Name="niSync Close.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Close.vi"/>
				<Item Name="niSync Connect Clock Terminals.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Connect Clock Terminals.vi"/>
				<Item Name="niSync Connect Software Trigger.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Connect Software Trigger.vi"/>
				<Item Name="niSync Connect Trigger Terminals.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Connect Trigger Terminals.vi"/>
				<Item Name="niSync Convert 1588 Time To Time Stamp.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Convert 1588 Time To Time Stamp.vi"/>
				<Item Name="niSync Convert Time Stamp To 1588 Time.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Convert Time Stamp To 1588 Time.vi"/>
				<Item Name="niSync Create Clock (Frequency).vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Create Clock (Frequency).vi"/>
				<Item Name="niSync Create Clock (Ticks).vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Create Clock (Ticks).vi"/>
				<Item Name="niSync Create Clock (Time).vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Create Clock (Time).vi"/>
				<Item Name="niSync Create Clock.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Create Clock.vi"/>
				<Item Name="niSync Create Future Time Event.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Create Future Time Event.vi"/>
				<Item Name="niSync Disable Time Stamp Trigger.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Disable Time Stamp Trigger.vi"/>
				<Item Name="niSync Disconnect Clock Terminals.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Disconnect Clock Terminals.vi"/>
				<Item Name="niSync Disconnect Software Trigger.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Disconnect Software Trigger.vi"/>
				<Item Name="niSync Disconnect Trigger Terminals.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Disconnect Trigger Terminals.vi"/>
				<Item Name="niSync Enable Time Stamp Trigger.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Enable Time Stamp Trigger.vi"/>
				<Item Name="niSync Get Time.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Get Time.vi"/>
				<Item Name="niSync Initialize (IVI).vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Initialize (IVI).vi"/>
				<Item Name="niSync Initialize (String).vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Initialize (String).vi"/>
				<Item Name="niSync Initialize.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Initialize.vi"/>
				<Item Name="niSync IVI Error Converter.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync IVI Error Converter.vi"/>
				<Item Name="niSync Read Trigger Time Stamp (Multiple).vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Read Trigger Time Stamp (Multiple).vi"/>
				<Item Name="niSync Read Trigger Time Stamp (Single).vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Read Trigger Time Stamp (Single).vi"/>
				<Item Name="niSync Read Trigger Time Stamp.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Read Trigger Time Stamp.vi"/>
				<Item Name="niSync Send Software Trigger.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Send Software Trigger.vi"/>
				<Item Name="niSync Set Time Reference (1588 Ordinary Clock).vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Set Time Reference (1588 Ordinary Clock).vi"/>
				<Item Name="niSync Set Time Reference (Free Running).vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Set Time Reference (Free Running).vi"/>
				<Item Name="niSync Set Time Reference (GPS).vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Set Time Reference (GPS).vi"/>
				<Item Name="niSync Set Time Reference (IRIG).vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Set Time Reference (IRIG).vi"/>
				<Item Name="niSync Set Time Reference (PPS).vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Set Time Reference (PPS).vi"/>
				<Item Name="niSync Set Time Reference.vi" Type="VI" URL="/&lt;instrlib&gt;/niSync/niSync.llb/niSync Set Time Reference.vi"/>
			</Item>
			<Item Name="user.lib" Type="Folder">
				<Item Name="_clkDisc_fixedFifo.ctl" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_fixedFifo.ctl"/>
				<Item Name="_clkDisc_fixedFifo_create.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_fixedFifo_create.vi"/>
				<Item Name="_clkDisc_fixedFifo_getSize.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_fixedFifo_getSize.vi"/>
				<Item Name="_clkDisc_fixedFifo_peek.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_fixedFifo_peek.vi"/>
				<Item Name="_clkDisc_fixedFifo_push.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_fixedFifo_push.vi"/>
				<Item Name="_clkDisc_fixedFifo_pushArray.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_fixedFifo_pushArray.vi"/>
				<Item Name="_clkDisc_fixedFifo_pushElement.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_fixedFifo_pushElement.vi"/>
				<Item Name="_clkDisc_fixedFifo_resize.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_fixedFifo_resize.vi"/>
				<Item Name="_clkDisc_niSync_advancedAttribute_get.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_niSync_advancedAttribute_get.vi"/>
				<Item Name="_clkDisc_niSync_advancedAttribute_get_i32.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_niSync_advancedAttribute_get_i32.vi"/>
				<Item Name="_clkDisc_niSync_advancedAttribute_set.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_niSync_advancedAttribute_set.vi"/>
				<Item Name="_clkDisc_niSync_advancedAttribute_set_bool.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_niSync_advancedAttribute_set_bool.vi"/>
				<Item Name="_clkDisc_niSync_advancedAttribute_set_f64.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_niSync_advancedAttribute_set_f64.vi"/>
				<Item Name="_clkDisc_niSync_advancedAttribute_set_i32.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_niSync_advancedAttribute_set_i32.vi"/>
				<Item Name="_clkDisc_niSync_advancedAttributes.ctl" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_niSync_advancedAttributes.ctl"/>
				<Item Name="_clkDisc_servo_adjustOscVoltage.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_adjustOscVoltage.vi"/>
				<Item Name="_clkDisc_servo_adjustPhase.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_adjustPhase.vi"/>
				<Item Name="_clkDisc_servo_adjustTime.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_adjustTime.vi"/>
				<Item Name="_clkDisc_servo_alignToClk10.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_alignToClk10.vi"/>
				<Item Name="_clkDisc_servo_applyTimeRefCorrection.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_applyTimeRefCorrection.vi"/>
				<Item Name="_clkDisc_servo_calcOscVoltage.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_calcOscVoltage.vi"/>
				<Item Name="_clkDisc_servo_enableClk10Disciplining.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_enableClk10Disciplining.vi"/>
				<Item Name="_clkDisc_servo_filter_holdover_getOscVoltage.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_filter_holdover_getOscVoltage.vi"/>
				<Item Name="_clkDisc_servo_filter_holdoverState.ctl" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_filter_holdoverState.ctl"/>
				<Item Name="_clkDisc_servo_filter_holdoverUpdate.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_filter_holdoverUpdate.vi"/>
				<Item Name="_clkDisc_servo_filter_IIR.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_filter_IIR.vi"/>
				<Item Name="_clkDisc_servo_filter_IIRState.ctl" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_filter_IIRState.ctl"/>
				<Item Name="_clkDisc_servo_filter_linReg.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_filter_linReg.vi"/>
				<Item Name="_clkDisc_servo_gainController.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_gainController.vi"/>
				<Item Name="_clkDisc_servo_getOffsetFromTR.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_getOffsetFromTR.vi"/>
				<Item Name="_clkDisc_servo_parameters.ctl" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_parameters.ctl"/>
				<Item Name="_clkDisc_servo_state.ctl" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_state.ctl"/>
				<Item Name="_clkDisc_servo_stateFinished.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_stateFinished.vi"/>
				<Item Name="_clkDisc_servo_stateMachineController.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_stateMachineController.vi"/>
				<Item Name="_clkDisc_servo_waitForSecondsBoundary.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_waitForSecondsBoundary.vi"/>
				<Item Name="_clkDisc_servo_waitForSyncEvent.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_servo_waitForSyncEvent.vi"/>
				<Item Name="_clkDisc_session.ctl" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session.ctl"/>
				<Item Name="_clkDisc_session_attribute_get.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get.vi"/>
				<Item Name="_clkDisc_session_attribute_get_attributes.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_attributes.vi"/>
				<Item Name="_clkDisc_session_attribute_get_bool.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_bool.vi"/>
				<Item Name="_clkDisc_session_attribute_get_dev.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_dev.vi"/>
				<Item Name="_clkDisc_session_attribute_get_error.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_error.vi"/>
				<Item Name="_clkDisc_session_attribute_get_f64.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_f64.vi"/>
				<Item Name="_clkDisc_session_attribute_get_fixedFifo.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_fixedFifo.vi"/>
				<Item Name="_clkDisc_session_attribute_get_holdoverFilterState.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_holdoverFilterState.vi"/>
				<Item Name="_clkDisc_session_attribute_get_i32.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_i32.vi"/>
				<Item Name="_clkDisc_session_attribute_get_IIRFilterState.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_IIRFilterState.vi"/>
				<Item Name="_clkDisc_session_attribute_get_queue.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_queue.vi"/>
				<Item Name="_clkDisc_session_attribute_get_servoParms.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_servoParms.vi"/>
				<Item Name="_clkDisc_session_attribute_get_servoState.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_servoState.vi"/>
				<Item Name="_clkDisc_session_attribute_get_status.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_status.vi"/>
				<Item Name="_clkDisc_session_attribute_get_string.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_string.vi"/>
				<Item Name="_clkDisc_session_attribute_get_variant.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_variant.vi"/>
				<Item Name="_clkDisc_session_attribute_get_variants.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_variants.vi"/>
				<Item Name="_clkDisc_session_attribute_get_viRef.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_get_viRef.vi"/>
				<Item Name="_clkDisc_session_attribute_set.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_set.vi"/>
				<Item Name="_clkDisc_session_attribute_set_attributes.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_set_attributes.vi"/>
				<Item Name="_clkDisc_session_attribute_set_bool.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_set_bool.vi"/>
				<Item Name="_clkDisc_session_attribute_set_dev.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_set_dev.vi"/>
				<Item Name="_clkDisc_session_attribute_set_error.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_set_error.vi"/>
				<Item Name="_clkDisc_session_attribute_set_f64.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_set_f64.vi"/>
				<Item Name="_clkDisc_session_attribute_set_fixedFifo.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_set_fixedFifo.vi"/>
				<Item Name="_clkDisc_session_attribute_set_holdoverFilterState.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_set_holdoverFilterState.vi"/>
				<Item Name="_clkDisc_session_attribute_set_i32.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_set_i32.vi"/>
				<Item Name="_clkDisc_session_attribute_set_IIRFilterState.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_set_IIRFilterState.vi"/>
				<Item Name="_clkDisc_session_attribute_set_queue.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_set_queue.vi"/>
				<Item Name="_clkDisc_session_attribute_set_servoParms.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_set_servoParms.vi"/>
				<Item Name="_clkDisc_session_attribute_set_servoState.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_set_servoState.vi"/>
				<Item Name="_clkDisc_session_attribute_set_status.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_set_status.vi"/>
				<Item Name="_clkDisc_session_attribute_set_string.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_set_string.vi"/>
				<Item Name="_clkDisc_session_attribute_set_variant.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_set_variant.vi"/>
				<Item Name="_clkDisc_session_attribute_toString.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attribute_toString.vi"/>
				<Item Name="_clkDisc_session_attributes.ctl" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_attributes.ctl"/>
				<Item Name="_clkDisc_session_closeDevices.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_closeDevices.vi"/>
				<Item Name="_clkDisc_session_command_clearStatus.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_clearStatus.vi"/>
				<Item Name="_clkDisc_session_command_create.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_create.vi"/>
				<Item Name="_clkDisc_session_command_exit.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_exit.vi"/>
				<Item Name="_clkDisc_session_command_packet.ctl" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_packet.ctl"/>
				<Item Name="_clkDisc_session_command_parameters.ctl" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_parameters.ctl"/>
				<Item Name="_clkDisc_session_command_parm_get.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_parm_get.vi"/>
				<Item Name="_clkDisc_session_command_parm_get_bool.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_parm_get_bool.vi"/>
				<Item Name="_clkDisc_session_command_parm_get_dev.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_parm_get_dev.vi"/>
				<Item Name="_clkDisc_session_command_parm_get_f64.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_parm_get_f64.vi"/>
				<Item Name="_clkDisc_session_command_parm_get_servoParms.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_parm_get_servoParms.vi"/>
				<Item Name="_clkDisc_session_command_parm_get_type.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_parm_get_type.vi"/>
				<Item Name="_clkDisc_session_command_parm_get_u32.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_parm_get_u32.vi"/>
				<Item Name="_clkDisc_session_command_parm_set.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_parm_set.vi"/>
				<Item Name="_clkDisc_session_command_parm_set_bool.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_parm_set_bool.vi"/>
				<Item Name="_clkDisc_session_command_parm_set_dev.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_parm_set_dev.vi"/>
				<Item Name="_clkDisc_session_command_parm_set_f64.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_parm_set_f64.vi"/>
				<Item Name="_clkDisc_session_command_parm_set_servoParms.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_parm_set_servoParms.vi"/>
				<Item Name="_clkDisc_session_command_parm_set_u32.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_parm_set_u32.vi"/>
				<Item Name="_clkDisc_session_command_parm_toString.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_parm_toString.vi"/>
				<Item Name="_clkDisc_session_command_recv.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_recv.vi"/>
				<Item Name="_clkDisc_session_command_resetServo.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_resetServo.vi"/>
				<Item Name="_clkDisc_session_command_send.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_send.vi"/>
				<Item Name="_clkDisc_session_command_server.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_server.vi"/>
				<Item Name="_clkDisc_session_command_setDevices.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_setDevices.vi"/>
				<Item Name="_clkDisc_session_command_setTimeRefCorrection.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_setTimeRefCorrection.vi"/>
				<Item Name="_clkDisc_session_command_start.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_start.vi"/>
				<Item Name="_clkDisc_session_command_stop.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_command_stop.vi"/>
				<Item Name="_clkDisc_session_commands.ctl" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_commands.ctl"/>
				<Item Name="_clkDisc_session_create.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_create.vi"/>
				<Item Name="_clkDisc_session_createName.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_createName.vi"/>
				<Item Name="_clkDisc_session_createProxy.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_createProxy.vi"/>
				<Item Name="_clkDisc_session_delete.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_delete.vi"/>
				<Item Name="_clkDisc_session_deleteProxy.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_deleteProxy.vi"/>
				<Item Name="_clkDisc_session_namedQueues.ctl" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_namedQueues.ctl"/>
				<Item Name="_clkDisc_session_openDevices.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_openDevices.vi"/>
				<Item Name="_clkDisc_session_resetHoldoverFilter.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_resetHoldoverFilter.vi"/>
				<Item Name="_clkDisc_session_resetServoParms.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_resetServoParms.vi"/>
				<Item Name="_clkDisc_session_servo.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_servo.vi"/>
				<Item Name="_clkDisc_session_setServoParms.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_setServoParms.vi"/>
				<Item Name="_clkDisc_session_status.ctl" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_status.ctl"/>
				<Item Name="_clkDisc_session_status_build.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_status_build.vi"/>
				<Item Name="_clkDisc_session_status_merge.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_status_merge.vi"/>
				<Item Name="_clkDisc_session_status_recv.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_status_recv.vi"/>
				<Item Name="_clkDisc_session_status_send.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_status_send.vi"/>
				<Item Name="_clkDisc_session_status_timekeeper.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_status_timekeeper.vi"/>
				<Item Name="_clkDisc_session_statusEx_build.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_statusEx_build.vi"/>
				<Item Name="_clkDisc_session_statusEx_calculateCrc.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_statusEx_calculateCrc.vi"/>
				<Item Name="_clkDisc_session_timeReferenceDeglitcher.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_timeReferenceDeglitcher.vi"/>
				<Item Name="_clkDisc_session_updateCalculatedOffset.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_updateCalculatedOffset.vi"/>
				<Item Name="_clkDisc_session_updateTimestamp.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/_clkDisc_session_updateTimestamp.vi"/>
				<Item Name="Array of VData to VArray__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Array of VData to VArray__ogtk.vi"/>
				<Item Name="Array of VData to VCluster__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Array of VData to VCluster__ogtk.vi"/>
				<Item Name="Array Size(s)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Array Size(s)__ogtk.vi"/>
				<Item Name="Array to Array of VData__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Array to Array of VData__ogtk.vi"/>
				<Item Name="BaseClasses.lvlib" Type="Library" URL="/&lt;userlib&gt;/NIST/BaseClasses/BaseClasses.lvlib"/>
				<Item Name="Build Error Cluster__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/error/error.llb/Build Error Cluster__ogtk.vi"/>
				<Item Name="Cluster to Array of VData__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Cluster to Array of VData__ogtk.vi"/>
				<Item Name="Encode Section and Key Names__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/variantconfig/variantconfig.llb/Encode Section and Key Names__ogtk.vi"/>
				<Item Name="Format Numeric Array__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/variantconfig/variantconfig.llb/Format Numeric Array__ogtk.vi"/>
				<Item Name="Format Variant Into String__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/string/string.llb/Format Variant Into String__ogtk.vi"/>
				<Item Name="Get Array Element TD__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Array Element TD__ogtk.vi"/>
				<Item Name="Get Array Element TDEnum__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Array Element TDEnum__ogtk.vi"/>
				<Item Name="Get Clock Servo Status.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/Get Clock Servo Status.vi"/>
				<Item Name="Get Data Name from TD__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Data Name from TD__ogtk.vi"/>
				<Item Name="Get Data Name__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Data Name__ogtk.vi"/>
				<Item Name="Get Default Data from TD__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Default Data from TD__ogtk.vi"/>
				<Item Name="Get Element TD from Array TD__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Element TD from Array TD__ogtk.vi"/>
				<Item Name="Get Header from TD__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Header from TD__ogtk.vi"/>
				<Item Name="Get Last PString__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Last PString__ogtk.vi"/>
				<Item Name="Get PString__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get PString__ogtk.vi"/>
				<Item Name="Get Refnum Type Enum from Data__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Refnum Type Enum from Data__ogtk.vi"/>
				<Item Name="Get Refnum Type Enum from TD__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Refnum Type Enum from TD__ogtk.vi"/>
				<Item Name="Get Strings from Enum TD__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Strings from Enum TD__ogtk.vi"/>
				<Item Name="Get Strings from Enum__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Strings from Enum__ogtk.vi"/>
				<Item Name="Get TDEnum from Data__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get TDEnum from Data__ogtk.vi"/>
				<Item Name="Get Variant Attributes__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Variant Attributes__ogtk.vi"/>
				<Item Name="Get Waveform Type Enum from Data__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Waveform Type Enum from Data__ogtk.vi"/>
				<Item Name="Get Waveform Type Enum from TD__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Waveform Type Enum from TD__ogtk.vi"/>
				<Item Name="ModuleAdmin.lvlib" Type="Library" URL="/&lt;userlib&gt;/NIST/ModuleAdminLib/ModuleAdmin.lvlib"/>
				<Item Name="Parse String with TDs__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Parse String with TDs__ogtk.vi"/>
				<Item Name="Read Key (Variant)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/variantconfig/variantconfig.llb/Read Key (Variant)__ogtk.vi"/>
				<Item Name="Read Section Cluster__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/variantconfig/variantconfig.llb/Read Section Cluster__ogtk.vi"/>
				<Item Name="Refnum Subtype Enum__ogtk.ctl" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Refnum Subtype Enum__ogtk.ctl"/>
				<Item Name="Reshape 1D Array__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Reshape 1D Array__ogtk.vi"/>
				<Item Name="Reshape Array to 1D VArray__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Reshape Array to 1D VArray__ogtk.vi"/>
				<Item Name="Resolve Timestamp Format__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/string/string.llb/Resolve Timestamp Format__ogtk.vi"/>
				<Item Name="Set Data Name__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Set Data Name__ogtk.vi"/>
				<Item Name="Set Enum String Value__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Set Enum String Value__ogtk.vi"/>
				<Item Name="Split Cluster TD__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Split Cluster TD__ogtk.vi"/>
				<Item Name="Start Clock Servo.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/Start Clock Servo.vi"/>
				<Item Name="Stop Clock Servo.vi" Type="VI" URL="/&lt;userlib&gt;/mdevClkDisc/mdevClkDisc.llb/Stop Clock Servo.vi"/>
				<Item Name="Strip Units__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Strip Units__ogtk.vi"/>
				<Item Name="Trim Whitespace (String Array)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/string/string.llb/Trim Whitespace (String Array)__ogtk.vi"/>
				<Item Name="Trim Whitespace (String)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/string/string.llb/Trim Whitespace (String)__ogtk.vi"/>
				<Item Name="Trim Whitespace__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/string/string.llb/Trim Whitespace__ogtk.vi"/>
				<Item Name="Type Descriptor Enumeration__ogtk.ctl" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Type Descriptor Enumeration__ogtk.ctl"/>
				<Item Name="Type Descriptor Header__ogtk.ctl" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Type Descriptor Header__ogtk.ctl"/>
				<Item Name="Type Descriptor__ogtk.ctl" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Type Descriptor__ogtk.ctl"/>
				<Item Name="Variant to Header Info__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Variant to Header Info__ogtk.vi"/>
				<Item Name="Waveform Subtype Enum__ogtk.ctl" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Waveform Subtype Enum__ogtk.ctl"/>
				<Item Name="Write Key (Variant)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/variantconfig/variantconfig.llb/Write Key (Variant)__ogtk.vi"/>
			</Item>
			<Item Name="vi.lib" Type="Folder">
				<Item Name="8.6CompatibleGlobalVar.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/8.6CompatibleGlobalVar.vi"/>
				<Item Name="AddNamedRendezvousPrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/AddNamedRendezvousPrefix.vi"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Create New Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Create New Rendezvous.vi"/>
				<Item Name="Create Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Create Rendezvous.vi"/>
				<Item Name="Destroy A Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Destroy A Rendezvous.vi"/>
				<Item Name="Destroy Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Destroy Rendezvous.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get LV Class Default Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Default Value.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetNamedRendezvousPrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/GetNamedRendezvousPrefix.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="IVI Error Message Builder.vi" Type="VI" URL="/&lt;vilib&gt;/errclust.llb/IVI Error Message Builder.vi"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="NI_AALPro.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALPro.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_LVConfig.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/config.llb/NI_LVConfig.lvlib"/>
				<Item Name="NI_MABase.lvlib" Type="Library" URL="/&lt;vilib&gt;/measure/NI_MABase.lvlib"/>
				<Item Name="NI_MAPro.lvlib" Type="Library" URL="/&lt;vilib&gt;/measure/NI_MAPro.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="NI_PtbyPt.lvlib" Type="Library" URL="/&lt;vilib&gt;/ptbypt/NI_PtbyPt.lvlib"/>
				<Item Name="nisyscfg.lvlib" Type="Library" URL="/&lt;vilib&gt;/nisyscfg/nisyscfg.lvlib"/>
				<Item Name="Not A Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Not A Rendezvous.vi"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Release Waiting Procs.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Release Waiting Procs.vi"/>
				<Item Name="RemoveNamedRendezvousPrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/RemoveNamedRendezvousPrefix.vi"/>
				<Item Name="Rendezvous Name &amp; Ref DB Action.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Rendezvous Name &amp; Ref DB Action.ctl"/>
				<Item Name="Rendezvous Name &amp; Ref DB.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Rendezvous Name &amp; Ref DB.vi"/>
				<Item Name="Rendezvous RefNum" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Rendezvous RefNum"/>
				<Item Name="RendezvousDataCluster.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/RendezvousDataCluster.ctl"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="subFile Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/express/express input/FileDialogBlock.llb/subFile Dialog.vi"/>
				<Item Name="subTimeDelay.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/TimeDelayBlock.llb/subTimeDelay.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="usereventprio.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/usereventprio.ctl"/>
				<Item Name="Wait at Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Wait at Rendezvous.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
			</Item>
			<Item Name="kernel32.dll" Type="Document" URL="kernel32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
			<Item Name="niSync.dll" Type="Document" URL="niSync.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nisyscfg.dll" Type="Document" URL="nisyscfg.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
