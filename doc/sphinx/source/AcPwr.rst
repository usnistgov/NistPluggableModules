###############
AC Power Plugins
###############
*************************
Class Specification
*************************

ChromaAcLoadClass
=================

The Chroma AC load support one phase per device so multiple devises must be used to create multiple phases. One Module can support up to three devices 
so with a single module all three phases can be emulated. The IVI AC Power specification does not (yet) peovide an extension group for AC Loads but it seems to make sense to extend it.  Eventually this child class may become a base class for generic AC loads.

|image1|

Properties
---------------
Load \: [struct]
  An array of structures containing the properties used for each Load Device
  
	AC/DC \: bool
	  Specifies the device for AC or DC loading
	  
	Mode \: enum (CC, CP, CR, CV, RLC, Inrush, Rect)
           Specifies the load mode:
		CC = constant current,
		CP = Constant Power,
		CR = Constant Resistance,
		CV = Constant Voltage (DC loading only),
		RLC = Resistance, Inductance, Capacitance (AC loading only),
		Inrush = RLC Inrush Current (AC only),
		Rect = Rectified (DC only).
		
	
	CrestFactor \: double
	   Specifies the load crest factor, meaning of this varies in different modes.
	   
        PowerFactor \: double
	   Specifies the power factor of AC loading.  Essentially this is the phase relationship between the voltage and current.
	   
	Priority \: enum
	    Sets CrestFactor / PowerFactor Priority:
		CF = Crest Factor Priority
		PF = Power Factor Priority
		both (CF) = Both have priority with CrestFactor preferred
		both (PF) = Both have priority with PowerFactor preferred
	
	PowerLoading :\ double
	    Specifies the AC power consumption of the load in Watts

	IpeakMax \: double
		Specifies the maximum peak current that the load will accept
			
	
	Slew \: struct
	    Specifies the rise and fall times of changing properties in the load.
	    
		RiseSlewRate \: double
			Specifies the rising rate of the property depending on Mode
			
		FallSlewRate \: double
			Specifies the falling rate of the property depending on Mode

			
	Resistance :\ double
		Specifies the resistance of the DC load in ohms.  when in CR mode, the Rise and Fall slew times will specify how quickly the resistance will change when this property changes.
		
	LC :\ struct
		A structure containing the Inductive / capacitive properties of the load
		
		C :math:`(\mu F)` \: double
			Specifies the Capacitance when in AC RLC mode
			
		L :math:`(\mu H)` \: double
			Specifies the Inductance when in AC RLC mode
			
		RL(ohm) \: double
			Specifies the (inductive) impedance in AC RLC mode
			
		RS(ohm) \: double
			Specifies the (capacitive) impedance in AC RLC mode
			
	Wave \: enum
		Specifies the wave polarity
			Pos,
			Neg,
			Both,
			
	LineSync \: bool
		True if the load is to be synchronized to the line input.

LoadShortCircuited \: bool
	Specifies that the load is in the short circuited mode.
	   
Timing \: struct
	Single structure defines the timing of all phases
	
	TimingOn :\ enum
		Specifies the timing mode for all phases 
			Holdup,
			Off,
			Transfer
	
	Hours \: uint32
		
	Minutes \: uint32
		
	Seconds \: double
		
	CutoffVoltage \: double
		
	   
Methods
--------

CheckHandle()
	Check to see if the input handle is already connected. 

CheckSettings
	Checks the value of the instrument settings and returns an error if the value is outside the instruments range. 

ChromaProtectionStatus()
	Retrieves a string status from the Chroma indicating any measurment errors. 

ConvertStatus()
	Converts the instruments numerical status into a string status. 

DisableControls
	disables the controls in the phases cluster based on the Configuration Mode control. This will enable the user to only change the values of the controls that are allowed by that mode.  
	
NumOfPhases
	Checks the number of phases and ensures it is less than or equal to three. 
	
SupportedMeasurementType
	Checks if the Measurment Type(s) selected is capable by the instrument based on the current instruments configuration. 
	
