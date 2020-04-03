#######################
NhRegenGridSim VI Index
#######################

********
Overview
********

This document summarizes information pertinent to the development of the NHR 9410 Regenerative Grid Simulator.

|Nh9410SimpleModeTable|

.. |Nh9410SimpleModeTable| image:: images/AcPwr/Nh9410SimpleModeTable.png
	:width: 6in

*An easy to read table showing the 13 operation modes of the 9410*

Receiving developers
====================

In order to get the Nh 9410 online, there's a few things that still need to be done:

- ConfigDevice.vi and RunMeas.vi
- *(Potentially Optional)*: StartMeas.vi, RunMeas.vi, StopMeas.vi, and RangeCheck.vi (Not mandatory, but very helpful for the user)
- The device can have its *range* customized. Its documentation assumes that the range is going to be a minimum **and** a maximum, but the vi that configures ranges only has room for one DBL. This conflicting information needs resolution.

The following things are finished, but please feel free to go back and revise my work if needed:
- Close, DefaultFromINI, DeviceOn, DeviceOff, Disable, Initialize, PrefDialog, and Reset
- Loads and it's relevant type definitions

The ConfigPhases VI is largely unused, seeing as this was intended to be to configure the device, and ConfigDevice.vi takes that role. It *might* need to be removed, but it's definitely possible that I'm misunderstanding the purpose of the VI.

General Notes:

- The developers seems to favor unsigned integers (U32, U8, U16, etc.) over "normal" ones (I32, I8, I16, etc.).
- I'd highly recommend looking over the last part of the manual; it's honestly a more concise read than anything I can copy and paste into here.


Remaining Questions
===================

	- What is UUT?
	


************************
Proposed Class Structure
************************

*Note*: The variable types (I.e. DBL, INT, Unsigned INT, etc.) were chosen to match the NHR VIs as closely as possible.

Loads
======

- Hardware Mode: Unsigned 8-bit. The operation mode of the device. Valid range is 0-12 (3 channel), 0-5 (2 channel), and 0-1 (1 channel). *However*, one of the manuals for the 9400 series as a whole suggests that it also can have a range of 0-15. This may need investigation.

- Logical Instrument Number: Unsigned 32-bit integer. Used to identify the instrument by other VIs for the device. 

- Pmax: ENUM. This is the maximum power of the device, in kilowatts. This is used to determine the kind of device we're working with. There's room for improvement on the naming/organizing convention I used here, so please feel free to iterate upon it.

Ranges
======

**WARNING:** *ConfigureRange.vi* is weird and **very** confusing. It configures the device to operate within a *maximum* and *minimum* After talking to Allen, we have a couple of theories on what it *could* be:

- Idea 1: The NHR 9410 has a set of ranges that it *can* configure to. When you put in the DBL, the NHR selects the range that most closely matches this DBL, and then uses that. (Ex: Similar to a VOM, the device can operate between 0-10, 0-100, and 0-1000. You pick 50, so the program selects the range of 0-100.)

- Idea 2: The minimum is constant. The maximum is equal to the DBL put into *ConfigureRange.vi*.\

*Side Note*: It's also fully possible that we don't even *need* a range cluster here, seeing as this may all be covered by *VoltageRange* and *CurrentLimit* in the base class. Please use discretion on what's most appropriate to do here.

Current Ranges
--------------

Current per Phase:

*For DC operations, this is the absolute value of the current. For AC operations, this is the RMS value of the current.*

	- 24: 12, 60

	- 48: 24, 120

	- 96: 48, 240


Current, with the device operating as one massive phase:

*For DC operations, this is the absolute value of the current. For AC operations, this is the RMS value of the current.*

	- 24: 36, 180

	- 48: 24, 120

	- 96: 144, 720

Peak Current: This one is weird. One section of the data sheet says that it's equal to triple the max RMS current, but another part explicitly names the ranges of 40/200, 80/400, and 180/800 as the max current per channel. So one says to multiply by 3, but another says to multiply by 3.3333.

