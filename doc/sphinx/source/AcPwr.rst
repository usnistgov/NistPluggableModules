###########################
Ac Power Module
###########################
*A Comprehensive Guide*
-----------------------------

===========================
Overview
===========================

===========================
ChromaAcLoad.lvclass
===========================

The following section lists every operation mode the Ac Chroma Power Load 63800 is capable of. Each mode utilizes a different set of parameters from the rest. If a variable is listed under an operation mode, it must be configured in order for the chroma to operate. If a variable is not listed under an operation mode, its value will be ignored when configuring the device. **Failing to configure a variable properly will potentially cause the Chroma to fail without sending an error message**. 


^^^^^^^^^^^^^^^^^^^^^^^^^^^
General Variables
^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

---------------------------
AC Modes
---------------------------

^^^^^^^^^^^^^^^^^^^^^^^^^^^
CC (Constant Current)
^^^^^^^^^^^^^^^^^^^^^^^^^^^

*The device attempts to match the value of the RMS current to an amount specified by the user.*

	- ILoad: The RMS current that the device will try to emulate, in Amperes. *Range:* :math:`0 < LoadCurrent \le 36`	
	
	- Priority: Determines whether the device prioritizes the Current Factor, Power Factor, or both. If the device is prioritizing both, it will still 'prefer' one over the other.
	
	- Power Factor: The power factor of the load. *Range:* :math:`0 \le PF \le 1`
	
	- Crest Factor: The crest factor of the load. *Range:* :math:`1.414 \le` *CF* :math:`\le 5`
	
	- Current Limit: The maximum RMS current allowed through the device. *Range:* :math:`0 \le` *Max RMS Current* :math:`\le 36`
	
	- IpeakMax: The maximum peak current allowed through the device. *Range:* :math:`0 \le` *Peak Current* :math:`\le 108`

^^^^^^^^^^^^^^^^^^^^^^^^^^^
CP (Constant Power)
^^^^^^^^^^^^^^^^^^^^^^^^^^^

*The device attempts to match the value of the RMS power to an amount specified by the user.*

	- PowerLoading: The RMS power that the load will try to consume. *Range:* 0 < *Max RMS Current* :math:`\le 3600`
	
	- Current Limit: The maximum RMS current of the load. Also used to set the maximum RMS power of the load. *Range:* 0 < *Max RMS Current* :math:`\le 36`
	
	- Voltage Level: The voltage level of the load. This is **only** used to set the maximum RMS power of the load. *Range:* :math:`50 \le` *Max RMS Current* :math:`\le 350`
	
	- Priority: Determines whether the device prioritizes the Current Factor, Power Factor, or both. If the device is prioritizing both, it will still 'prefer' one over the other.
	
	- Power Factor: The power factor of the load. *Range:* :math:`0 \le PF \le 1`
	
	- Crest Factor: The crest factor of the load. *Range:* :math:`1.414 \le` *CF* :math:`\le 5`
	
	- IpeakMax: The maximum peak current allowed through the device. *Range:* 0 < *Peak Current* :math:`\le 108`

^^^^^^^^^^^^^^^^^^^^^^^^^^^
CR (Constant Resistance)
^^^^^^^^^^^^^^^^^^^^^^^^^^^

*The device attempts to emulate a resistor with a constant value*

	- Resistance: The resistance that the load will attempt to emulate, in :math:`\Omega`.. *Range:* :math:`1.39 \le` *Load Resistance* :math:`\le 2500`
	
	- Power Factor: The power factor of the load. *Range:* :math:`0 \le PF \le 1`
	
	- Crest Factor: The crest factor of the load. *Range:* :math:`1.414 \le` *CF* :math:`\le 5`
	
	- Current Limit: The maximum RMS current of the load. *Range:* 0 < *Max RMS Current* :math:`\le 36`
	
^^^^^^^^^^^^^^^^^^^^^^^^^^^
RLC
^^^^^^^^^^^^^^^^^^^^^^^^^^^

*The load emulates an RLC circuit, with an inductor in series and a capacitor in parallel.*

	- RS: The series resistance of the system in :math:`\Omega`. *Range:* 0 :math:`\le` *Series Resistance* :math:`\le 9.999`
	
	- RL: The parallel resistance of the system in :math:`\Omega`. *Range:* 1.39 :math:`\le` *Parallel Resistance* :math:`\le 9999.99`
	
	- LS: The inductance of the system in :math:`\mu H`. *Range*: 0 :math:`\le` *Series Inductance* :math:`\le` 9999

	- C: The capacitance of the system in :math:`\mu F`. *Range*: 100 :math:`\le` *Parallel Capacitance* :math:`\le` 9999
	
^^^^^^^^^^^^^^^^^^^^^^^^^^^	
RLC CP
^^^^^^^^^^^^^^^^^^^^^^^^^^^
*The load emulates an RLC circuit operating a constant RMS power. An inductor is in series and a capacitor is in parallel.*

	- Power Loading: The RMS power that the device will try to maintain, in Watts. *Range:* 200 :math:`\le` *Load Power* :math:`\le` 3600 
	
	- Power Factor: The power factor of the system. *Range:* 0.4 :math:`\le` *Power Factor* :math:`\le` 0.75
	
	- Current Limit: The maximum RMS current of the system. *Range:* 0 < *Max RMS Current* :math:`\le` 36
	
*Special*: Trying to set the maximum peak current of the system using RLC CP causes the chroma to cease functionality, but will not send an error message.

