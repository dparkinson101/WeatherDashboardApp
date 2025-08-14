#!/bin/bash

# Navigate to the build directory
BUILD_DIR="build"

# Check if the build directory exists, if not, create it
if [ ! -d "$BUILD_DIR" ]; then
    mkdir "$BUILD_DIR"
fi

# Navigate into the build directory
cd "$BUILD_DIR" || exit

# Clean previous build artifacts
rm -rf CMakeCache.txt CMakeFiles 
rm Testing tests WeatherDashboardApp_*

# Run CMake to configure the project
cmake ..

# Build the project
make

# Run the tests using ctest
ctest --output-on-failure