VariantToProperties
	Extracts the PluginConfigVariant, PluginMeasVariant, and Measurement Refersh Time. Converts PluginConfigVariant and PluginMeasVariant into the Configuration and Measurement Cluster. 
	
WriteToBaseConfigVariant
	Writes to the PluginConfigVariant and the PluginMeasVariant properties.  


NHRDCPowerClass
=================

The NHRDCPower device is a three channel DC Output. One Module supports multiple devices thus multiple channels can be emulated within a single module.

NHRRegenerativeGridSimulator
============================

The NHR Regenerative Grid Simulator is a three channel AC/DC Output that can be combined into any combination between one and three channels. A single module can  

PacificPowerSource
==================

The Pacif Power 360AMXT is a three channel AC Souurce that supports combining all three channels into one channel or being combined into a split phase operation.

***************
AcPwr Plugin Properties
***************

The classes (ChromaAcLoad, NHRDCPower, NHRGridSim, and PacificPowerSource) listed below inherit all the modules and properties from the AcPwr Base Class. 

ChromaAcLoad.lvclass
====================

*The following section lists the properties and operational mode of the AC/DC Chroma Load (638xx). Each mode uses a set of properties that are similar and distinct from the rest. If a variable is listed under an operation mode, it must be configured in order for the Chroma to operate. **The load should be appropriately configured for the physically wiring and the source connected**. 

|image2|

*This is the preference dialogue screen that allows the user to configure the device.*


	- Disable Controls Based On Configuration Mode?: A property that allows the disables various properties based on the value of the configuration variable. 
	- Device(s)Settings: A collection of properties that allow a user to control the instrument. 
		- Configuration Mode: The operation modes of the device. The user must be careful to select an appropriate current type or the device will fail to configure.
			- Constant Voltage (DC): The device attempts to operate as a constant voltage load.
			- Constant Power (DC): The device attempts to operate at a constant DC power.
			- Constant Power (AC): The device attempts to match the value of the RMS current to an amount specified by the user
			- Constant Current (DC): The device attempts to operate at a constant DC current.
			- Constant Current (AC): The device attempts to match the value of the RMS power to an amount specified by the user.
			- Constant Resistance (DC): The device attempts to emulate a resistor with a constant value
			- Constant Resistance (AC): The device attempts to emulate a resistor with a constant value
			- Rectified Mode (DC): The device converts a DC signal into an AC output.
			- Inrush (AC): **Note**: Measuring the inrush current of the device is tricky, seeing as the mode quickly turns off. In order to perform measurements on this device, the user is recommended to use the *Set Peak Current Meas Hold* vi with the input set to *true*, then using the *Measure or Fetch Peak Current* vi.
			- RLC CP (AC): The load emulates an RLC circuit operating a constant RMS power. An inductor is in series and a capacitor is in parallel.
			- RLC (AC): The load emulates an RLC circuit, with an inductor in series and a capacitor in parallel.
		- MeasName: Every measurement from this module will be labeled with the value entered into this variable. 
		- Phases: A cluster of properties that determines the properties of each phase. 
			- Handle: The name of the insturment with which software can use to connect and control the instrument. 
			- Name: A distinct software name that an operator may use to distinguish instruments. 
			- Phase Select: Determines the phase of the instrument
			- Instrument Options: Allows for instrument initializations commands such as simulation (Simulation=0).
			- id query: If set to true queries the instrument ID and checks that it is valid for this instrument driver. 
			- reset device: Sends a software command that reinitializes the device 
			- Load Short Circuited: The instrument shorts its input.
			- Line Synchronization: In Rectified mode this Boolean when set to true uses the measured input frequency as the reference loading frequency.  
			- Load Current: The current the instrument will try to sink.   
			- Load Voltage: The voltage the instrument will try to sink. 
			- Load Power: The Power that the instrument will try to sink. 
			- Load Resistance: The input resistance set at the instruments' input. 
			- Load Current Peak Limit: A user defined limit where the instrument will throw an error if the measurements exceed the value.
			- Load Current Limit: A user defined limit that allows the instrument to return an error if the current measurement exceeds the set value.
			- Load Power LImit: A user defined limit that allows the instrument to return an error if the Power measurements exceeds the set value. 
			- Synch Frequency: In Rectified Mode and if the Boolean is set to false the synch frequency must be set to the expected input frequency.  
			- Priority: Determines if the the instrument should optimize. for the crest factor or the power factor. 
			- Crest Factor: The instrument will try to establish a ration such that the value set = Peak Current/ RMS Current.
			- Power Factor: The instrument will try to establish a ratio such that the value set = Real Power/Apparent Power. 
	- Measurements: A collection of properties that allow user to control the instuments measurements. 
		- Handle: The name of the instrument and channel with which the software will use to collect measurements. 
		- Name: A distinct software name that an operator may use to distinguish instruments and/or channels.
		- Enabled: This property determines if the measurement data is acquired or not. 
		- Measurement Type: A property that determines what type of measurement the instrument will report back.  
			-Voltage
			-Current
			-Power
			-Peak Voltage
			-Peak Current
			-Peak Power
			-Frequency
			-Resistance
			-Voltage Overshoot
			-Positive Peak Current
			-Voltage Undershoot
			-Negative Peak Current
			-Apparent Power
			-Reactive Power
			-Voltage THD
			-Power Factor
			-Current's Crest Factor
		- Hold Peak Current Measurment: This property allows the instrument to return the value based on magnitude. It is only
		- Fetch/Read: A property that determines how the measurement is taken. 
	- Measurement RefreshTime: The time in milliseconds to wait between the instruments' measurements.
	- Cancel: Closes the window and discards any changes to the settings
	- Save: Closes the panel and saves these settings to an INI file. 
	- Save As: Closes the panel and saves these settings to a different INI file in the same file location. 		