^^^^^^^^^^^^^^^^^^^^^^^^^^^
Inrush
^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Note**: Measuring the inrush current of the device is tricky, seeing as the mode quickly turns off. In order to perform measurements on this device, the user is recommended to use the *Set Peak Current Meas Hold* vi with the input set to *true*, then using the *Measure or Fetch Peak Current* vi.

	- IpeakMax: The maximum peak current of the system. *Range: Max Peak Current* :math:`\le` 160 [1]_ .
	
	- RS: The series resistance of the system in :math:`\Omega`. *Range:* 0 :math:`\le` *Series Resistance* :math:`\le 9.999`
	
	- RL: The parallel resistance of the system in :math:`\Omega`. *Range:* 1.39 :math:`\le` *Parallel Resistance* :math:`\le 9999.99`
	
	- LS: The inductance of the system in :math:`\mu H`. *Range*: 0 :math:`\le` *Series Inductance* :math:`\le` 9999

	- C: The capacitance of the system in :math:`\mu F`. *Range*: 100 :math:`\le` *Parallel Capacitance* :math:`\le` 9999
	
	
*To Be Added to Inrush*
	- Phase: **Warning** This cannot currently be set; the module defaults to a phase of 0. In order to be able to set this, please modify the BaseConfig or Loads controls to include a *Phase* variable, then modify the *ConfigDevice* vi. When modifying the vi, look over to the 'Inrush" case of the SSM, expand the *Unbundle by Name*, select the newly created phase, and then wire it to the input of the *Set Phase of AC Inrush* vi, replacing the constant of 0.
	
---------------------------
DC Modes
---------------------------

^^^^^^^^^^^^^^^^^^^^^^^^^^^
CC (Constant Current)
^^^^^^^^^^^^^^^^^^^^^^^^^^^

*The device attempts to operate at a constant DC current.*

	- I Load: The current at which the device attempts to operate, in A. *Range:* 0 < *Load Current* :math:`\le` 36

	- Fall Slew Rate: The maximum rate at which the current can decrease, in mA. *Range:* 4 :math:`\le` *Slew Rate* :math:`\le` 600
	
	- Rise Slew Rate: The maximum rate at which the current can increase, in mA. *Range:* 4 :math:`\le` *Slew Rate* :math:`\le` 600
	
	- Ipeak Max: The maximum current at which the device can operate before shutting down, in A. *Range:* 0 < *Peak Current* :math:`\le` 36

^^^^^^^^^^^^^^^^^^^^^^^^^^^
CP (Constant Power)
^^^^^^^^^^^^^^^^^^^^^^^^^^^

*The device attempts to operate at a constant DC power.*

	- Power Loading: The power at which the device attempts to operate, in Watts. *Range:* 0 < *Load Power* :math:`\le` 3600
	
	- Ipeak Max: The maximum current at which the device can operate before shutting down, in A. *Range:* 0 < *Peak Current* :math:`\le` 36

^^^^^^^^^^^^^^^^^^^^^^^^^^^
CV
^^^^^^^^^^^^^^^^^^^^^^^^^^^

*The device attempts to operate as a constant voltage power load.*

	- Voltage Level: The voltage level at which the device attempts to operate, in V. *Range:* 7.5 :math:`\le` *Voltage Level* :math:`\le` 500

	- Ipeak Max: The maximum current at which the device can operate before shutting down, in A. *Range:* 0 < *Peak Current* :math:`\le` 36

^^^^^^^^^^^^^^^^^^^^^^^^^^^
CR (Constant Resistance)
^^^^^^^^^^^^^^^^^^^^^^^^^^^

*The device attempts to operate as a resistor with a constant value.*

	- Resistance: The resistance of the load, in :math:`\Omega`. *Range:* 1.25 :math:`\le` *Load Resistance* :math:`\le` 1000
	
	- Fall Slew Rate: The maximum rate at which the current can decrease, in mA. *Range:* 4 :math:`\le` *Slew Rate* 600
	
	- Rise Slew Rate: The maximum rate at which the current can increase, in mA. *Range:* 4 :math:`\le` *Slew Rate* 600
	
	- Ipeak Max: The maximum current at which the device can operate before shutting down, in A. *Range:* 0 < *Peak Current* :math:`\le` 36
	
^^^^^^^^^^^^^^^^^^^^^^^^^^^
Rectified
^^^^^^^^^^^^^^^^^^^^^^^^^^^

*The device converts a DC signal into an AC output.*

	- I Load: The current at which the device attempts to operate, in A. *Range:* 0 < *Load Current* :math:`\le` 36

	- Line Sync: A boolean value. When the value is true, the system uses line sync for synchronization. When the value is false, the system uses frequency to synchronize.
	
	- Frequency: The frequency of the output AC signal. *Range:* 45 :math:`\le` *Frequency* :math:`\le` 440

	- Crest Factor: The crest factor of the output signal. *Range:* 1.414 :math:`\le` *Crest Factor* :math:`\le` 5

	- Ipeak Max: The maximum current at which the device can operate before shutting down, in A. *Range:* 0 < *Peak Current* :math:`\le` 36

---------------------------
Recommended Improvements
---------------------------
-The project currently has a "load short circuited variable" that is not wired up to anything. There's a VI that can use this variable, but it seemed more appropriate to attach this VI to a separate call, rather than the "Config device" call. 

###########################
AcPwrClass vi
###########################

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
	
###########################
AcPwrState.vi
###########################

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
	
	.. [1] This value is taken directly from the device's manual and has not been tested.