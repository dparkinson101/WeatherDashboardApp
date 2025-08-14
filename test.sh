#!/bin/bash

# Navigate to the build directory
BUILD_DIR="build"

mkdir -p $BUILD_DIR

# Navigate into the build directory
cd "$BUILD_DIR" || exit -1

# Clean previous build artifacts
rm -rf CMakeCache.txt CMakeFiles 
rm Testing tests WeatherDashboardApp_*

# Run CMake to configure the project
cmake ..

# Build the project
make

# Run the tests using ctest
ctest --output-on-failure
