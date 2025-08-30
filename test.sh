#!/usr/bin/env bash
set -euo pipefail

VCPKG_ROOT="${VCPKG_ROOT:-}"
if [ -z "$VCPKG_ROOT" ]; then
  if [ -d "$HOME/vcpkg" ]; then VCPKG_ROOT="$HOME/vcpkg"; fi
  if [ -d "/usr/local/vcpkg" ]; then VCPKG_ROOT="/usr/local/vcpkg"; fi
fi

if [ -n "$VCPKG_ROOT" ]; then
  VCPKG_TOOLCHAIN_FILE="${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
fi

if [ -z "${VCPKG_TOOLCHAIN_FILE:-}" ] || [ ! -f "$VCPKG_TOOLCHAIN_FILE" ]; then
  echo "Error: vcpkg toolchain file not found. Set VCPKG_ROOT or install vcpkg." >&2
  exit 1
fi

BUILD_DIR="build"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# Clean previous build artifacts
rm -rf CMakeCache.txt CMakeFiles
rm -rf Testing tests WeatherDashboardApp_*

# Configure with tests enabled
cmake -DCMAKE_TOOLCHAIN_FILE="$VCPKG_TOOLCHAIN_FILE" -DBUILD_TESTS=ON ..

# Build the project
cmake --build . --config Debug

# Run the tests
ctest --output-on-failure
