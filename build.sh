#!/bin/bash

cd build

# Clean up old build
rm -rf CMakeCache.txt CMakeFiles 
rm WeatherDashboardApp_*

# Generate CMake Files
cmake ..

# Build Project
make