NHRDCPower.lvclass
===================

*The following section lists the user accessible properties of the NHR 9200 DC Battery Test System.*

|image3|

*This is the preference dialogue screen that allows the user to configure the device.*

	- Device(s)Settings: A collection of properties that allow a user to control one or multiple instrument. 
		- MeasName: Every measurement from this module will be labeled with the value entered into this variable. 
		- Modules: A collection of properties that allows for the control of one or multiple instruments. 
			- Handle: The name of the insturment with which software can use to connect and control the instrument.
			- Name: A distinct software name that an operator may use to distinguish instruments.
			- id query: If set to true queries the instrument ID and checks that it is valid for this instrument driver.
			- reset device: If this property is true a command is sent to the device 
			- Options String: Allows for instrument initializations commands such as simulation (Simulation=0).
			- Operating State: The operation modes of the device. The user must be careful to select an appropriate current type or the device will fail to configure.
				- Off - The module is off when in the Stand-by state, providing no voltage, current, power or resistance.
				- Stand By - The module is off when in the Stand-by state, providing no voltage, current, power or resistance.
				- Charge - The module acts as a Source where the Voltage property control the output voltage, and the Current, Power and Resistance properties define the operating limits.
				- Discharge - The module acts as a Load, where the Voltage, Current, Power and Resistance values concurrently control the state of the module - the mode drawing the least amount of current being the dominant mode.
				- Battery Emulation - The module acts as a Battery, where it sinks or sources current automatically based on the sensed voltage. Use the Voltage, Current, Power and Resistance fields to configure the behavior of the emulated battery.
			- Initial Battery Detect Voltage: A property that sets the initial voltage which the instrument must see at its outpu before it begins to source or sink current. 
			- Aperture Time: A property that set the maximum window with which the instrument is allowed to gather measurements before it returns. The instruments is always acquiring data at the maixmum rate. This property determines the amount of time 
			- Regulation Gain: This property sets the distance the output will try to move when the set value does not equal the measurement value. 
			- OutputSettings: A collection of properties that determines the ouput values of the instrument. Additional values in the array are ignored unless the Enable Macro Property is set to true. 
				-Enable Voltage: This property configures the instrument to set the voltage output or input. 
				-Voltage: If the Enable Voltage property is set to true the value of this property is used to set the maximum value. 
				-Enable Current: This property configures the instrument to set the current output or input. 
				-Current: If the Enable Voltage property is set to true the value of this property is used to set the maximum value.
				-Enable Resistance: This property configures the instrument to set the resistance output or input.
				-Resistance: This property sets the value of the sereies output resistance.
				-Enable Power: This property configures the instrument to set the power output or input. 
				-Power: If the Enable Power property is set to true the value of this property is used to set the maximum value. 
				-Enable Wait: This property enables the instrument to wait to set an output value until a certain conditions is met. 
				-Wait Value: If the Enable Wait property is set to true the value of this property is used to set the threshold value a measurement must cross before setting the output value.
				-Wait On Value: If the Enable Wait property is set to true the value this property allows the sets the conditions for the wait. 
					-Voltage Greater Than or Equal To
					-VOltage Less Than or Equal To
					-Current Greater Than or Equal To
					-Current Less THan or Equal To
					-Power Greater Than or Equal To
					-Power Less Than Or Equal To
				-Macro After Step Delay: This property allows the uer to set a time delay in seconds after each step.
			- SlewRate
				-Set Voltage Rate V/S
				-Set Current Rate A/S
				-Set Resistance Rate R/S
				-Set Power Rate W/S
			- SafetySettings: A cluster of properties used to set the instruments parameters that will prevent damage to the instrument or any external devices connected to it. 
				-SetWatchDog: 
				-Voltage: This property sets the maximum voltage value that the insturment will source or sink. If the measurement value exceeds this value longer than the VoltageDelay property the output will enter a high impedance state. 
				-VoltageDelay: This property sets the amount of time the measured voltage is allowed to exceed the Voltage Safety Property before the ouptut goes into a high impedance state. 
				-Current: This property sets the maximum current value that the insturment will source or sink. If the measurement value exceeds this value longer than the PowerDelay property the output will enter a high impedance state.
				-CurrentDelay: This property sets the amount of time the measured current is allowed to exceed the Current Safety Property before the ouptut goes into a high impedance state. 
				-Power: This property sets the maximum power value that the insturment will source or sink. If the measurement value exceeds this value longer than the PowerDelay property the output will enter a high impedance state.
				-PowerDelay: This property sets the amount of time the measured power is allowed to exceed the Power Safety Property before the ouptut goes into a high impedance state. 
			- Macro
				-UseMacros?: Set this property to true in order to enable the use of multiple Output Settings to control the instrument.
				-RunMacroContinuously?: Set this property to true in order to have multiple output settings repeated for an infinite number of times. 
				-LoadMacroFromFile?: Set this property to true in order to load a set of instructions from a location on disk. 
				-LoadMacroFilePath: The location on disk that the instructions will be loaded from if the Load Macro From File? property is set to true. 
				-SaveMacro: Set this property to true to save the current macro to a file. 
				-SaveMacroFilePath: The location on disk that the current configured set of instruction will be 
	- Measurements: A collection of properties that allow user to control the instuments measurements.
		- Handle: The name of the instrument and channel with which the software will use to collect measurements.
		- Name: A distinct software name that an operator may use to distinguish instruments and/or channels.
		- Enabled: This property determines if the measurement data is acquired or not.
		- Measurement Type: A property that determines what type of measurement the instrument will report back.
			-Power
			-Voltage
			-Current
	
	- Measurement RefreshTime: The time in milliseconds to wait between the instruments' measurements.
	- Cancel:Closes the window and discards any changes to the settings
	- Save:Closes the panel and saves these settings to an INI file. 
	- Save As:Closes the panel and saves these settings to a different INI file in the same file location. 


