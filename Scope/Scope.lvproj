<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="14008000">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.Project.Description" Type="Str"></Property>
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
			<Item Name="Sphinx" Type="Folder">
				<Item Name="index.rst" Type="Document" URL="../documentation/Sphinx/Source/index.rst"/>
				<Item Name="license.rst" Type="Document" URL="../documentation/Sphinx/Source/license.rst"/>
				<Item Name="moduleAppendix.rst" Type="Document" URL="../documentation/Sphinx/Source/moduleAppendix.rst"/>
				<Item Name="Scope_API.rst" Type="Document" URL="../documentation/Sphinx/Source/Scope_API.rst"/>
			</Item>
			<Item Name="errors.docx" Type="Document" URL="../documentation/errors.docx"/>
			<Item Name="errors.rst" Type="Document" URL="../../doc/sphinx/source/errors.rst"/>
			<Item Name="IVI-4.1_Scope_2016-10-14.pdf" Type="Document" URL="../documentation/IVI-4.1_Scope_2016-10-14.pdf"/>
		</Item>
		<Item Name="ScopeModule.lvlib" Type="Library" URL="../ScopeModule/ScopeModule.lvlib"/>
		<Item Name="ScopePlugins.lvlib" Type="Library" URL="../ScopePlugins/ScopePlugins.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="instr.lib" Type="Folder">
				<Item Name="Agilent 90000 Series.lvlib" Type="Library" URL="/&lt;instrlib&gt;/Agilent 90000 Series/Agilent 90000 Series.lvlib"/>
				<Item Name="niScope acquisition type.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope acquisition type.ctl"/>
				<Item Name="niScope Close.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/niScope Close.vi"/>
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
				<Item Name="niScope Initiate Acquisition.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Acquire/Fetch/niScope Initiate Acquisition.vi"/>
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
				<Item Name="niScope polarity.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope polarity.ctl"/>
				<Item Name="niScope signal format.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope signal format.ctl"/>
				<Item Name="niScope timestamp type.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope timestamp type.ctl"/>
				<Item Name="niScope trigger coupling.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope trigger coupling.ctl"/>
				<Item Name="niScope trigger slope.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope trigger slope.ctl"/>
				<Item Name="niScope trigger source digital.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope trigger source digital.ctl"/>
				<Item Name="niScope trigger source.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope trigger source.ctl"/>
				<Item Name="niScope trigger window mode.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope trigger window mode.ctl"/>
				<Item Name="niScope tv event.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope tv event.ctl"/>
				<Item Name="niScope vertical coupling.ctl" Type="VI" URL="/&lt;instrlib&gt;/niScope/Controls/niScope vertical coupling.ctl"/>
			</Item>
			<Item Name="user.lib" Type="Folder">
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
				<Item Name="Binary to Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDT.llb/Binary to Digital.vi"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Compress Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDT.llb/Compress Digital.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Create New Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Create New Rendezvous.vi"/>
				<Item Name="Create Rendezvous.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/rendezvs.llb/Create Rendezvous.vi"/>
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
				<Item Name="DWDT Binary U8 to Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Binary U8 to Digital.vi"/>
				<Item Name="DWDT Binary U16 to Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Binary U16 to Digital.vi"/>
				<Item Name="DWDT Binary U32 to Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Binary U32 to Digital.vi"/>
				<Item Name="DWDT Compress Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Compress Digital.vi"/>
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
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_LVConfig.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/config.llb/NI_LVConfig.lvlib"/>
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
			<Item Name="ivi.dll" Type="Document" URL="ivi.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="IviScope.dll" Type="Document" URL="IviScope.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="niScope_32.dll" Type="Document" URL="niScope_32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
