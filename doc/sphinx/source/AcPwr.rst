###############
Ac Power Module
###############

***************
Operation Modes
***************

ChromaAcLoad.lvclass
====================

The following section lists every operation mode the Ac Chroma Power Load 63800 is capable of. Each mode utilizes a different set of parameters from the rest. If a variable is listed under an operation mode, it must be configured in order for the chroma to operate. If a variable is not listed under an operation mode, its value will be ignored when configuring the device. **Failing to configure a variable properly will potentially cause the Chroma to fail without sending an error message**. 

General Variables
-----------------

*The following variables are used by every operation mode*

	- AC/DC: Whether the device operates in AC or DC. When set to *true*, the device operates in DC mode. When set to *false*, the device operates in AC mode.
		AC Modes: CC, CP, CR, RLC, RLC CP, and Inrush
		
	- Mode: The operation modes of the device. The user must be careful to select an appropriate current type or the device will fail to configure.
		- CC: Constant current. AC/DC
		- CP: Constant power. AC/DC
		- CR: Constant resistance. AC/DC
		- CV: Constant voltage. DC only
		- RLC: RLC circuit simulation. AC only
		- RLC CP: RLC circuit with constant RMS Power. AC only
		- Inrush: Measures the inrush of an RLC circuit. AC only
		- Rectified: DC rectified mode. Converts a DC signal into an AC one. DC only
		
	- Load Short Circuited: When set to true, the load short circuits itself at its input. When set to false, the load operates normally. By default, this mode should be set to *false*.

|image2|
*This is the preference dialogue screen that allows the user to configure the device.*

AC Modes
========

CC (Constant Current)
---------------------

*The device attempts to match the value of the RMS current to an amount specified by the user.*

	- ILoad: The RMS current that the device will try to emulate, in Amperes. *Range:* :math:`0 < LoadCurrent \le 36`	
	
	- Priority: Determines whether the device prioritizes the Current Factor, Power Factor, or both. If the device is prioritizing both, it will still 'prefer' one over the other.
	
	- Power Factor: The power factor of the load. *Range:* :math:`0 \le PF \le 1`
	
	- Crest Factor: The crest factor of the load. *Range:* :math:`1.414 \le` *CF* :math:`\le 5`
	
	- Current Limit: The maximum RMS current allowed through the device. *Range:* :math:`0 \le` *Max RMS Current* :math:`\le 36`
	
	- IpeakMax: The maximum peak current allowed through the device. *Range:* :math:`0 \le` *Peak Current* :math:`\le 108`

CP (Constant Power)
-------------------

*The device attempts to match the value of the RMS power to an amount specified by the user.*

	- PowerLoading: The RMS power that the load will try to consume. *Range:* 0 < *Load Power* :math:`\le 3600`
	
	- Current Limit: The maximum RMS current of the load. Also used to set the maximum RMS power of the load. *Range:* 0 < *Max RMS Current* :math:`\le 36`
	
	- Voltage Level: The voltage level of the load. This is **only** used to set the maximum RMS power of the load. *Range:* :math:`50 \le` *Voltage Level* :math:`\le 350`
	
	- Priority: Determines whether the device prioritizes the Current Factor, Power Factor, or both. If the device is prioritizing both, it will still 'prefer' one over the other.
	
	- Power Factor: The power factor of the load. *Range:* :math:`0 \le PF \le 1`
	
	- Crest Factor: The crest factor of the load. *Range:* :math:`1.414 \le` *CF* :math:`\le 5`
	
	- IpeakMax: The maximum peak current allowed through the device. *Range:* 0 < *Peak Current* :math:`\le 108`

CR (Constant Resistance)
------------------------

*The device attempts to emulate a resistor with a constant value*

	- Resistance: The resistance that the load will attempt to emulate, in :math:`\Omega`.. *Range:* :math:`1.39 \le` *Load Resistance* :math:`\le 2500`
	
	- Power Factor: The power factor of the load. *Range:* :math:`0 \le PF \le 1`
	
	- Crest Factor: The crest factor of the load. *Range:* :math:`1.414 \le` *CF* :math:`\le 5`
	
	- Current Limit: The maximum RMS current of the load. *Range:* 0 < *Max RMS Current* :math:`\le 36`
	