NHRGridSim.lvclass
===================
The following section lists every user accesible property of the NHR 9210 AC/DC RegenerativeGrid Simulator. 

|image4|

*This is the preference dialogue screen that allows the user to configure the device.*

	- Device(s)Settings: A collection of properties that allow a user to control the instrument. 
		- MeasName: Every measurement from this module will be labeled with the value entered into this property. 
		- Modules: 
			- Handle: The name of the insturment with which software can use to connect and control the instrument.
			- id query:  If set to true queries the instrument ID and checks that it is valid for this instrument driver.
			- reset:  
			- Initialize Timeout
			- Regulation Gain
			- Phases
				-Phase Name
				-Pout
				-Vout
				-Iout
				-PhaseAngle
			- Mode: 
				-One 3-Phase AC
				-One AC
				-One DC
				-Three AC
				-Three DC
				-One 2-Phase AC and One AC
				-One 2-Phase AC and One DC
				-Two AC
				-One AC and One DC
				-Two AC and One DC
				-Two AC and One DC
				-One AC and Two DC
				-One DC and One AC
				-Two DC

			- Measurement: 
				-Aperture Length
				-NumberOfSamples
				
			- Ranges: 
				-Irange
				-Vrange
			- Phase: 
			- TransformerRatio: 
			- FreqOut: 
			- Grid: 
			- WatchDog: 
				-Enable WatchDog
				-Robust WatchDog
				-Watchdog Interval

			- SafteyLimits: 
				-Min Voltage 
				-Min Voltage Time
				-Max Voltage
				-MaxVoltage Time
				-Max Sink Power
				-Max Sink Power Time
				-Max Source Power
				-Max Source Power Time
				-Max Sink Amps
				-Max SInk Amps Time
				-Max Source Amps
				-Max Source Amps Time
				-Peak Voltage
				-Peak Voltage Enable
				-Peak Amps
				-Peak Amps Enable
		
	- Measurements: A collection of properties that allow user to control the instuments measurements.
		- Handle: The name of the instrument and channel with which the software will use to collect measurements.
		- Name: A distinct software name that an operator may use to distinguish instruments and/or channels.
		- Enabled: This property determines if the measurement data is acquired or not.
		- Phase: This property sets the measurement to acquire from the selected phase. 
		- Measurement Type: A property that determines what type of measurement the instrument will report back.
			-Average Current
			-Average Voltage
	
	- Measurement RefreshTime (ms):The time to wait between the instruments' measurements.
	- Cancel:Closes the window and discards any changes to the settings
	- Save:Closes the panel and saves these settings to an INI file. 
	- Save As:Closes the panel and saves these settings to a different INI file in the same file location. 

