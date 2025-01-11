cmake_minimum_required(VERSION 3.31)

project(CMakeCourse VERSION 1.0.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(EXECUTABLE_NAME Executable)
set(LIBRARY_NAME Library)

option(COMPILE_EXECUTABLE "Compile the executable" OFF)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/)
include(AddSubmodule)
add_subdirectory(external/json)

add_subdirectory(src)
add_subdirectory(configured)
if(COMPILE_EXECUTABLE)
    add_subdirectory(app)
else()
    message("Executable not compiled")
endif()