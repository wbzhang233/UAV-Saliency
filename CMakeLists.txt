cmake_minimum_required(VERSION 2.8.3)
project(fillContours)

set(CMAKE_CXX_STANDARD 14)
find_package(OpenCV 3 REQUIRED)

FIND_LIBRARY(YAML_CPP_LIBRARIES yaml-cpp)
if(NOT YAML_CPP_LIBRARIES)
  # If yaml-cpp not found in the system, try finding it as a user CMake-generated project
  FIND_PACKAGE(yaml-cpp REQUIRED)
  INCLUDE_DIRECTORIES(${YAML_CPP_INCLUDE_DIRS})
endif(NOT YAML_CPP_LIBRARIES)

include_directories(${OpenCV_INCLUDE_DIRS})

# contrast
add_executable(saliency contrast_demo.cpp contrast.cpp contrast.h)
target_link_libraries(saliency ${OpenCV_LIBS} ${YAML_CPP_LIBRARIES})

# yaml_test
add_executable(yaml_test yaml_test.cpp)
target_link_libraries(yaml_test ${YAML_CPP_LIBRARIES})