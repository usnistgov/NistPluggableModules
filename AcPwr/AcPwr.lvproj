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
			<Item Name="errors.docx" Type="Document" URL="../../documentation/errors.docx"/>
			<Item Name="IVI-4.5_ACPwr_2011-03-11.pdf" Type="Document" URL="../Documentation/IVI-4.5_ACPwr_2011-03-11.pdf"/>
		</Item>
		<Item Name="AcPwrModule.lvlib" Type="Library" URL="../AcPwrModule/AcPwrModule.lvlib"/>
		<Item Name="AcPwrPlugins.lvlib" Type="Library" URL="../AcPwrPlugins/AcPwrPlugins.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="instr.lib" Type="Folder">
				<Item Name="C63800 Close.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Close.vi"/>
				<Item Name="C63800 Get RL Programmable Range.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Get RL Programmable Range.vi"/>
				<Item Name="C63800 Initialize.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Initialize.vi"/>
				<Item Name="C63800 IVI Error Converter.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 IVI Error Converter.vi"/>
				<Item Name="C63800 M/F Apparent Power.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 M/F Apparent Power.vi"/>
				<Item Name="C63800 M/F Power Factor.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 M/F Power Factor.vi"/>
				<Item Name="C63800 Measure Or Fetch CF of Current.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Measure Or Fetch CF of Current.vi"/>
				<Item Name="C63800 Measure Or Fetch Current.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Measure Or Fetch Current.vi"/>
				<Item Name="C63800 Measure Or Fetch Frequency.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Measure Or Fetch Frequency.vi"/>
				<Item Name="C63800 Measure Or Fetch Peak Current.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Measure Or Fetch Peak Current.vi"/>
				<Item Name="C63800 Measure Or Fetch Power.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Measure Or Fetch Power.vi"/>
				<Item Name="C63800 Measure Or Fetch Voltage THD.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Measure Or Fetch Voltage THD.vi"/>
				<Item Name="C63800 Measure Or Fetch Voltage.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Measure Or Fetch Voltage.vi"/>
				<Item Name="C63800 Reset.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Reset.vi"/>
				<Item Name="C63800 Set AC or DC Mode.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set AC or DC Mode.vi"/>
				<Item Name="C63800 Set AC Power Loading.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set AC Power Loading.vi"/>
				<Item Name="C63800 Set C of AC Inrush.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set C of AC Inrush.vi"/>
				<Item Name="C63800 Set C of AC RLC.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set C of AC RLC.vi"/>
				<Item Name="C63800 Set CF of AC.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set CF of AC.vi"/>
				<Item Name="C63800 Set CF of DC.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set CF of DC.vi"/>
				<Item Name="C63800 Set CF PF Mode.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set CF PF Mode.vi"/>
				<Item Name="C63800 Set CF PF Priority.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set CF PF Priority.vi"/>
				<Item Name="C63800 Set DC Current.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set DC Current.vi"/>
				<Item Name="C63800 Set DC Power Loading.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set DC Power Loading.vi"/>
				<Item Name="C63800 Set DC Resistance Loading.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set DC Resistance Loading.vi"/>
				<Item Name="C63800 Set DC Voltage of CV.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set DC Voltage of CV.vi"/>
				<Item Name="C63800 Set Fall Slew Rate of CC.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Fall Slew Rate of CC.vi"/>
				<Item Name="C63800 Set Fall Slew Rate of CR.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Fall Slew Rate of CR.vi"/>
				<Item Name="C63800 Set Frequency of DC Rectified.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Frequency of DC Rectified.vi"/>
				<Item Name="C63800 Set Ip(max) of AC.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Ip(max) of AC.vi"/>
				<Item Name="C63800 Set Ip(max) of DC.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Ip(max) of DC.vi"/>
				<Item Name="C63800 Set Irms(max) In AC CR.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Irms(max) In AC CR.vi"/>
				<Item Name="C63800 Set Load Mode.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Load Mode.vi"/>
				<Item Name="C63800 Set Load Short Circuited.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Load Short Circuited.vi"/>
				<Item Name="C63800 Set Load State.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Load State.vi"/>
				<Item Name="C63800 Set LS of AC Inrush.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set LS of AC Inrush.vi"/>
				<Item Name="C63800 Set Ls of AC RLC.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Ls of AC RLC.vi"/>
				<Item Name="C63800 Set Maximum AC Power Loading.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Maximum AC Power Loading.vi"/>
				<Item Name="C63800 Set Maximum RMS Current.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Maximum RMS Current.vi"/>
				<Item Name="C63800 Set Peak Current Meas Hold.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Peak Current Meas Hold.vi"/>
				<Item Name="C63800 Set PF of AC RLC.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set PF of AC RLC.vi"/>
				<Item Name="C63800 Set PF of AC.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set PF of AC.vi"/>
				<Item Name="C63800 Set Phase of AC Inrush.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Phase of AC Inrush.vi"/>
				<Item Name="C63800 Set Power of AC RLC.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Power of AC RLC.vi"/>
				<Item Name="C63800 Set Resistance Loading.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Resistance Loading.vi"/>
				<Item Name="C63800 Set Rise Slew Rate of CC.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Rise Slew Rate of CC.vi"/>
				<Item Name="C63800 Set Rise Slew Rate of CR.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set Rise Slew Rate of CR.vi"/>
				<Item Name="C63800 Set RL of AC Inrush.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set RL of AC Inrush.vi"/>
				<Item Name="C63800 Set RL of AC RLC.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set RL of AC RLC.vi"/>
				<Item Name="C63800 Set RMS Current.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set RMS Current.vi"/>
				<Item Name="C63800 Set RS of AC Inrush.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set RS of AC Inrush.vi"/>
				<Item Name="C63800 Set RS of AC RLC.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set RS of AC RLC.vi"/>
				<Item Name="C63800 Set SYNC State of DC Rectified.vi" Type="VI" URL="/&lt;instrlib&gt;/C63800/C63800.llb/C63800 Set SYNC State of DC Rectified.vi"/>
				<Item Name="C63800.dll" Type="Document" URL="/&lt;instrlib&gt;/C63800/C63800.dll"/>
			</Item>
			<Item Name="user.lib" Type="Folder">
				<Item Name="1D Array to String__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/string/string.llb/1D Array to String__ogtk.vi"/>
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
				<Item Name="Write Section Cluster__ogtk.vi" Type="VI" URL="/&lt;userlib&gt;/_OpenG.lib/variantconfig/variantconfig.llb/Write Section Cluster__ogtk.vi"/>
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
				<Item Name="IviACPwr Configure Output Enabled.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviacpwr/_IviACPwr.llb/IviACPwr Configure Output Enabled.vi"/>
				<Item Name="IviACPwr Fetch Measurement [MSR].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviacpwr/_IviACPwr.llb/IviACPwr Fetch Measurement [MSR].vi"/>
				<Item Name="IviACPwr Initiate Measurement [MSR].vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviacpwr/_IviACPwr.llb/IviACPwr Initiate Measurement [MSR].vi"/>
				<Item Name="IviACPwr IVI Error Converter.vi" Type="VI" URL="/&lt;vilib&gt;/ivi/iviacpwr/_IviACPwr.llb/IviACPwr IVI Error Converter.vi"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_LVConfig.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/config.llb/NI_LVConfig.lvlib"/>
				<Item Name="NI_MABase.lvlib" Type="Library" URL="/&lt;vilib&gt;/measure/NI_MABase.lvlib"/>
				<Item Name="NI_Matrix.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/Matrix/NI_Matrix.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
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
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="usereventprio.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/usereventprio.ctl"/>
				<Item Name="Wait at Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Wait at Rendezvous.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
			</Item>
			<Item Name="Functions.lvlib" Type="Library" URL="../../FGen/MemberClasses/Functions.lvlib"/>
			<Item Name="IviACPwr_ni.dll" Type="Document" URL="IviACPwr_ni.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
