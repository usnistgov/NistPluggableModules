.. _`Errors`:

###########
Error Codes
###########

     .. csv-table:: General Error Codes
	:header: "CODE", "ERROR", "COMMENT"
	:widths: 10,45,45

	"5001", "Override Error: Abstract class called", "NISTObject_class: This error occurs when the parent instance of a method that must be overridden is called. A child override instance should be called instead"
	"5002",	"The invalid message string % was received by module %s", "NISTCloneableModule.lvlib:Main.vi.  Error thrown when the default case of the queued message handler is called.  An unhandled message was inserted into the queue"
	"5004",	"Plugin class file not found at path: %s", "Check plugin .ini file for properly formatted relative path to class and check that the specified plugin class exists.	Each plugin has a .ini file which contains a path to the class file itself.  This error indicates that the class file was not found at the path indicated in the ini file"

     .. csv-table:: Scope Error Codes
	:header: "CODE", "ERROR", "COMMENT"
	:widths: 10,45,45
	
	"21001", "Improper channel name %s.  Must be "Channel 1" through "Channel 4", "The O'Scope channel names must be specific to the scope class"
	"21002", "Trigger Type %s is not yet supported", "This Trigger type will require the addition of an IVI extended class to the module"
	"21003", "The scope module is not connected to the oscilloscope.  Call "Initialize" to connect to the o'scope", ""
	"21004", "Acquisition type "%s" is not supported by this oscilloscope",""

     .. csv-table:: Sync Module Error Codes
	:header: "CODE", "ERROR", "COMMENT"
	:widths: 10,45,45

	"22001", "Clock Name: %s Not Found","Configure Clock command passed a clock name that was not found in the array of module clock properties"
	"22002", "Unsupported Clock Type %s","The Named Clock has a clock type that is not handled by the configure clocks method"
	"22003", "Unable to Synchronize Timing System to Clock Reference.  Be sure a cable is connected from the clock reference output to the ClkIn of the timing card","The timing card uses a PLL to synchronize to an external timing reference (GPS, 1588, ETc.) Generally this is a 10 MHz clock input."
	"22004", "Trigger Name: %s Not Found","Configure Trigger command passed a trigger name that was not found in the array of module trigger properties"
	"22005", "Unsupported Trigger Type %s","The Named Trigger has a trigger type that is not handled by the configure triggers method"
	"22006", "Trigger Name %s is not a %s trigger type.  Check the INI file","The Named Trigger has a trigger type that does not match the trigger type being handled."
	"22007", "Trigger Name %s Timestamping has not been Enabled", " An attempt to read a trigger timestamp was made to a trigger which has not had timestamping enabled"
	"22008", "Warning: Windows clock synchronization can only occur is LabView is being run as administrator. Either:1) Ensure Labview was started with Run As Administrator OR 2) Open Sync Module Settings and disable SyncWinClk.",""
	
     .. csv-table:: Digitizer Module Error Codes
	:header: "CODE", "ERROR", "COMMENT"
	:widths: 10,45,45
	
	"23001", "Channel Name: %s Not Found","a command passed a channel name that was not found in the array of channel properties"
	"23002", "Invalid Sample Clock Type %s selected","This hardware requires a sample clock source and selected type is not available."
	"23003", "%d Pretrigger samples can only work with a Reference trigger source"," Either set the pretrigger samples to 0 or set the Trigger source to Reference."
	"23004", "Invalid or unknown trigger source %s","Trigger sources can be Edge, Immediate, or reference."
	
     .. csv-table:: Function Generator Error Codes
	:header: "CODE", "ERROR", "COMMENT"
	:widths: 10,45,45
	
	"24001", "Trigger type %s is not supported by this hardware", "attempted to configure a trigger type that is not handled by the hardware being used."
	"24501", "Multiband function class, handle %s does not have equal number of frequency, Damping, Index and phase elements",  "The confuration elements for multiband oscillators must have the same number of elements for each channel"
	
    .. csv-table:: Analysis Class Error Codes
	:header: "CODE", "ERROR", "COMMENT"
	:widths: 10,45,45
	
	"25001", "Warning: Cannot Change Configuration while Analysis is running", User attempted to access the Analysis Configuration while an analysis was in progress"



     .. csv-table:: Test Class Error Codes
	:header: "CODE", "ERROR", "COMMENT"
	:widths: 10,45,45
	
	"30001", "Unknown module name %s","Attemped to access an unknown or unsupported pluggable module"
	"30002", "Loop stop condition name %s is unknown.  Loop will be stopped", "Unrecognized loop stop condition names must force a stop to avoid infinate loops"
	"30003", "Sync module not locked.  Abort the test, wait for lock, and try again", This framework must be synchronized before any test can be conducted"
	"30102", "Test Automation invalid Get argument %s","The test script sent an argument that is not supported"
	
     .. csv-table:: Bus Class Error Codes
	:header: "CODE", "ERROR", "COMMENT"
	:widths: 10,45,45
	
	"31001", "Bus Number not found %d", "While searching the bus class for a particular bus number, the bus was not found in the class"
	"31002", "Bus number %d already exists", "While trying to add a bus, the bus number was found to already exist"
	"31003", "Invalid Module type %s", "While configuring modules, an unrecognized module type was found"
		