<?xml version='1.0' encoding='UTF-8'?>
<Library LVVersion="14008000">
	<Property Name="NI.Lib.FriendGUID" Type="Str">a336cace-34bf-43de-b2ad-0a770771b810</Property>
	<Property Name="NI.Lib.Icon" Type="Bin">&amp;!#!!!!!!!)!"1!&amp;!!!-!%!!!@````]!!!!"!!%!!!(^!!!*Q(C=\&gt;8"&lt;2MR%!813:"$A*T51;!7JA7VI";G"6V^6!P4AFJ1#^/#7F!,TN/'-(++=IC2(-TVS+O`80+:3[QDNP9VYEO]0GP@@NM_LD_\`K4&amp;2`NI`\;^0.WE\\ZH0]8D2;2'N3K6]:DK&gt;?1D(`H)2T\SFL?]Z3VP?=N,8P+3F\TE*5^ZSF/?]J3H@$PE)1^ZS*('Z'/C-?A99(2'C@%R0--T0-0D;QT0]!T0]!S0,D%]QT-]QT-]&lt;IPB':\B':\B-&gt;1GG?W1]QS0Y;.ZGK&gt;ZGK&gt;Z4"H.UQ"NMD:Q'Q1DWM6WUDT.UTR/IXG;JXG;JXF=DO:JHO:JHO:RS\9KP7E?BZT(-&amp;%]R6-]R6-]BI\C+:\C+:\C-6U54`%52*GQ$)Y1Z;&lt;3I8QJHO,R+YKH?)KH?)L(J?U*V&lt;9S$]XDE0-E4`)E4`)EDS%C?:)H?:)H?1Q&lt;S:-]S:-]S7/K3*\E3:Y%3:/;0N*A[=&lt;5+18*YW@&lt;,&lt;E^J&gt;YEO2U2;`0'WJ3R.FOM422L=]2[[,%?:KS(&amp;'PR9SVKL-7+N1CR`LB9[&amp;C97*0%OPH2-?Y_&lt;_KK,OKM4OKI$GKP&gt;I^&lt;`X,(_`U?N^MNLN&gt;L8#[8/*`0=4K&gt;YHA]RO&amp;QC0V_(\P&gt;\OUV].XR^E,Y_6Z[=@YH^5\`3`_$&gt;W.]DF`(N59`!/&lt;!-PQ!!!!!</Property>
	<Property Name="NI.Lib.SourceVersion" Type="Int">335577088</Property>
	<Property Name="NI.Lib.Version" Type="Str">1.0.0.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">false</Property>
	<Item Name="Friends List" Type="Friends List">
		<Item Name="NISTBus.lvlib:NISTBus.lvclass" Type="Friended Library" URL="../NISTBus.lvclass"/>
		<Item Name="Bus.lvlib" Type="Friended Library" URL="../../Bus/Bus.lvlib"/>
	</Item>
	<Item Name="FrontPanel" Type="Folder">
		<Item Name="TypeDefs" Type="Folder">
			<Item Name="clFrontPanelControlRefs.ctl" Type="VI" URL="../FrontPanel/TypeDefs/clFrontPanelControlRefs.ctl"/>
		</Item>
		<Item Name="ClrArbWfrmRequest.vi" Type="VI" URL="../FrontPanel/ClrArbWfrmRequest.vi"/>
		<Item Name="ConfigWaveformRequest.vi" Type="VI" URL="../FrontPanel/ConfigWaveformRequest.vi"/>
		<Item Name="CreateWaveformRequest.vi" Type="VI" URL="../FrontPanel/CreateWaveformRequest.vi"/>
		<Item Name="InitializeRequest.vi" Type="VI" URL="../FrontPanel/InitializeRequest.vi"/>
		<Item Name="LoadNISTFGenPluginRequest.vi" Type="VI" URL="../FrontPanel/LoadNISTFGenPluginRequest.vi"/>
		<Item Name="LoadNISTWfrmPluginRequest.vi" Type="VI" URL="../FrontPanel/LoadNISTWfrmPluginRequest.vi"/>
		<Item Name="NewBusNumber.vi" Type="VI" URL="../FrontPanel/NewBusNumber.vi"/>
		<Item Name="RemoveOldBusNumber.vi" Type="VI" URL="../FrontPanel/RemoveOldBusNumber.vi"/>
		<Item Name="ResetRequest.vi" Type="VI" URL="../FrontPanel/ResetRequest.vi"/>
		<Item Name="SendWaveformRequest.vi" Type="VI" URL="../FrontPanel/SendWaveformRequest.vi"/>
		<Item Name="SetOutputEnableRequest.vi" Type="VI" URL="../FrontPanel/SetOutputEnableRequest.vi"/>
		<Item Name="SetTriggerRequest.vi" Type="VI" URL="../FrontPanel/SetTriggerRequest.vi"/>
		<Item Name="UpdateBusFromFrontPanel.vi" Type="VI" URL="../FrontPanel/UpdateBusFromFrontPanel.vi"/>
	</Item>
	<Item Name="Init" Type="Folder">
		<Item Name="TypeDefs" Type="Folder">
			<Item Name="clFrameworkData.ctl" Type="VI" URL="../Init/TypeDefs/clFrameworkData.ctl"/>
		</Item>
		<Item Name="GetSetFrameworkData.vi" Type="VI" URL="../Init/GetSetFrameworkData.vi"/>
		<Item Name="InitBusNumber.vi" Type="VI" URL="../Init/InitBusNumber.vi"/>
		<Item Name="InitFrontPanel.vi" Type="VI" URL="../Init/InitFrontPanel.vi"/>
	</Item>
	<Item Name="Log" Type="Folder"/>
	<Item Name="MsgQueue" Type="Folder">
		<Item Name="TypeDef" Type="Folder">
			<Item Name="MsgQueue.ctl" Type="VI" URL="../MsgQueue/TypeDef/MsgQueue.ctl"/>
			<Item Name="QueRef.ctl" Type="VI" URL="../MsgQueue/TypeDef/QueRef.ctl"/>
		</Item>
		<Item Name="Dequeue.vi" Type="VI" URL="../MsgQueue/Dequeue.vi"/>
		<Item Name="Enqueue.vi" Type="VI" URL="../MsgQueue/Enqueue.vi"/>
		<Item Name="EnqueueError.vi" Type="VI" URL="../MsgQueue/EnqueueError.vi"/>
		<Item Name="ObtainMsgQueue.vi" Type="VI" URL="../MsgQueue/ObtainMsgQueue.vi"/>
	</Item>
	<Item Name="Run" Type="Folder">
		<Item Name="BuildRunScript.vi" Type="VI" URL="../Run/BuildRunScript.vi"/>
		<Item Name="GetScriptFromINIFile.vi" Type="VI" URL="../Run/GetScriptFromINIFile.vi"/>
	</Item>
	<Item Name="UserEvents" Type="Folder">
		<Item Name="Protected" Type="Folder">
			<Property Name="NI.LibItem.Scope" Type="Int">4</Property>
			<Item Name="Requests" Type="Folder">
				<Item Name="clRequestEvents.ctl" Type="VI" URL="../UserEvents/Protected/Requests/clRequestEvents.ctl"/>
			</Item>
			<Item Name="clUserEventType.ctl" Type="VI" URL="../UserEvents/Protected/clUserEventType.ctl"/>
		</Item>
		<Item Name="Requests" Type="Folder">
			<Item Name="ObtainRequestEvents.vi" Type="VI" URL="../UserEvents/Requests/ObtainRequestEvents.vi"/>
			<Item Name="StopRequest.vi" Type="VI" URL="../UserEvents/Requests/StopRequest.vi"/>
		</Item>
	</Item>
	<Item Name="Main.vi" Type="VI" URL="../Main.vi"/>
</Library>
