.. _`Errors`:

###########
Error Codes
###########

     .. csv-table:: TestBaseClass Error Codes
	:header: "CODE", "ERROR", "COMMENT"
	:widths: 10,45,45
	
	"5601", "Unhandled State "%s" was received by the Scripted State Machine".  "The script contained a message that tried to call a state that has not (yet) been programmed into the SSM"
	"5603", "Scripted State Machine "Initialize state was called with elements in the queue.  Users scripts must not call the "Initialize" state." ""
	"5604", "The Test Class Scripted State Machine timed out after %d seconds.  Check that the last script ended with a "Stop" state.", "SSM scripts must end with a "Stop command.  If not, this error is thrown"
	"5605", "User STOP in error during Scripted State Machine Operation", "User requested the program to stop after an error in the scripted state machine.  User could have choseen ABORT, which would stop the state machine, but not the entire program"
	"5606", "Invalid Module Type %s in GetBroadcast called by Script Command %s", "The requested module type is not (yet) supported"
	"5607", "Script Command "%s" timed out waiting for broadcast from "%s module ID %d".  Called by script command "%s"
        "5608", "Unknown Plugin Type index %d: %s", "SSM Load Plugin state was called with an unsupported Plugin index"
        "5609", "Sync module not locked.  Abort the test, wait for lock and try again", "Before or during a test, a test to check the lock state of the Sync module shoed that sync is not locked and the test should be aborted"