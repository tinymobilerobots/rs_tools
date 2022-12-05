=============================INSTALLATION===============================

1 run cd "~/new_toolbox" 
2 run the instalation script bash ./setup.sh

================================USE=====================================

rqt_reconfigure
The reconfigure tool is very similar to the original one with 2 key differences. By deafult all the parameters outside of a group will not be updated
automatically, but instead there will be an apply button in the top left corner. Once a parameter has been modified the text color will change to red
until the apply button is pressed.

dignostic_agreggator 
The aggregator node was making nodes that do not constanly publish, go to stale after a timeout. Now a new parameter was introduced called "allow_stale", 
it is set by default to false, but setting it to true (allow_stale: true) will prevent the node from changing state.