Slew Rates
==========

- Islew: DBL. Amperes/second
- Vslew: DBL. Volts/second
- Pslew: DBL. Watts/second
- FreqSlew: DBL. Hz/second
- AngleABSlew: DBL. Slew rate of phase angle from A to B in degrees/second
- AngleACSlew: DBL. Slew rate of phase angle from A to C in degrees/second

Load Settings
=============

This is an array. Each array element represents a phase of the device:

- Phase 1: Channel A
- Phase 2: Channel B
- Phase 3: Channel C
- Phase 0: All Channels

Note: Phase is a 32-bit *signed* integer frequently used by the device. I'd recommend using the index of the array to represent this *Phase* variable.

*Why did you organize the class this way?*
 - Mainly to simplify everything. *Most* elements of the class apply to the entire device, not just a single phase. This way, you only need to go in and configure everything in triplicate for phase-specific measurements. That being said, if there's a more efficient way to organize this, then please don't hesitate to go for it.

*Array Variables*: 

- Output Power: DBL. The power limit of the entire device. For multi-phase operations, this is the limit for the sum of all phases. The output of the real power is in kW, while the output of the apparent power is in kVA.
	- Max Values:
		- 24 kW, 63 kVA
		- 48 kW, 126 kVA
		- 96 kW, 252 kVA

- Output Current: DBL. The current limit of the entire device. For multi-phase operations, this is the limit for the sum of all phases.

- Phase Angle: DBL. The angle of the phase, in degrees. The device only has a resolution of 1 degree. (Seems to me that the developer's decision to choose a DBL over an INT is weird if it's impossible to use fractions of a degree.)
	- Range: 0 :math:`\le` *Angle* :math:`\le` 359.

- Transformer Ratio: DBL. Set to 0 if no autotrasnformer is connected. Otherwise, set the ratio to a non-zero number. (Ex: for a ratio of 2:1, use 2.0)

- Waveshape: Single dimension array of DBLs. This array is uploaded into the program's *buffer*. The buffer can be sent to a phase of a device, which defines the waveshape of that array.
	- Note for future improvements: There's gotta be a better way to define the waveshape than by manually programming X-hundred individual points into the program, right? Maybe write it directly to the INI file?

Meas
====

Measurement settings unique to the NH9410

- Aperature Length: DBL. The time of acquisition, in seconds.
	- Range: "1 cycle to 64s". I think this means that the maximum cannot exceed 1 cycle *and* it cannot exceed 64 seconds, but I'm not entirely sure.

- Number of Samples: Unsigned 32-bit integer. The number of samples to graph during an acquisition.
	- Maximum: 64,000 samples

Relevant Limits
---------------

- The Sample rate cannot exceed 125,000 samples per second.

*****************
*Other Variables*
*****************

**NOTE**: The proposed class structure is more up to date than this. Please refer to that when possible.
	
- Output Voltage: (Location - BaseConfig:Phases:VoltageLevel) DBL. The output voltage. DC outputs V, while single-phase AC outputs V\ :sub:`rms`\  L-N, and multi-phase AC outputs V\ :sub:`rms`\  L-L.


- Frequency: (Location - BaseConfig:Frequency) DBL. The frequency of the device. Only used in AC mode.
	- Range: 30 :math:`\le` *Freq* :math:`\le` 100

- Logical Instrument Name: (Location - BaseConfig:Phases:Name) STRING. Used to identify the instrument by other VIs for the device. This should be set immediately after saving the settings.

- VISA resource name: (Location - BaseConfig:Phases:Handle) STRING. The name the computer uses to contact the device. This needs to precisely match the IVI/NI Max name of the instrument. Please note that we call it **handle**, not Visa resource name.

