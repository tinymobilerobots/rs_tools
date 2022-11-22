cmake_minimum_required(VERSION 2.8.3)
project(msgs)

find_package(catkin REQUIRED COMPONENTS
  message_generation
  dynamic_reconfigure
  std_msgs
  )

catkin_python_setup()

generate_dynamic_reconfigure_options(
  cfg/Acceleration.cfg
  cfg/Collision.cfg
  cfg/PlatformDirection.cfg
  cfg/ImuBasic.cfg
  cfg/ImuSpi.cfg
  cfg/ImuUart.cfg
  cfg/KinematicGeometry.cfg
)

## Generate messages in the 'msg' folder
add_message_files(
  FILES
  Float32Stamped.msg
  StringStamped.msg
  KeyData.msg
  SystemEvent.msg
  SystemState.msg
  Lamp.msg
  Magnetometer.msg
  UserInfo.msg
  AuxCommand.msg
  CmdWheel.msg
  OdrivePid.msg
  # Arduino
  lcd_line.msg
  lcd_content.msg
  tool_position.msg
  CalibrationInfo.msg
)

## Generate services in the 'srv' folder
# add_service_files(
#   FILES
#   Service1.srv
#   Service2.srv
# )

## Generate actions in the 'action' folder
# add_action_files(
#   FILES
#   Action1.action
#   Action2.action
# )

## Generate added messages and services with any dependencies listed here
generate_messages(
   DEPENDENCIES
   std_msgs  # Or other packages containing msgs
)


catkin_package()
