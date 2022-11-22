# This message holds the status of an individual component of the robot.
# 

# Possible levels of operations
byte OK=0 # System is OK
byte WARN=1 
byte ERROR=2 # Soft error, can resume automatic mode
byte STALE=3 # Not used (Only here for compatibility)
byte HARDERROR=4 # Hard error, user needs to ack. the problem

# Possible states
uint16 INIT = 1
uint16 MANUAL = 2
uint16 AUTOMATIC = 3
uint16 AUTOMATIC_OFF = 4 # Deadman released
uint16 ERROR_HARD = 5
uint16 ERROR_USER_WAIT = 6
uint16 ERROR_ACK = 7 # Try to recover running state
uint16 ERROR_RESOLVED = 8 # Error state has been recovered
uint16 ERROR_SOFT = 9 # Soft error, continue when gone

byte level # level of operation enumerated above 
string message # a description of the status. This may only contain more than one line if level == Harderror, newline = \n
string description # a longer text for large displays

uint16 state_top
uint16 state_user # Possible values: AUTOMATIC, MANUAL

#string name # a description of the test/component reporting
#string hardware_id # a hardware unique string
#KeyValue[] values # an array of values associated with the status

