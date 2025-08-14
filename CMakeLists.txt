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

# Download and build Boost
ExternalProject_Add(
    Boost
    GIT_REPOSITORY https://github.com/boostorg/boost.git
    GIT_TAG boost-1.88.0  # Specify the version you want
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/boost_install
)

# Specify the Boost include and library directories
include_directories(${CMAKE_BINARY_DIR}/boost_install/include)
link_directories(${CMAKE_BINARY_DIR}/boost_install/lib)

# Add the source files
file(GLOB SOURCES "src/*.cpp")

# Create the executable
add_executable(${EXECUTABLE_NAME} ${SOURCES})

# Define a version header file
configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/include/version.h.in"
    "${CMAKE_CURRENT_BINARY_DIR}/include/version.h"
    @ONLY
)

# Enable testing
enable_testing()

# Include tests
add_subdirectory(tests)

# Ensure the main executable depends on Boost
add_dependencies(${EXECUTABLE_NAME} Boost)