RLC
---

*The load emulates an RLC circuit, with an inductor in series and a capacitor in parallel.*

	- RS: The series resistance of the system in :math:`\Omega`. *Range:* 0 :math:`\le` *Series Resistance* :math:`\le 9.999`
	
	- RL: The parallel resistance of the system in :math:`\Omega`. *Range:* 1.39 :math:`\le` *Parallel Resistance* :math:`\le 9999.99`
	
	- LS: The inductance of the system in :math:`\mu H`. *Range*: 0 :math:`\le` *Series Inductance* :math:`\le` 9999

	- C: The capacitance of the system in :math:`\mu F`. *Range*: 100 :math:`\le` *Parallel Capacitance* :math:`\le` 9999
		
RLC CP
------
*The load emulates an RLC circuit operating a constant RMS power. An inductor is in series and a capacitor is in parallel.*

	- Power Loading: The RMS power that the device will try to maintain, in Watts. *Range:* 200 :math:`\le` *Load Power* :math:`\le` 3600 
	
	- Power Factor: The power factor of the system. *Range:* 0.4 :math:`\le` *Power Factor* :math:`\le` 0.75
	
	- Current Limit: The maximum RMS current of the system. *Range:* 0 < *Max RMS Current* :math:`\le` 36
	
*Special*: Trying to set the maximum peak current of the system using RLC CP causes the chroma to cease functionality, but will not send an error message.

Inrush
------

**Note**: Measuring the inrush current of the device is tricky, seeing as the mode quickly turns off. In order to perform measurements on this device, the user is recommended to use the *Set Peak Current Meas Hold* vi with the input set to *true*, then using the *Measure or Fetch Peak Current* vi.

	- IpeakMax: The maximum peak current of the system. *Range: Max Peak Current* :math:`\le` 160
	
	- RS: The series resistance of the system in :math:`\Omega`. *Range:* 0 :math:`\le` *Series Resistance* :math:`\le 9.999`
	
	- RL: The parallel resistance of the system in :math:`\Omega`. *Range:* 1.39 :math:`\le` *Parallel Resistance* :math:`\le 9999.99`
	
	- LS: The inductance of the system in :math:`\mu H`. *Range*: 0 :math:`\le` *Series Inductance* :math:`\le` 9999

	- C: The capacitance of the system in :math:`\mu F`. *Range*: 100 :math:`\le` *Parallel Capacitance* :math:`\le` 9999
	
	
*To Be Added to Inrush*
	- Phase: **Warning** This cannot currently be set; the module defaults to a phase of 0. In order to be able to set this, please modify the BaseConfig or Loads controls to include a *Phase* variable, then modify the *ConfigDevice* vi. When modifying the vi, look over to the 'Inrush" case of the SSM, expand the *Unbundle by Name*, select the newly created phase, and then wire it to the input of the *Set Phase of AC Inrush* vi, replacing the constant of 0.
	
DC Modes
========


CC (Constant Current)
---------------------

*The device attempts to operate at a constant DC current.*

	- I Load: The current at which the device attempts to operate, in A. *Range:* 0 < *Load Current* :math:`\le` 36

	- Fall Slew Rate: The maximum rate at which the current can decrease, in mA. *Range:* 4 :math:`\le` *Slew Rate* :math:`\le` 600
	
	- Rise Slew Rate: The maximum rate at which the current can increase, in mA. *Range:* 4 :math:`\le` *Slew Rate* :math:`\le` 600
	
	- Ipeak Max: The maximum current at which the device can operate before shutting down, in A. *Range:* 0 < *Peak Current* :math:`\le` 36

CP (Constant Power)
-------------------

