cmake_minimum_required(VERSION 3.0.2)
project(tf2)

find_package(console_bridge REQUIRED)
find_package(catkin REQUIRED COMPONENTS geometry_msgs rostime tf2_msgs)
find_package(Boost REQUIRED COMPONENTS system thread)

catkin_package(
   INCLUDE_DIRS include
   LIBRARIES tf2
   DEPENDS console_bridge
   CATKIN_DEPENDS geometry_msgs tf2_msgs rostime)

include_directories(include ${catkin_INCLUDE_DIRS} ${console_bridge_INCLUDE_DIRS})

# export user definitions

#CPP Libraries
add_library(tf2 src/cache.cpp src/buffer_core.cpp src/static_cache.cpp)
target_link_libraries(tf2 ${Boost_LIBRARIES} ${catkin_LIBRARIES} ${console_bridge_LIBRARIES})
add_dependencies(tf2 ${catkin_EXPORTED_TARGETS})

install(TARGETS tf2
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_GLOBAL_BIN_DESTINATION}
)

install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
)


