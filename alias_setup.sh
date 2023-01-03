echo "Setting up aliases"

# All aliases should be loaded from the toolbox (only write include to .bashrc)

alias ,ros="source ~/rs_tools/devel/setup.sh"

,rosip()

{

  if [ -z "$1" ]
  then
    echo "Please supply robot number as first argument";
    return 1;
  fi

  export ROS_IP= ifconfig tun0 | awk '/inet addr/ {gsub("addr:", "", $2); print $2}'
}

,ts()

{

 if [ -z "$1" ]
 then
   echo "Please supply robot number as first argument";
   return 1;
 fi

,ros; export ROS_MASTER_URI=http://tinybox$1:11311; ,rosip;

}

,tb()

{

if [ -z "$1" ]
 then
   echo "Please supply robot number as first argument";
   return 1;
 fi

ssh pc@tinybox$1;

}

,pb()

{

if [ -z "$1" ]
 then
   echo "Please supply robot number as first argument";
   return 1;
 fi

ping -D -O tinybox$1;

}



,suport()

{

gnome-terminal -- bash -c "source ~/rs_tools/devel/setup.sh; rosrun rqt_reconfigure rqt_reconfigure;"
,ros;
rosrun rqt_robot_monitor rqt_robot_monitor;
}


#gnome-terminal -- bash -c "bash;"

# All aliases should support

# These should be made functions allowing for specifying ,monitor (robot id)

alias ,monitor=",ros; rosrun rqt_robot_monitor rqt_robot_monitor"

alias ,runtime=",ros; rosrun rqt_runtime_monitor rqt_runtime_monitor"

alias ,reconfigure=",ros; rosrun rqt_reconfigure rqt_reconfigure"

alias ,console=",ros; rosrun rqt_console rqt_console"

alias ,plot=",ros; rosrun rqt_plot rqt_plot"

alias ,plot_juggler=",ros; rosrun plotjuggler plotjuggler"

# Plot juggler aliases ?

alias ,dp,list=",ros; rosrun dynamic_reconfigure dynparam list"

alias ,dp,get=",ros; rosrun dynamic_reconfigure dynparam get "

alias ,dp,set=",ros; rosrun dynamic_reconfigure dynparam set "

alias ,plot,angular_velocity=",plot /platform/roboteq/wheel_odometry/twist/twist/angular/z /information/imu/angular_velocity/z /platform/cmd_vel/angular/z /localization/global_fused/twist/twist/linear/x"

# Use plot juggler

alias ,plot,pump=",plot_juggler --layout $(eval rospack find plotjuggler_ros)/config/pump_layout.xml --topic_list '/tool/pump_command,/tool/pump_current'"

# Only for roboteq

alias ,plot,encoder=",plot_juggler --layout $(eval rospack find plotjuggler_ros)/config/pump_layout.xml --topic_list '/platform/roboteq/channel_encoders_lr'"

,filezille()

{

if [ -z "$1" ]
 then
   echo "Please supply robot number as first argument";
   return 1;
 fi
 
filezilla -l interactive sftp://pc@tinybox$1
}

alias ,mqtt='mosquitto_sub -v -h mqtt -t "#"'

alias ,reconf='rosrun rqt_reconfigure rqt_reconfigure'

echo "Aliases summary"
echo "Rqt reconfigure = ,reconf"
echo "source tools = ,ros"
echo "export uri and rosip = ,ts <robot id>"
echo "shh to robot  = ,tb <robot id>"
echo "ping robot = ,pb <robot id>"
echo "open both monitor and reconfigure = ,suport"
echo "open robot monitor = ,monitor"
echo "open runtime monitor = ,runtime"
echo "open rqt_console = ,console"
echo "open plot = ,plot"
echo "open dynam param list = ,dp,list"
echo "open dynam param get = ,dp,get"
echo "open dynam param set = ,dp,set"
echo "open plot angular velocity = ,plot,angular_velocity"
echo "open plot juggler pump = ,plot,pump"
echo "open plot juggler encoder = ,plot,encoder"
echo "open mosquitto_sub = ,mqtt"
echo "open fillezilla = ,filezille"