*The device attempts to operate at a constant DC power.*

	- Power Loading: The power at which the device attempts to operate, in Watts. *Range:* 0 < *Load Power* :math:`\le` 3600
	
	- Ipeak Max: The maximum current at which the device can operate before shutting down, in A. *Range:* 0 < *Peak Current* :math:`\le` 36

CV
--

*The device attempts to operate as a constant voltage power load.*

	- Voltage Level: The voltage level at which the device attempts to operate, in V. *Range:* 7.5 :math:`\le` *Voltage Level* :math:`\le` 500

	- Ipeak Max: The maximum current at which the device can operate before shutting down, in A. *Range:* 0 < *Peak Current* :math:`\le` 36

CR (Constant Resistance)
------------------------

*The device attempts to operate as a resistor with a constant value.*

	- Resistance: The resistance of the load, in :math:`\Omega`. *Range:* 1.25 :math:`\le` *Load Resistance* :math:`\le` 1000
	
	- Fall Slew Rate: The maximum rate at which the current can decrease, in mA. *Range:* 4 :math:`\le` *Slew Rate* 600
	
	- Rise Slew Rate: The maximum rate at which the current can increase, in mA. *Range:* 4 :math:`\le` *Slew Rate* 600
	
	- Ipeak Max: The maximum current at which the device can operate before shutting down, in A. *Range:* 0 < *Peak Current* :math:`\le` 36
	
Rectified
---------

*The device converts a DC signal into an AC output.*

	- I Load: The current at which the device attempts to operate, in A. *Range:* 0 < *Load Current* :math:`\le` 36

	- Line Sync: A boolean value. When the value is true, the system uses line sync for synchronization. When the value is false, the system uses frequency to synchronize.
	
	- Frequency: The frequency of the output AC signal. *Range:* 45 :math:`\le` *Frequency* :math:`\le` 440

	- Crest Factor: The crest factor of the output signal. *Range:* 1.414 :math:`\le` *Crest Factor* :math:`\le` 5

	- Ipeak Max: The maximum current at which the device can operate before shutting down, in A. *Range:* 0 < *Peak Current* :math:`\le` 36

*************************
Class Specification
*************************

AcPwrBaseClass
==============

All other AcPwr classes inherit from the AcPwrBase class.  Multiple phases (channels of loads) are defined all sharing a common Frequency and Frequency Range.  Each Phase has a Handle which uniquely identifies the hardware supporting that phase.

|image0|

Figure \: AcPwrBaseClass UML specification

Properties
----------
Frequency \: double
 The frequency setpoint for all phases.
 
FrequencyRange \: [double] 
 An array of frequencies that limit the upper and lower allowable frequencies, if the array has only one element, then that will be the upper allowable frequency with the lower being 0.  If the array has two elements, then the first element is the lower allowable frequency and the second element is the upper.


Phases \: [struct]
 An array of structures containing the properties of each phase or channel.  

	Handle \: string
	  A unique identifier of the hardware supporting the phase.
	  
	Connected \: bool
	  Used by the system and not end-user settable.  Indicates that the phase has been initialized and is tready to receive further commands.  Closing a phase disconnects the phase and resets Connected.
  
	Name \: string
	 The name of the phase.  In some cases this is for the conveinience of the end user, in other cases, the hardware may need bot a phase Handle and a Name. 
	 
	Enabled \: bool
	  Set by the end user to determine if the phase should be enabled (energized) or disabled (de-energized).
	 
	VoltageLevel \: double
	 Specifies the line-to-neutral voltave level when operating in constant voltage mode.  May also specify a voltage offseyt for an AC voltage
	 
	VoltageRange \: [double]
	   Array of voltages specifying the minimum and maximum allowable voltage levels.  If the array has only one element, then it is the maximum allowable level with the minimum being 0.  If therer are two elements then the first element is the minimum level and the second is the upper limit.
	   
	CurrentLimit \: double
	  Specifies the output current limit.  For the ChromaAcLoadClass this will be *IrmsMax* 
	  
	Waveform \: string
	  The name of the waveform to be generated if the phase is capable of generating waveform functions.	
	  