- VoltageRange: (Location - BaseConfig:Phases:VoltageRange). Array of cluster of DBLs; the leftmost is the minimum and the rightmost is the maximum. You're best advised to figure out what's going on with the ranges (Proposed_Class_Structure:Ranges) before you proceed here.
	- The voltage of the devi ce. DC outputs V, while single-phase AC outputs V\ :sub:`rms`\  L-N, and multi-phase AC outputs V\ :sub:`rms`\  L-L.
	- Ranges:
		- DC: 200 V\ :sub:`dc`\, 400 V\ :sub:`dc`\
		- AC: 175V\ :sub:`rms`\, 350 V\ :sub:`rms`\

Special
========

- *Status Byte Register*
	- BIT 0: Module is busy
	- BIT 1: Module is in Remote Mode
	- Bit 2: Error in Queue
	- BIT 3: QUES (Questionable Status Summary)
	- BIT 4: MAV (Message Available)
	- BIT 5: ESB (Event Status Byte Summary)
	- BIT 6: RQS (Request for Service)
	- Bit 7: OPER (Operation Event Summary)

*************
Output Limits
*************

General Li

Mode 0
======

|Nh9410Mode0Limits|

.. |Nh9410Mode0Limits| image:: images/AcPwr/Nh9410Mode0Limits.png
	:width: 9in

Mode 1
======

|Nh9410Mode1Limits|

.. |Nh9410Mode1Limits| image:: images/AcPwr/Nh9410Mode1Limits.png
	:width: 9in

Mode 2
======

|Nh9410Mode2Limits|

.. |Nh9410Mode2Limits| image:: images/AcPwr/Nh9410Mode2Limits.png
	:width: 9in

Mode 3
======

|Nh9410Mode3Limits|

.. |Nh9410Mode3Limits| image:: images/AcPwr/Nh9410Mode3Limits.png
	:width: 9in

Mode 4
======

|Nh9410Mode4Limits|

.. |Nh9410Mode4Limits| image:: images/AcPwr/Nh9410Mode4Limits.png
	:width: 9in

Mode 5
======

|Nh9410Mode5Limits|

.. |Nh9410Mode5Limits| image:: images/AcPwr/Nh9410Mode5Limits.png
	:width: 9in

Mode 6
======

|Nh9410Mode6Limits|

.. |Nh9410Mode6Limits| image:: images/AcPwr/Nh9410Mode6Limits.png
	:width: 9in

Mode 7
======

|Nh9410Mode7Limits|

.. |Nh9410Mode7Limits| image:: images/AcPwr/Nh9410Mode7Limits.png
	:width: 9in

Mode 8
======


Mode 9
======

Mode 10
=======

Mode 11
=======



Mode 12
=======



*************
PublicMethods
*************

Action Status
=============

Action
------

Query
-----

Reset
-----

Set
---