Mode
-----------------

*The following variables are used by every operation mode*

	- Mode: The operation modes of the device. The user must be careful to select an appropriate mode that matches the physical configuration the instrument is currently configured for and the type of loads connected to the instrument. 
|image6|
*These are the various modes of the NI 9410 Regenrative Grid Simulator.* 

PacificPowerSource.lvclass
==========================
*The following section lists every user accesible property of the PPS360AMXT Pacific Power Supply.* 

|image5|

*This is the preference dialogue screen that allows the user to configure the device.*

	- Device(s)Settings: A collection of properties that allow a user to control the instrument. 
		- MeasName: Every measurement from this module will be labeled with the value entered into this property. 
		- Modules: A cluster of properties that determines the properties of each instrument.
			- Handle: The name of the insturment with which software can use to connect and control the instrument.
			- Clear Device: 
			- Transient Execution:
			- ID Query: If set to true queries the instrument ID and checks that it is valid for this instrument driver.
			- Reset:
			- Impedance Parameters:
				-State:
				-Impedance:
			- Port Type:
			- Program #:
				-Program Number:
				-Form:
				-Coupling:
				-Frequency:
				-Current Limt:
				-Voltage Level:
				-Waveform A:
				-Voltage Level:
				-Waveform B:
				-Phase B:
				-Voltage Level:
				-Waveform C:
				-Phace C:
			- Source Range:
				-Range Control:
				-Voltage Maximum:
				-Voltafe Minimum:
				-Initial Voltage:
				-Frequency Range:
				-Frequency Maximum: 
				-Frequency Minimum: 
	- Measurements: A collection of properties that allow user to control the instuments measurements.
		- Handle: The name of the instrument and channel with which the software will use to collect measurements.
		- Name: A distinct software name that an operator may use to distinguish instruments and/or channels.
		- Enabled: This property determines if the measurement data is acquired or not.
		- Channel Name: This property sets the measurement to acquire from the selected internal channel name. 
		- Measurement Type:  A property that determines what type of measurement the instrument will report back.
			-Voltage RMS L-N
			-Voltage RMS L-L
			-Frequency
			-Current RMS
			-Current Peak
			-Crest Factor
			-Power Factor
			-Power VA
			-Real Power
	- Measurement RefreshTime: The time to wait between the instruments' measurements.
	- Cancel: Closes the window and discards any changes to the settings
	- Save: Closes the panel and saves these settings to an INI file. 
	- Save As: Closes the panel and saves these settings to a different INI file in the same file location. 