FunctionClass \: class
  If the phase is capable of generating waveform functions (either standard or arbitrary) this property holds the class reference of the function that creates the waveforms
    
FunctionIniFilePath \: path
  The path to the .ini file holding the properties the waveform function

            	
Methods
---------------

Initialize(reset\:bool, QueryID\:bool)
  Opens a connection to all phases.  optionally reset the phase or check that the phase ID is valid.
  
ConfigPhases()
  Configure all phases with their property values
  
ConfigFrequency()
  Configure the frequency of all phases to the single frequency property value.
  
Disable()
   Cause all phases to apply the minimum ampout of power possible.  The devise remains connected after disablew.
   
ResetCurrentProtection()
   If the phases have tripped on over current, this method resets the overcurrent protection if the user has manually reset the Enabled property to true.  Note that during a protection event, the enabled property must be automatically cleared.
   
ResetVoltageProtection()
   If the phases have tripped on over or under voltage, this method resets the protection and re-enables the phases if the user has manually reset the Enabled property to true.  Note that during a protection event, the enabled property must be automatically cleared.
   
Reset()
    Disable all phases and return all properties to default values.
    
Measurement Extension Group    
===========================

Properties
---------------

Measurement \: [struct]
	An array of structures containing properties of each measurement to be made
	
	Handle \: string
	  A unique identifier of the hardware supporting the phase.
	
	Name \: string
	 The name of the phase.  In some cases this is for the conveinience of the end user, in other cases, the hardware may need bot a phase Handle and a Name. 
	 
	Enabled \: bool
	  Set by the end user to determine if the phase should be enabled (energized) or disabled (de-energized).

	Type \: enum
	   The type of measurement to be made:
		Voltage RMS L-N,  
		Current RMS,
		Frequency,
		Voltage DC,
		Current DC,
		Power Factor,
		Crest Factor,
		Current Peak,
		Power VA,
		Real Power,
		Power DC,
		Phase Angle,
		Voltage RMS L-L,
		Current OHD,
		Current EHD,
		Current THD,
		Voltage OHD,
		Voltage EHD,
		Voltage THD
		
	Result \: double
	    The result of the measurement (may eventually become a varient type if any measurement results cannot be represented by doubles).	
		
RefreshTime \: double
   The time delay between fetching individual measurements

Methods
---------------
InitiateMeasurment (Handle, Enum)
	Initiates all the measurements in the measurements structure for all of the phases that are enabled. Initiate will cause one measurement per structure element to be made.  After Initiate is called, Fetch will return the result of that measurement, then another measurement can be initiated
	
FetchMeasurement (Handle, Name)
	Returns the result of the previous call to the initiate group.  The return value is the entire measurement structure with the Handle, Name, Enabled, Type, and the latest Result 

		
ChromaAcLoadClass
=================

The Chroma AC load support one phase per device so multiple devises must be used to create multiple phases.  The IVI AC Power specification does not (yet) peovide an extension group for AC Loads but it seems to make sense to extend it.  Eventually this child class may become a base class for generic AC loads.

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
---------------

ConfigLoads()
	Configures the load modes, current shape, and relative phase of current to voltage

ConfigCurrent()
	Configures the current properties of the loads.  In CC mode, the Rise and Fall Slew rates detetermine how fast the current changes when the properties are changed.
	
ConfigPower()
	Configures the systems power loading
	
ConfigVoltage()
	Sets the DC voltage when in CV mode.  Only in DC modes.
	
ConfigImpedance()
	Configures the loads impedance settings
	
ConfigureShortCircuited()
	Places the load into or returmns from short circuited mode
		


.. |image0| image:: images/AcPwr/image0.png
   :width: 3in

.. |image1| image:: images/AcPwr/image1.png
   :width: 3in

.. |image2| image:: images/AcPwr/image2.png
   :width: 9in

***********
Range Check
***********

The Range Check vi checks to see whether or not the variables being configured into the VI are valid. It functions as an SSM, in which the user specifies an array of variables to check before calling the vi. It has the following case statements:

