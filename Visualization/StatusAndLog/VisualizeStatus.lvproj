﻿<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="14008000">
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
		<Item Name="Modules" Type="Folder">
			<Item Name="AnalysisModule.lvlib" Type="Library" URL="../../../Analysis/AnalysisModule/AnalysisModule.lvlib"/>
			<Item Name="AnalysisPlugins.lvlib" Type="Library" URL="../../../Analysis/AnalysisPlugins/AnalysisPlugins.lvlib"/>
			<Item Name="Bus.lvclass" Type="LVClass" URL="../../../BusClass/Bus.lvclass"/>
			<Item Name="DigitizerModule.lvlib" Type="Library" URL="../../../Digitizer/DigitizerModule/DigitizerModule.lvlib"/>
			<Item Name="DigitizerPlugins.lvlib" Type="Library" URL="../../../Digitizer/DigitizerPlugins/DigitizerPlugins.lvlib"/>
			<Item Name="FgenModule.lvlib" Type="Library" URL="../../../FGen/FgenModule/FgenModule.lvlib"/>
			<Item Name="FgenPlugins.lvlib" Type="Library" URL="../../../FGen/FgenPlugins/FgenPlugins.lvlib"/>
			<Item Name="Functions.lvlib" Type="Library" URL="../../../FGen/MemberClasses/Functions.lvlib"/>
			<Item Name="ScopeModule.lvlib" Type="Library" URL="../../../Scope/ScopeModule/ScopeModule.lvlib"/>
			<Item Name="ScopePlugins.lvlib" Type="Library" URL="../../../Scope/ScopePlugins/ScopePlugins.lvlib"/>
			<Item Name="SensorModule.lvlib" Type="Library" URL="../../../Sensor/SensorModule/SensorModule.lvlib"/>
			<Item Name="SensorPlugins.lvlib" Type="Library" URL="../../../Sensor/SensorPlugins/SensorPlugins.lvlib"/>
			<Item Name="SyncModule.lvlib" Type="Library" URL="../../../Sync/SyncModule/SyncModule.lvlib"/>
			<Item Name="SyncPlugins.lvlib" Type="Library" URL="../../../Sync/SyncPlugins/SyncPlugins.lvlib"/>
		</Item>
		<Item Name="Visualization.lvlib" Type="Library" URL="../../Visualization.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="instr.lib" Type="Folder">
				<Item Name="Agilent 90000 Series.lvlib" Type="Library" URL="/&lt;instrlib&gt;/Agilent 90000 Series/Agilent 90000 Series.lvlib"/>
				<Item Name="niScope Abort.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Abort.vi"/>
				<Item Name="niScope acquisition type.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope acquisition type.ctl"/>
				<Item Name="niScope Actual Num Wfms.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Utility/niScope Actual Num Wfms.vi"/>
				<Item Name="niScope Actual Record Length.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Configure/Horizontal/niScope Actual Record Length.vi"/>
				<Item Name="niScope Close.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/niScope Close.vi"/>
				<Item Name="niScope Commit.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Utility/niScope Commit.vi"/>
				<Item Name="niScope Configure Acquisition.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Configure/niScope Configure Acquisition.vi"/>
				<Item Name="niScope Configure Chan Characteristics.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Configure/Vertical/niScope Configure Chan Characteristics.vi"/>
				<Item Name="niScope Configure Horizontal Timing.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Configure/Horizontal/niScope Configure Horizontal Timing.vi"/>
				<Item Name="niScope Configure Trigger (poly).vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Configure/Trigger/niScope Configure Trigger (poly).vi"/>
				<Item Name="niScope Configure Trigger Digital.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Configure/Trigger/niScope Configure Trigger Digital.vi"/>
				<Item Name="niScope Configure Trigger Edge.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Configure/Trigger/niScope Configure Trigger Edge.vi"/>
				<Item Name="niScope Configure Trigger Hysteresis.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Configure/Trigger/niScope Configure Trigger Hysteresis.vi"/>
				<Item Name="niScope Configure Trigger Immediate.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Configure/Trigger/niScope Configure Trigger Immediate.vi"/>
				<Item Name="niScope Configure Trigger Software.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Configure/Trigger/niScope Configure Trigger Software.vi"/>
				<Item Name="niScope Configure Trigger Window.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Configure/Trigger/niScope Configure Trigger Window.vi"/>
				<Item Name="niScope Configure Vertical.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Configure/Vertical/niScope Configure Vertical.vi"/>
				<Item Name="niScope Configure Video Trigger.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Configure/Trigger/niScope Configure Video Trigger.vi"/>
				<Item Name="niScope Fetch (poly).vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Fetch (poly).vi"/>
				<Item Name="niScope Fetch Binary 8.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Fetch Binary 8.vi"/>
				<Item Name="niScope Fetch Binary 16.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Fetch Binary 16.vi"/>
				<Item Name="niScope Fetch Binary 32.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Fetch Binary 32.vi"/>
				<Item Name="niScope Fetch Cluster Complex Double.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Fetch Cluster Complex Double.vi"/>
				<Item Name="niScope Fetch Cluster.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Fetch Cluster.vi"/>
				<Item Name="niScope Fetch Complex Double.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Fetch Complex Double.vi"/>
				<Item Name="niScope Fetch Complex WDT.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Fetch Complex WDT.vi"/>
				<Item Name="niScope Fetch Error Chain.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Fetch Error Chain.vi"/>
				<Item Name="niScope Fetch WDT.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Fetch WDT.vi"/>
				<Item Name="niScope Fetch.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Fetch.vi"/>
				<Item Name="niScope Get Session Reference.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Utility/niScope Get Session Reference.vi"/>
				<Item Name="niScope Initialize With Options.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/niScope Initialize With Options.vi"/>
				<Item Name="niScope LabVIEW Error.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Utility/niScope LabVIEW Error.vi"/>
				<Item Name="niScope Multi Fetch Binary 8.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Multi Fetch Binary 8.vi"/>
				<Item Name="niScope Multi Fetch Binary 16.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Multi Fetch Binary 16.vi"/>
				<Item Name="niScope Multi Fetch Binary 32.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Multi Fetch Binary 32.vi"/>
				<Item Name="niScope Multi Fetch Cluster Complex Double.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Multi Fetch Cluster Complex Double.vi"/>
				<Item Name="niScope Multi Fetch Cluster.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Multi Fetch Cluster.vi"/>
				<Item Name="niScope Multi Fetch Complex Double.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Multi Fetch Complex Double.vi"/>
				<Item Name="niScope Multi Fetch Complex WDT.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Multi Fetch Complex WDT.vi"/>
				<Item Name="niScope Multi Fetch WDT.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Multi Fetch WDT.vi"/>
				<Item Name="niScope Multi Fetch.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Multi Fetch.vi"/>
				<Item Name="niScope Multi Read Cluster.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/niScope Multi Read Cluster.vi"/>
				<Item Name="niScope Multi Read WDT.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/niScope Multi Read WDT.vi"/>
				<Item Name="niScope polarity.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope polarity.ctl"/>
				<Item Name="niScope Read (poly).vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/niScope Read (poly).vi"/>
				<Item Name="niScope Read Cluster.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/niScope Read Cluster.vi"/>
				<Item Name="niScope Read WDT.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/niScope Read WDT.vi"/>
				<Item Name="niScope signal format.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope signal format.ctl"/>
				<Item Name="niScope timestamp type.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope timestamp type.ctl"/>
				<Item Name="niScope trigger coupling.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope trigger coupling.ctl"/>
				<Item Name="niScope trigger slope.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope trigger slope.ctl"/>
				<Item Name="niScope trigger source digital.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope trigger source digital.ctl"/>
				<Item Name="niScope trigger source.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope trigger source.ctl"/>
				<Item Name="niScope trigger window mode.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope trigger window mode.ctl"/>
				<Item Name="niScope tv event.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope tv event.ctl"/>
				<Item Name="niScope vertical coupling.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope vertical coupling.ctl"/>
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
				<Item Name="niTClk Configure For Homogeneous Triggers.vi" Type="VI" URL="/&lt;instrlib&gt;/niTClk/niTClk.llb/niTClk Configure For Homogeneous Triggers.vi"/>
				<Item Name="niTClk Fill In Error Info.vi" Type="VI" URL="/&lt;instrlib&gt;/niTClk/niTClk.llb/niTClk Fill In Error Info.vi"/>
				<Item Name="niTClk Initiate.vi" Type="VI" URL="/&lt;instrlib&gt;/niTClk/niTClk.llb/niTClk Initiate.vi"/>
				<Item Name="niTClk Synchronize.vi" Type="VI" URL="/&lt;instrlib&gt;/niTClk/niTClk.llb/niTClk Synchronize.vi"/>
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
				<Item Name="Get Cluster Element Names__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Cluster Element Names__ogtk.vi"/>
				<Item Name="Get Cluster Elements TDs__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Get Cluster Elements TDs__ogtk.vi"/>
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
				<Item Name="NISTErrorLib.lvlib" Type="Library" URL="/&lt;userlib&gt;/NIST/NISTErrorLib/NISTErrorLib.lvlib"/>
				<Item Name="Parse String with TDs__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Parse String with TDs__ogtk.vi"/>
				<Item Name="Read INI Cluster__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/variantconfig/variantconfig.llb/Read INI Cluster__ogtk.vi"/>
				<Item Name="Read Key (Variant)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/variantconfig/variantconfig.llb/Read Key (Variant)__ogtk.vi"/>
				<Item Name="Read Section Cluster__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/variantconfig/variantconfig.llb/Read Section Cluster__ogtk.vi"/>
				<Item Name="Refnum Subtype Enum__ogtk.ctl" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Refnum Subtype Enum__ogtk.ctl"/>
				<Item Name="Reshape 1D Array__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Reshape 1D Array__ogtk.vi"/>
				<Item Name="Reshape Array to 1D VArray__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Reshape Array to 1D VArray__ogtk.vi"/>
				<Item Name="Resolve Timestamp Format__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/string/string.llb/Resolve Timestamp Format__ogtk.vi"/>
				<Item Name="Set Data Name__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Set Data Name__ogtk.vi"/>
				<Item Name="Set Enum String Value__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/Set Enum String Value__ogtk.vi"/>
				<Item Name="Socket.lvlib" Type="Library" URL="/&lt;userlib&gt;/NIST/Socket Class/Classes/Socket.lvlib"/>
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
				<Item Name="Write INI Cluster__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/variantconfig/variantconfig.llb/Write INI Cluster__ogtk.vi"/>
				<Item Name="Write Key (Variant)__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/variantconfig/variantconfig.llb/Write Key (Variant)__ogtk.vi"/>
				<Item Name="Write Section Cluster__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/variantconfig/variantconfig.llb/Write Section Cluster__ogtk.vi"/>
			</Item>
			<Item Name="vi.lib" Type="Folder">
				<Item Name="8.6CompatibleGlobalVar.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/8.6CompatibleGlobalVar.vi"/>
				<Item Name="AddNamedRendezvousPrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/AddNamedRendezvousPrefix.vi"/>
				<Item Name="Binary to Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDT.llb/Binary to Digital.vi"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Close File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Close File+.vi"/>
				<Item Name="Compare Two Paths.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Compare Two Paths.vi"/>
				<Item Name="compatReadText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatReadText.vi"/>
				<Item Name="Compress Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDT.llb/Compress Digital.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Create New Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Create New Rendezvous.vi"/>
				<Item Name="Create Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Create Rendezvous.vi"/>
				<Item Name="DAQmx Advance Trigger (Digital Edge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/trigger.llb/DAQmx Advance Trigger (Digital Edge).vi"/>
				<Item Name="DAQmx Advance Trigger (None).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/trigger.llb/DAQmx Advance Trigger (None).vi"/>
				<Item Name="DAQmx Clear Task.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/task.llb/DAQmx Clear Task.vi"/>
				<Item Name="DAQmx Connect Terminals.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/routing.llb/DAQmx Connect Terminals.vi"/>
				<Item Name="DAQmx Create AI Channel (sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create AI Channel (sub).vi"/>
				<Item Name="DAQmx Create AI Channel TEDS(sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create AI Channel TEDS(sub).vi"/>
				<Item Name="DAQmx Create AO Channel (sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create AO Channel (sub).vi"/>
				<Item Name="DAQmx Create Channel (AI-Acceleration-Accelerometer).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Acceleration-Accelerometer).vi"/>
				<Item Name="DAQmx Create Channel (AI-Bridge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Bridge).vi"/>
				<Item Name="DAQmx Create Channel (AI-Current-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Current-Basic).vi"/>
				<Item Name="DAQmx Create Channel (AI-Current-RMS).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Current-RMS).vi"/>
				<Item Name="DAQmx Create Channel (AI-Force-Bridge-Polynomial).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Force-Bridge-Polynomial).vi"/>
				<Item Name="DAQmx Create Channel (AI-Force-Bridge-Table).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Force-Bridge-Table).vi"/>
				<Item Name="DAQmx Create Channel (AI-Force-Bridge-Two-Point-Linear).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Force-Bridge-Two-Point-Linear).vi"/>
				<Item Name="DAQmx Create Channel (AI-Force-IEPE Sensor).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Force-IEPE Sensor).vi"/>
				<Item Name="DAQmx Create Channel (AI-Frequency-Voltage).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Frequency-Voltage).vi"/>
				<Item Name="DAQmx Create Channel (AI-Position-EddyCurrentProxProbe).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Position-EddyCurrentProxProbe).vi"/>
				<Item Name="DAQmx Create Channel (AI-Position-LVDT).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Position-LVDT).vi"/>
				<Item Name="DAQmx Create Channel (AI-Position-RVDT).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Position-RVDT).vi"/>
				<Item Name="DAQmx Create Channel (AI-Pressure-Bridge-Polynomial).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Pressure-Bridge-Polynomial).vi"/>
				<Item Name="DAQmx Create Channel (AI-Pressure-Bridge-Table).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Pressure-Bridge-Table).vi"/>
				<Item Name="DAQmx Create Channel (AI-Pressure-Bridge-Two-Point-Linear).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Pressure-Bridge-Two-Point-Linear).vi"/>
				<Item Name="DAQmx Create Channel (AI-Resistance).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Resistance).vi"/>
				<Item Name="DAQmx Create Channel (AI-Sound Pressure-Microphone).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Sound Pressure-Microphone).vi"/>
				<Item Name="DAQmx Create Channel (AI-Strain-Rosette Strain Gage).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Strain-Rosette Strain Gage).vi"/>
				<Item Name="DAQmx Create Channel (AI-Strain-Strain Gage).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Strain-Strain Gage).vi"/>
				<Item Name="DAQmx Create Channel (AI-Temperature-Built-in Sensor).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Temperature-Built-in Sensor).vi"/>
				<Item Name="DAQmx Create Channel (AI-Temperature-RTD).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Temperature-RTD).vi"/>
				<Item Name="DAQmx Create Channel (AI-Temperature-Thermistor-Iex).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Temperature-Thermistor-Iex).vi"/>
				<Item Name="DAQmx Create Channel (AI-Temperature-Thermistor-Vex).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Temperature-Thermistor-Vex).vi"/>
				<Item Name="DAQmx Create Channel (AI-Temperature-Thermocouple).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Temperature-Thermocouple).vi"/>
				<Item Name="DAQmx Create Channel (AI-Torque-Bridge-Polynomial).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Torque-Bridge-Polynomial).vi"/>
				<Item Name="DAQmx Create Channel (AI-Torque-Bridge-Table).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Torque-Bridge-Table).vi"/>
				<Item Name="DAQmx Create Channel (AI-Torque-Bridge-Two-Point-Linear).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Torque-Bridge-Two-Point-Linear).vi"/>
				<Item Name="DAQmx Create Channel (AI-Velocity-IEPE Sensor).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Velocity-IEPE Sensor).vi"/>
				<Item Name="DAQmx Create Channel (AI-Voltage-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Voltage-Basic).vi"/>
				<Item Name="DAQmx Create Channel (AI-Voltage-Custom with Excitation).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Voltage-Custom with Excitation).vi"/>
				<Item Name="DAQmx Create Channel (AI-Voltage-RMS).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Voltage-RMS).vi"/>
				<Item Name="DAQmx Create Channel (AO-Current-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AO-Current-Basic).vi"/>
				<Item Name="DAQmx Create Channel (AO-FuncGen).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AO-FuncGen).vi"/>
				<Item Name="DAQmx Create Channel (AO-Voltage-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AO-Voltage-Basic).vi"/>
				<Item Name="DAQmx Create Channel (CI-Count Edges).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Count Edges).vi"/>
				<Item Name="DAQmx Create Channel (CI-Frequency).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Frequency).vi"/>
				<Item Name="DAQmx Create Channel (CI-GPS Timestamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-GPS Timestamp).vi"/>
				<Item Name="DAQmx Create Channel (CI-Period).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Period).vi"/>
				<Item Name="DAQmx Create Channel (CI-Position-Angular Encoder).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Position-Angular Encoder).vi"/>
				<Item Name="DAQmx Create Channel (CI-Position-Linear Encoder).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Position-Linear Encoder).vi"/>
				<Item Name="DAQmx Create Channel (CI-Pulse Freq).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Pulse Freq).vi"/>
				<Item Name="DAQmx Create Channel (CI-Pulse Ticks).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Pulse Ticks).vi"/>
				<Item Name="DAQmx Create Channel (CI-Pulse Time).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Pulse Time).vi"/>
				<Item Name="DAQmx Create Channel (CI-Pulse Width).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Pulse Width).vi"/>
				<Item Name="DAQmx Create Channel (CI-Semi Period).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Semi Period).vi"/>
				<Item Name="DAQmx Create Channel (CI-Two Edge Separation).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Two Edge Separation).vi"/>
				<Item Name="DAQmx Create Channel (CO-Pulse Generation-Frequency).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CO-Pulse Generation-Frequency).vi"/>
				<Item Name="DAQmx Create Channel (CO-Pulse Generation-Ticks).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CO-Pulse Generation-Ticks).vi"/>
				<Item Name="DAQmx Create Channel (CO-Pulse Generation-Time).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CO-Pulse Generation-Time).vi"/>
				<Item Name="DAQmx Create Channel (DI-Digital Input).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (DI-Digital Input).vi"/>
				<Item Name="DAQmx Create Channel (DO-Digital Output).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (DO-Digital Output).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Acceleration-Accelerometer).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Acceleration-Accelerometer).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Bridge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Bridge).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Current-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Current-Basic).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Force-Bridge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Force-Bridge).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Force-IEPE Sensor).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Force-IEPE Sensor).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Position-LVDT).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Position-LVDT).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Position-RVDT).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Position-RVDT).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Pressure-Bridge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Pressure-Bridge).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Resistance).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Resistance).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Sound Pressure-Microphone).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Sound Pressure-Microphone).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Strain-Strain Gage).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Strain-Strain Gage).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Temperature-RTD).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Temperature-RTD).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Temperature-Thermistor-Iex).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Temperature-Thermistor-Iex).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Temperature-Thermistor-Vex).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Temperature-Thermistor-Vex).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Temperature-Thermocouple).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Temperature-Thermocouple).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Torque-Bridge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Torque-Bridge).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Voltage-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Voltage-Basic).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Voltage-Custom with Excitation).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Voltage-Custom with Excitation).vi"/>
				<Item Name="DAQmx Create CI Channel (sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create CI Channel (sub).vi"/>
				<Item Name="DAQmx Create CO Channel (sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create CO Channel (sub).vi"/>
				<Item Name="DAQmx Create DI Channel (sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create DI Channel (sub).vi"/>
				<Item Name="DAQmx Create DO Channel (sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create DO Channel (sub).vi"/>
				<Item Name="DAQmx Create Strain Rosette AI Channels (sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Strain Rosette AI Channels (sub).vi"/>
				<Item Name="DAQmx Create Task.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/task.llb/DAQmx Create Task.vi"/>
				<Item Name="DAQmx Create Timing Source (Control Loop From Task).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/timing.llb/DAQmx Create Timing Source (Control Loop From Task).vi"/>
				<Item Name="DAQmx Create Timing Source (Digital Change Detection).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/timing.llb/DAQmx Create Timing Source (Digital Change Detection).vi"/>
				<Item Name="DAQmx Create Timing Source (Digital Change Detection_sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/timing.llb/DAQmx Create Timing Source (Digital Change Detection_sub).vi"/>
				<Item Name="DAQmx Create Timing Source (Digital Edge using Counter).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/timing.llb/DAQmx Create Timing Source (Digital Edge using Counter).vi"/>
				<Item Name="DAQmx Create Timing Source (Digital Edge using Counter_sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/timing.llb/DAQmx Create Timing Source (Digital Edge using Counter_sub).vi"/>
				<Item Name="DAQmx Create Timing Source (Frequency).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/timing.llb/DAQmx Create Timing Source (Frequency).vi"/>
				<Item Name="DAQmx Create Timing Source (Frequency_sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/timing.llb/DAQmx Create Timing Source (Frequency_sub).vi"/>
				<Item Name="DAQmx Create Timing Source (Signal From Task).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/timing.llb/DAQmx Create Timing Source (Signal From Task).vi"/>
				<Item Name="DAQmx Create Timing Source (SignalFromTask_sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/timing.llb/DAQmx Create Timing Source (SignalFromTask_sub).vi"/>
				<Item Name="DAQmx Create Timing Source (sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/timing.llb/DAQmx Create Timing Source (sub).vi"/>
				<Item Name="DAQmx Create Timing Source (sub2).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/timing.llb/DAQmx Create Timing Source (sub2).vi"/>
				<Item Name="DAQmx Create Timing Source.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/timing.llb/DAQmx Create Timing Source.vi"/>
				<Item Name="DAQmx Create Virtual Channel.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Virtual Channel.vi"/>
				<Item Name="DAQmx Fill In Error Info.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/miscellaneous.llb/DAQmx Fill In Error Info.vi"/>
				<Item Name="DAQmx Read (Analog 1D DBL 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 1D DBL 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Analog 1D DBL NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 1D DBL NChan 1Samp).vi"/>
				<Item Name="DAQmx Read (Analog 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 1D Wfm NChan 1Samp).vi"/>
				<Item Name="DAQmx Read (Analog 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 1D Wfm NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Analog 2D DBL NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 2D DBL NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Analog 2D I16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 2D I16 NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Analog 2D I32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 2D I32 NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Analog 2D U16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 2D U16 NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Analog 2D U32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 2D U32 NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Analog DBL 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog DBL 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Analog Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog Wfm 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Analog Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog Wfm 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Counter 1D DBL 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter 1D DBL 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Counter 1D Pulse Freq 1 Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter 1D Pulse Freq 1 Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Counter 1D Pulse Ticks 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter 1D Pulse Ticks 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Counter 1D Pulse Time 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter 1D Pulse Time 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Counter 1D U32 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter 1D U32 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Counter DBL 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter DBL 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Counter Pulse Freq 1 Chan 1 Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter Pulse Freq 1 Chan 1 Samp).vi"/>
				<Item Name="DAQmx Read (Counter Pulse Ticks 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter Pulse Ticks 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Counter Pulse Time 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter Pulse Time 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Counter U32 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter U32 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital 1D Bool 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D Bool 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital 1D Bool NChan 1Samp 1Line).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D Bool NChan 1Samp 1Line).vi"/>
				<Item Name="DAQmx Read (Digital 1D U8 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U8 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Digital 1D U8 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U8 NChan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital 1D U16 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U16 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Digital 1D U16 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U16 NChan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital 1D U32 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U32 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Digital 1D U32 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U32 NChan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D Wfm NChan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D Wfm NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Digital 2D Bool NChan 1Samp NLine).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 2D Bool NChan 1Samp NLine).vi"/>
				<Item Name="DAQmx Read (Digital 2D U8 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 2D U8 NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Digital 2D U16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 2D U16 NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Digital 2D U32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 2D U32 NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Digital Bool 1Line 1Point).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital Bool 1Line 1Point).vi"/>
				<Item Name="DAQmx Read (Digital U8 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital U8 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital U16 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital U16 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital U32 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital U32 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital Wfm 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital Wfm 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Raw 1D I8).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D I8).vi"/>
				<Item Name="DAQmx Read (Raw 1D I16).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D I16).vi"/>
				<Item Name="DAQmx Read (Raw 1D I32).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D I32).vi"/>
				<Item Name="DAQmx Read (Raw 1D U8).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D U8).vi"/>
				<Item Name="DAQmx Read (Raw 1D U16).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D U16).vi"/>
				<Item Name="DAQmx Read (Raw 1D U32).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D U32).vi"/>
				<Item Name="DAQmx Read.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read.vi"/>
				<Item Name="DAQmx Reference Trigger (Analog Edge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/trigger.llb/DAQmx Reference Trigger (Analog Edge).vi"/>
				<Item Name="DAQmx Reference Trigger (Analog Window).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/trigger.llb/DAQmx Reference Trigger (Analog Window).vi"/>
				<Item Name="DAQmx Reference Trigger (Digital Edge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/trigger.llb/DAQmx Reference Trigger (Digital Edge).vi"/>
				<Item Name="DAQmx Reference Trigger (Digital Pattern).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/trigger.llb/DAQmx Reference Trigger (Digital Pattern).vi"/>
				<Item Name="DAQmx Reference Trigger (None).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/trigger.llb/DAQmx Reference Trigger (None).vi"/>
				<Item Name="DAQmx Reset Device.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/system.llb/DAQmx Reset Device.vi"/>
				<Item Name="DAQmx Rollback Channel If Error.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Rollback Channel If Error.vi"/>
				<Item Name="DAQmx Set CJC Parameters (sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Set CJC Parameters (sub).vi"/>
				<Item Name="DAQmx Start Task.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/task.llb/DAQmx Start Task.vi"/>
				<Item Name="DAQmx Start Trigger (Analog Edge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/trigger.llb/DAQmx Start Trigger (Analog Edge).vi"/>
				<Item Name="DAQmx Start Trigger (Analog Window).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/trigger.llb/DAQmx Start Trigger (Analog Window).vi"/>
				<Item Name="DAQmx Start Trigger (Digital Edge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/trigger.llb/DAQmx Start Trigger (Digital Edge).vi"/>
				<Item Name="DAQmx Start Trigger (Digital Pattern).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/trigger.llb/DAQmx Start Trigger (Digital Pattern).vi"/>
				<Item Name="DAQmx Start Trigger (None).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/trigger.llb/DAQmx Start Trigger (None).vi"/>
				<Item Name="DAQmx Stop Task.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/task.llb/DAQmx Stop Task.vi"/>
				<Item Name="DAQmx Timing (Burst Export Clock).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Burst Export Clock).vi"/>
				<Item Name="DAQmx Timing (Burst Import Clock).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Burst Import Clock).vi"/>
				<Item Name="DAQmx Timing (Change Detection).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Change Detection).vi"/>
				<Item Name="DAQmx Timing (Handshaking).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Handshaking).vi"/>
				<Item Name="DAQmx Timing (Implicit).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Implicit).vi"/>
				<Item Name="DAQmx Timing (Pipelined Sample Clock).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Pipelined Sample Clock).vi"/>
				<Item Name="DAQmx Timing (Sample Clock).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Sample Clock).vi"/>
				<Item Name="DAQmx Timing (Use Waveform).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Use Waveform).vi"/>
				<Item Name="DAQmx Timing.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing.vi"/>
				<Item Name="DAQmx Trigger.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/trigger.llb/DAQmx Trigger.vi"/>
				<Item Name="DAQmx Wait For Next Sample Clock.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Wait For Next Sample Clock.vi"/>
				<Item Name="DAQmx Write (Analog 1D DBL 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D DBL 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog 1D DBL NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D DBL NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Analog 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D Wfm NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Analog 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D Wfm NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog 2D DBL NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 2D DBL NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog 2D I16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 2D I16 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog 2D I32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 2D I32 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog 2D U16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 2D U16 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog DBL 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog DBL 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Analog Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog Wfm 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Analog Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog Wfm 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Counter 1D Frequency 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Frequency 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Counter 1D Frequency NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Frequency NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Counter 1D Ticks 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Ticks 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Counter 1D Time 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Time 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Counter 1D Time NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Time NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Counter 1DTicks NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1DTicks NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Counter Frequency 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter Frequency 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Counter Ticks 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter Ticks 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Counter Time 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter Time 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital 1D Bool 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D Bool 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital 1D Bool NChan 1Samp 1Line).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D Bool NChan 1Samp 1Line).vi"/>
				<Item Name="DAQmx Write (Digital 1D U8 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U8 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 1D U8 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U8 NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital 1D U16 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U16 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 1D U16 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U16 NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital 1D U32 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U32 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 1D U32 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U32 NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D Wfm NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D Wfm NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 2D Bool NChan 1Samp NLine).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 2D Bool NChan 1Samp NLine).vi"/>
				<Item Name="DAQmx Write (Digital 2D U8 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 2D U8 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 2D U16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 2D U16 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 2D U32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 2D U32 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital Bool 1Line 1Point).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital Bool 1Line 1Point).vi"/>
				<Item Name="DAQmx Write (Digital U8 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital U8 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital U16 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital U16 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital U32 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital U32 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital Wfm 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital Wfm 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Raw 1D I8).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D I8).vi"/>
				<Item Name="DAQmx Write (Raw 1D I16).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D I16).vi"/>
				<Item Name="DAQmx Write (Raw 1D I32).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D I32).vi"/>
				<Item Name="DAQmx Write (Raw 1D U8).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D U8).vi"/>
				<Item Name="DAQmx Write (Raw 1D U16).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D U16).vi"/>
				<Item Name="DAQmx Write (Raw 1D U32).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D U32).vi"/>
				<Item Name="DAQmx Write.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write.vi"/>
				<Item Name="Destroy A Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Destroy A Rendezvous.vi"/>
				<Item Name="Destroy Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Destroy Rendezvous.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="DTbl Binary U8 to Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Binary U8 to Digital.vi"/>
				<Item Name="DTbl Binary U16 to Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Binary U16 to Digital.vi"/>
				<Item Name="DTbl Binary U32 to Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Binary U32 to Digital.vi"/>
				<Item Name="DTbl Compress Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Compress Digital.vi"/>
				<Item Name="DTbl Digital Size.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Digital Size.vi"/>
				<Item Name="DTbl Uncompress Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Uncompress Digital.vi"/>
				<Item Name="DU64_U32SubtractWithBorrow.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/TSOps.llb/DU64_U32SubtractWithBorrow.vi"/>
				<Item Name="DWDT Binary U8 to Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Binary U8 to Digital.vi"/>
				<Item Name="DWDT Binary U16 to Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Binary U16 to Digital.vi"/>
				<Item Name="DWDT Binary U32 to Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Binary U32 to Digital.vi"/>
				<Item Name="DWDT Compress Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Compress Digital.vi"/>
				<Item Name="DWDT Digital Size.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Digital Size.vi"/>
				<Item Name="DWDT Get Final Time Value.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Get Final Time Value.vi"/>
				<Item Name="DWDT Uncompress Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Uncompress Digital.vi"/>
				<Item Name="DWDT Waveform Duration.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Waveform Duration.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="Find First Error.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find First Error.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get Final Time Value.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/WDTOps.llb/Get Final Time Value.vi"/>
				<Item Name="Get LV Class Default Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Default Value.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get System Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/Get System Directory.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetNamedRendezvousPrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/GetNamedRendezvousPrefix.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="I128 Timestamp.ctl" Type="VI" URL="/&lt;vilib&gt;/Waveform/TSOps.llb/I128 Timestamp.ctl"/>
				<Item Name="Internecine Avoider.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/Internecine Avoider.vi"/>
				<Item Name="IVI Error Message Builder.vi" Type="VI" URL="/&lt;vilib&gt;/errclust.llb/IVI Error Message Builder.vi"/>
				<Item Name="IviDigitizer Configure Acquisition.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ividigitizer/_IviDigitizer.llb/IviDigitizer Configure Acquisition.vi"/>
				<Item Name="IviDigitizer Configure Active Trigger Source.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ividigitizer/_IviDigitizer.llb/IviDigitizer Configure Active Trigger Source.vi"/>
				<Item Name="IviDigitizer Configure Channel.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ividigitizer/_IviDigitizer.llb/IviDigitizer Configure Channel.vi"/>
				<Item Name="IviDigitizer Configure Edge Trigger Source.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ividigitizer/_IviDigitizer.llb/IviDigitizer Configure Edge Trigger Source.vi"/>
				<Item Name="IviDigitizer Configure Glitch Trigger Source [GT].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ividigitizer/_IviDigitizer.llb/IviDigitizer Configure Glitch Trigger Source [GT].vi"/>
				<Item Name="IviDigitizer Configure Pretrigger Samples [PS].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ividigitizer/_IviDigitizer.llb/IviDigitizer Configure Pretrigger Samples [PS].vi"/>
				<Item Name="IviDigitizer Configure Runt Trigger Source [RT].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ividigitizer/_IviDigitizer.llb/IviDigitizer Configure Runt Trigger Source [RT].vi"/>
				<Item Name="IviDigitizer Configure Sample Mode [SM].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ividigitizer/_IviDigitizer.llb/IviDigitizer Configure Sample Mode [SM].vi"/>
				<Item Name="IviDigitizer Configure TV Trigger Source [TVT].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ividigitizer/_IviDigitizer.llb/IviDigitizer Configure TV Trigger Source [TVT].vi"/>
				<Item Name="IviDigitizer Configure Width Trigger Source [WT].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ividigitizer/_IviDigitizer.llb/IviDigitizer Configure Width Trigger Source [WT].vi"/>
				<Item Name="IviDigitizer Configure Window Trigger Source [WINT].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ividigitizer/_IviDigitizer.llb/IviDigitizer Configure Window Trigger Source [WINT].vi"/>
				<Item Name="IviDigitizer Initialize With Options.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ividigitizer/_IviDigitizer.llb/IviDigitizer Initialize With Options.vi"/>
				<Item Name="IviDigitizer Initialize.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ividigitizer/_IviDigitizer.llb/IviDigitizer Initialize.vi"/>
				<Item Name="IviDigitizer IVI Error Converter.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ividigitizer/_IviDigitizer.llb/IviDigitizer IVI Error Converter.vi"/>
				<Item Name="IviDigitizer Read Waveform Real64.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ividigitizer/_IviDigitizer.llb/IviDigitizer Read Waveform Real64.vi"/>
				<Item Name="IviDmm Close.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ividmm/_ividmm.llb/IviDmm Close.vi"/>
				<Item Name="IviFgen Abort Generation.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ivifgen/_ivifgen.llb/IviFgen Abort Generation.vi"/>
				<Item Name="IviFgen Configure Arbitrary Waveform [ARB].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ivifgen/_ivifgen.llb/IviFgen Configure Arbitrary Waveform [ARB].vi"/>
				<Item Name="IviFgen Configure Output Enabled.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ivifgen/_ivifgen.llb/IviFgen Configure Output Enabled.vi"/>
				<Item Name="IviFgen Configure Standard Waveform [STD].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ivifgen/_ivifgen.llb/IviFgen Configure Standard Waveform [STD].vi"/>
				<Item Name="IviFgen Create Arbitrary Waveform [ARB].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ivifgen/_ivifgen.llb/IviFgen Create Arbitrary Waveform [ARB].vi"/>
				<Item Name="IviFgen Get Channel Name.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ivifgen/_ivifgen.llb/IviFgen Get Channel Name.vi"/>
				<Item Name="IviFgen Initialize With Options.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ivifgen/_ivifgen.llb/IviFgen Initialize With Options.vi"/>
				<Item Name="IviFgen Initialize.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ivifgen/_ivifgen.llb/IviFgen Initialize.vi"/>
				<Item Name="IviFgen Initiate Generation.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ivifgen/_ivifgen.llb/IviFgen Initiate Generation.vi"/>
				<Item Name="IviFgen IVI Error Converter.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/ivifgen/_ivifgen.llb/IviFgen IVI Error Converter.vi"/>
				<Item Name="IviScope Actual Record Length.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Actual Record Length.vi"/>
				<Item Name="IviScope Close.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Close.vi"/>
				<Item Name="IviScope Configure AC Line Trigger Slope [AT].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Configure AC Line Trigger Slope [AT].vi"/>
				<Item Name="IviScope Configure Acquisition Record.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Configure Acquisition Record.vi"/>
				<Item Name="IviScope Configure Acquisition Type.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Configure Acquisition Type.vi"/>
				<Item Name="IviScope Configure Channel Characteristics.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Configure Channel Characteristics.vi"/>
				<Item Name="IviScope Configure Channel.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Configure Channel.vi"/>
				<Item Name="IviScope Configure Edge Trigger Source.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Configure Edge Trigger Source.vi"/>
				<Item Name="IviScope Configure Glitch Trigger Source [GT].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Configure Glitch Trigger Source [GT].vi"/>
				<Item Name="IviScope Configure Initiate Continuous [CA].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Configure Initiate Continuous [CA].vi"/>
				<Item Name="IviScope Configure Interpolation [I].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Configure Interpolation [I].vi"/>
				<Item Name="IviScope Configure Number of Averages [AA].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Configure Number of Averages [AA].vi"/>
				<Item Name="IviScope Configure Runt Trigger Source [RT].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Configure Runt Trigger Source [RT].vi"/>
				<Item Name="IviScope Configure Trigger Coupling.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Configure Trigger Coupling.vi"/>
				<Item Name="IviScope Configure Trigger.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Configure Trigger.vi"/>
				<Item Name="IviScope Configure TV Trigger Source [TV].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Configure TV Trigger Source [TV].vi"/>
				<Item Name="IviScope Configure Width Trigger Source [WT].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Configure Width Trigger Source [WT].vi"/>
				<Item Name="IviScope Initialize With Options.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Initialize With Options.vi"/>
				<Item Name="IviScope IVI Error Converter.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope IVI Error Converter.vi"/>
				<Item Name="IviScope Read Waveform.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviscope/_iviscope.llb/IviScope Read Waveform.vi"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVKeyNavTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVKeyNavTypeDef.ctl"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="NI_AAL_Angle.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AAL_Angle.lvlib"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="NI_AALPro.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALPro.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_LVConfig.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/config.llb/NI_LVConfig.lvlib"/>
				<Item Name="NI_MABase.lvlib" Type="Library" URL="/&lt;vilib&gt;/measure/NI_MABase.lvlib"/>
				<Item Name="NI_MAPro.lvlib" Type="Library" URL="/&lt;vilib&gt;/measure/NI_MAPro.lvlib"/>
				<Item Name="NI_Matrix.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/Matrix/NI_Matrix.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="NI_PtbyPt.lvlib" Type="Library" URL="/&lt;vilib&gt;/ptbypt/NI_PtbyPt.lvlib"/>
				<Item Name="nisyscfg.lvlib" Type="Library" URL="/&lt;vilib&gt;/nisyscfg/nisyscfg.lvlib"/>
				<Item Name="Not A Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Not A Rendezvous.vi"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Number of Waveform Samples.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/WDTOps.llb/Number of Waveform Samples.vi"/>
				<Item Name="Open File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Open File+.vi"/>
				<Item Name="Read File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read File+ (string).vi"/>
				<Item Name="Read From Spreadsheet File (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (DBL).vi"/>
				<Item Name="Read From Spreadsheet File (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (I64).vi"/>
				<Item Name="Read From Spreadsheet File (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (string).vi"/>
				<Item Name="Read From Spreadsheet File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File.vi"/>
				<Item Name="Read Lines From File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Lines From File.vi"/>
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
				<Item Name="System Directory Type.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/System Directory Type.ctl"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="TCP Listen Internal List.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/TCP Listen Internal List.vi"/>
				<Item Name="TCP Listen List Operations.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/TCP Listen List Operations.ctl"/>
				<Item Name="TCP Listen.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/TCP Listen.vi"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Timestamp Subtract.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/TSOps.llb/Timestamp Subtract.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="UDP Multicast Open.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/UDP Multicast Open.vi"/>
				<Item Name="UDP Multicast Read-Only Open.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/UDP Multicast Read-Only Open.vi"/>
				<Item Name="UDP Multicast Read-Write Open.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/UDP Multicast Read-Write Open.vi"/>
				<Item Name="UDP Multicast Write-Only Open.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/UDP Multicast Write-Only Open.vi"/>
				<Item Name="usereventprio.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/usereventprio.ctl"/>
				<Item Name="Wait at Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Wait at Rendezvous.vi"/>
				<Item Name="Waveform Duration.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/WDTOps.llb/Waveform Duration.vi"/>
				<Item Name="WDT Get Final Time Value DBL.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/WDTOps.llb/WDT Get Final Time Value DBL.vi"/>
				<Item Name="WDT Number of Waveform Samples CDB.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/WDTOps.llb/WDT Number of Waveform Samples CDB.vi"/>
				<Item Name="WDT Number of Waveform Samples DBL.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/WDTOps.llb/WDT Number of Waveform Samples DBL.vi"/>
				<Item Name="WDT Number of Waveform Samples EXT.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/WDTOps.llb/WDT Number of Waveform Samples EXT.vi"/>
				<Item Name="WDT Number of Waveform Samples I8.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/WDTOps.llb/WDT Number of Waveform Samples I8.vi"/>
				<Item Name="WDT Number of Waveform Samples I16.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/WDTOps.llb/WDT Number of Waveform Samples I16.vi"/>
				<Item Name="WDT Number of Waveform Samples I32.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/WDTOps.llb/WDT Number of Waveform Samples I32.vi"/>
				<Item Name="WDT Number of Waveform Samples SGL.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/WDTOps.llb/WDT Number of Waveform Samples SGL.vi"/>
				<Item Name="WDT Waveform Duration DBL.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/WDTOps.llb/WDT Waveform Duration DBL.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Write Spreadsheet String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Spreadsheet String.vi"/>
				<Item Name="Write To Spreadsheet File (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (DBL).vi"/>
				<Item Name="Write To Spreadsheet File (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (I64).vi"/>
				<Item Name="Write To Spreadsheet File (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (string).vi"/>
				<Item Name="Write To Spreadsheet File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File.vi"/>
			</Item>
			<Item Name="Config_class.lvlib" Type="Library" URL="../../../../lv_config_class/Config_class.lvlib"/>
			<Item Name="Ini_lib.lvlib" Type="Library" URL="../../../../LV_Ini/Ini_lib.lvlib"/>
			<Item Name="ivi.dll" Type="Document" URL="ivi.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="IviDigitizer_ni.dll" Type="Document" URL="IviDigitizer_ni.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="IviFgen.dll" Type="Document" URL="IviFgen.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="IviScope.dll" Type="Document" URL="IviScope.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="kernel32.dll" Type="Document" URL="kernel32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
			<Item Name="matscript.dll" Type="Document"/>
			<Item Name="nilvaiu.dll" Type="Document" URL="nilvaiu.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="niScope_32.dll" Type="Document" URL="niScope_32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="niSync.dll" Type="Document" URL="niSync.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nisyscfg.dll" Type="Document" URL="nisyscfg.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="niTClk.dll" Type="Document" URL="niTClk.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Test.lvclass" Type="LVClass" URL="../../../TestClass/Test.lvclass"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
