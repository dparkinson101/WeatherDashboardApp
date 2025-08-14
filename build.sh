#!/bin/bash

mkdir -p build
cd build || echo "Error: Build Folder Doesn't Exist" | exit -1

# Clean up old build
rm -rf CMakeCache.txt CMakeFiles 
rm WeatherDashboardApp_*

# Generate CMake Files
cmake -DBUILD_TESTS=OFF ..

# Build Project
make