- ILoad: The current of the load, in Amperes.
	- Range: 0 < *ILoad* :math:`\le` 36
	- Modes Used: AC CC, DC CC, and DC Rectified

- Current Limit: The maximum RMS current of the load, in Amperes.
	- Range: 0 < *Current Limit* :math:`\le` 36
	- Modes Used: AC CC, AC CP, AC CR, RLC CP

- CF: The crest factor of the device.
	- Range: 1.414 :math:`\le` *CF* :math:`\le` 5
	- Modes Used: AC CC, AC CP, AC CR, and DC Rectified

- Constant PF: The power factor for non-RLC AC loads.
	- Range: 0 < *PF* :math:`\le` 1
	- Modes Used: AC CC, AC CP, AC CR

- RLC PF: The power factor of RLC loads.
	- Range: .4 :math:`\le` *PF* :math:`\le` .75
	- Modes Used: RLC CP

- DC Ipeak: The maximum peak current allowed through a DC load, in Amperes.
	- Range: 0 < *Ipeak* :math:`\le` 36
	- Modes Used: DC CC, DC CP, DC CV, DC CR, and DC Rectified

- Inrush Ipeak: The maximum peak current allowed through an RLC Inrush load, in Amperes.
	- Range: 0 < *Ipeak* :math:`\le` 160
	- Modes Used: RLC Inrush

- AC Ipeak: The maximum peak current allowed through an AC load, in Amperes.
	- Range: 0 < *Ipeak* :math:`\le` 108
	- Modes Used: AC CC, RLC, and AC CP

- Load Power: The power of the load, in Watts.
	- Range: 0 < *Load Power* :math:`\le` 3600
	- Modes Used: DC CP and AC CP

- RLC Power: The power of the RLC load, in Watts.
	- Range: 200 :math:`\le` *Load Power* :math:`\le` 3600
	- Modes Used: RLC CP

- DC Voltage: The voltage level of the DC load, in Volts.
	- Range: 7.5 :math:`\le` *Voltage* :math:`\le` 500
	- Modes Used: DC CV

- AC Voltage: The voltage level of the AC load, in volts.
	- Range: 50 :math:`\le` *Voltage* :math:`\le` 350
	- Modes Used: AC CP

- AC R Load: The resistance of the AC load, in :math:`\Omega`.
	- Range: 1.39 :math:`\le` :math:`\Omega` :math:`\le` 2500
	- Modes Used: AC CR

- DC R Load: The resistance of the DC load, in :math:`\Omega`.
	- Range: 1.25 :math:`\le` :math:`\Omega` :math:`\le` 1000
	- Modes Used: DC CR

- Frequency: The frequency of the load, in Herz.
	- Range: 45 :math:`\le` *frequency* :math:`\le` 440
	- Modes Used: DC Rectified

- Fall Slew: The fall slew rate of the load, in
	- Range: 4 :math:`\le` *Slew Rate* :math:`\le` 600
	- Modes Used: DC CC and DC CR

- Rise Slew: The rise slew rate of the load, in 
	- Range: 4 :math:`\le` *Slew Rate* :math:`\le` 600
	- Modes Used: DC CC and DC CR

- RS: The series resistance of the RLC system, in :math:`\Omega`.
	- Range: 0 :math:`\le` *Series Resistance* :math:`\le` 9.999
	- Modes Used: RLC and RLC Inrush

- RL: The parallel resistance of the RLC system, in :math:`\Omega`.
	- Range: 1.39 :math:`\le` *Parallel Resistance* :math:`\le` 9999.99
	- Modes Used: RLC and RLC Inrush

- LS: The inductance of the RLC system, in :math:`\mu H`.
	- Range: 0 < *Series Inductance* :math:`\le` 9999
	- Modes Used: RLC and RLC Inrush

- C: The capacitance of the RLC system, in :math:`\mu F`.
	- Range: 100 :math:`\le` *Parallel Capacitance* :math:`\le` 9999
	- Modes Used: RLC and RLC Inrush

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