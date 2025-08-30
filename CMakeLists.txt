cmake_minimum_required(VERSION 3.10)
project(WeatherDashboardApp VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Define the executable name
set(EXECUTABLE_NAME "WeatherDashboardApp_v${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}")

# include extra cmake modules
include(ExternalProject)

# Specify the include directories
include_directories(include)

# Add the source files
file(GLOB SOURCES "src/*.cpp" "src/**/*.cpp")

# Create the executable
add_executable(${EXECUTABLE_NAME} ${SOURCES})

# Define a version header file
configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/include/version.h.in"
    "${CMAKE_CURRENT_BINARY_DIR}/include/version.h"
    @ONLY
)

# Enable testing
if (BUILD_TESTS)
    enable_testing()
    add_subdirectory(tests)
endif()