Form
-----------------

*The following variables are used by every operation mode*

	- One - Output is taken from a single channel Phase A. 
	- Split - Output is taken from two channels Phase A and B. 
	- Three - Output is taken from all three channels Phase A, B, and C. 
|image7|

************
Code Design
************

Miscellaneous
=============

Recommended Improvements
------------------------
-The project currently has a "load short circuited variable" that is not wired up to anything. There's a VI that can use this variable, but it seemed more appropriate to attach this VI to a separate call, rather than the "Config device" call. 

******************
Code Almanac
******************

AcPwrModule.lvlib
=================

Private
-------



AcPwrClass vi
^^^^^^^^^^^^^
The AcPwrClass vi acts as a general control for the "Main" module.
	
	+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
	| **TERMINAL**|	**PURPOSE**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
	+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|Class In     | Wiring a class into this terminal allows the user to directly override the current class properties of the cloned module.                                                                                                                                                                                                                                                                                                                                                                                          |
	+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|Class Out    | By accessing this terminal, the user can access the class properties of the cloned module. This is the only way the main module has to access its class properties.                                                                                                                                                                                                                                                                                                                                                |
	+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|Set? (F)     | This terminal determines whether the module saves the properties of the *Class In* terminal to the class or not. By default (false), the properties are not saved; this terminal must be set to true in order for a save to occur.                                                                                                                                                                                                                                                                                 |
	+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
	

AcPwrState.vi
^^^^^^^^^^^^^

The AcPwrState vi acts as a way to control the measurements of the device.
	
	+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
	| **TERMINAL**|	**PURPOSE**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
	+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|State In     | Wiring a string variable into this terminal allows the user to control the state of the module's measurement. The string *must* match one of the measurement statuses described in the *Measurements SSM*, otherwise the module will default to the *Idle* state.                                                                                                                                                                                                                                                  |
	+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|State Out    | Outputs a string with a value indicating the status of the module's measurements. The string *should* match one of the measurement statuses described in the *Measurements SSM*, and are sometimes used to control the logic flow of the module.                                                                                                                                                                                                                                                                   |
	+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|Set?         | This terminal determines whether the string input to the *State In* terminal is saved and used to control the state of the measurements loop. By default (false), the value is ignored; the value must be set for true in order for the input to be utilized.                                                                                                                                                                                                                                                      |
	+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
	


.. |image0| image:: images/AcPwr/image0.png
   :width: 3in

.. |image1| image:: images/AcPwr/image1.png
   :width: 3in

.. |image2| image:: images/AcPwr/image2.png
   :width: 9in

.. |image3| image:: images/AcPwr/image3.png
   :width: 9in	

.. |image4| image:: images/AcPwr/image4.png
   :width: 9in	
   
.. |image5| image:: images/AcPwr/image5.png
   :width: 9in	   
   
.. |image6| image:: images/AcPwr/image6.png
   :width: 9in	
   
.. |image7| image:: images/AcPwr/image7.png
   :width: 9in	