Low Level
---------

	- Action Abort Measurement Trigger: Resets the list and measurement trigger systems to the Idle state. Any list or measurement that is in progress is immediately aborted. Abort Trigger also resets the WTG bit in the Operation Condition Status register (see chapter 3 under “\\Programming the Status Registers”\\). Abort Trigger is executed at power turn-on and upon execution of RCL, RST, or any implied abort command
	
	- Query Auto Transformer: Returns the auto transformer ratio on the instrument
		- Outputs:
			- Ratio: The auto transformer ratio on the selected instrument.
	
	- Query Hardware Mode: Returns the hardware mode of the instrument. An AC/DC Power Module has one to three power channels installed. Each channel can operate independently or in parallel with others. In addition, the channels can operate in AC or in DC mode.
		- Outputs:
			- Mode: The hardware mode of the instrument
	
	- Query Instrument Grid: Indicates if the selected instrument is a normal grid or evaluation mode.
		- Normal Mode: The grid acts like an AC or DC source which controls the output based on voltage, current, and power limits. The active limit will be set based on whichever of the voltage, current, or power limits will draw the least current. The source can accommodate UUTs that are resistive, inductive, or capacitive.
		- Grid Emulation Mode: The unit will regulate voltage only, but will apply current and power safety trip protection. It is expected that the UUT in this case is a grid-tie inverter that will take energy from the grid or return energy to the grid.

	- Query Measurement In Progress: Indicates whether or not an initiated measurement has been acquired. The vi outputs *true* when the measurement has been called but not completed. The vi outputs *false* once the instrument has completed the requested measurement.
	
	- Query Range List (*Current*): Returns a list of current ranges of the module, in minimum and maximum Amperes for each range.
		- Current Range List (A): An array with the current ranges of the module, in Amperes.
	
	- Query Range List (*Voltage*): Returns a list of voltage ranges of the module, in minimum and maximum Volts for each range.
		- Voltage Range List (V): An array with the voltage ranges of the module, in Volts.
	
	- Query Range List: Returns a list of voltage and current ranges of the module, in minimum and maximum Amperes or Volts for each range.
		- Voltage Range List (V): An array with all of the ranges of the module, in volts and amperes.
		
	- Query Regulation Gain Capabilities: This returns the absolute minimum and maximum legal values for regulation gain and the nominal (default) value.
		- Output:
			- Minimum: The absolute minimum legal regulation gain
			- Maximum: The absolute maximum legal regulation gain
			- Nominal: The nominal (default) regulation gain
	
	- Query Regulation Gain: Returns the regulation gain set as a percent correction applied during each control loop to regulate the output.
	
	- Query Safety: This command is used to query the maximum allowable time and value which, if exceeded, wil lcause the Module to shut off. Time values of <0 indicate that the parameter is disabled. Peak values are the maximum instantaneous absolute value.
	
	- Query System Capabilities: The number of channels and chassis detected.
	
	- Query Trigger Mode: Returns the state of the module's auto generate trigger mode. When set, the Module will generate a trigger on each operating change in value (new current, resistance, power, or voltage).
	
	- Query Trigger Source: Returns the set tripper source
	
	- Query Waveshape Data: Queries the waveshape data from the specified phase at the specified waveshape storage index.
		- Input:
			- Phase: The phase at which the waveshape data is queried. 1 is the *A Phase*.
			- Index: The waveshape storage index. 1 is *User 1*.
		- Output:
			- Waveshape: The waveshape data.
		
	- Set Trigger Mode: Puts the Module in auto generate trigger mode.
		- Input:
			- Trigger Auto-Generate: When enabled, the Module generates a trigger on each operating change in value (new current, resistance, power, or voltage).
			
	- Set Trigger Source: Selects the trigger source.
		- Input:
			- Trigger Source: The trigger source. 0 is rated as *immediate*.
		
	- Set Waveshape Buffer: This function sets data values in the controller for use in defining an arbitrary waveform shape.
		- Once the data has been written to this buffer it can be sent to the individual phases using Set Waveshape Data.vi. This can be used to send the same waveshape to several phases.
		- There can only be one waveshape buffer. If the user needs different shapes, they will call a buffer (using *Set Waveshape Data.vi*), send it to each desired phase, and then repeat the process with a new buffer.
	
		- Input:
			- Waveshape: The arbitrary waveform shape.
				- The array should contain data for one cycle. The native buffer size is 360 points, representing the waveform at each degree. If the supplied array size does not equal 360, the data is resampled to fit the native size, repeating or removing data as necessary.
				- The native range for waveshapes is :math:`\ge` -1 and :math:`\le` +1. The supplied data will be rescaled to fit this range.
				- The waveform's amplitude and frequency are *later* controlled using the corresponding Action Modify Setpoint VIs.

	- Set Waveshape Data: Writes the currently uploaded waveshape buffer data to the specified phase at the specified waveshape storage index. The user must use *Set Waveshape Buffer.vi* **before** uploading a buffer to a phase.
		- Input:
			- Phase: The phase the data is being uploaded to. Setting the phase to 0 sends the data to all phases.
			- Index: The waveshape storage index.
