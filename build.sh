#!/usr/bin/env bash
set -euo pipefail

export VCPKG_ROOT=$HOME/vcpkg

VCPKG_ROOT="${VCPKG_ROOT:-}"  # optional env override
# If not set, try common locations or expect vcpkg on PATH
if [ -z "$VCPKG_ROOT" ]; then
  if command -v vcpkg >/dev/null 2>&1; then
    VCPKG_TOOLCHAIN_FILE="$(vcpkg --print-triplet 2>/dev/null >/dev/null || true)"
    # fallback: we still need a toolchain path; try relative common path
    VCPKG_ROOT=""
  else
    # try common install locations
    if [ -d "$HOME/vcpkg" ]; then VCPKG_ROOT="$HOME/vcpkg"; fi
    if [ -d "/usr/local/vcpkg" ]; then VCPKG_ROOT="/usr/local/vcpkg"; fi
  fi
fi

if [ -n "$VCPKG_ROOT" ]; then
  VCPKG_TOOLCHAIN_FILE="${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
fi

if [ -z "${VCPKG_TOOLCHAIN_FILE:-}" ] || [ ! -f "$VCPKG_TOOLCHAIN_FILE" ]; then
  echo "Error: vcpkg toolchain file not found. Set VCPKG_ROOT or put vcpkg on PATH." >&2
  exit 1
fi

BUILD_DIR="build"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# Clean up old build
rm -rf CMakeCache.txt CMakeFiles
rm -f WeatherDashboardApp_*

# Generate CMake Files
cmake -DCMAKE_TOOLCHAIN_FILE="$VCPKG_TOOLCHAIN_FILE" -DBUILD_TESTS=OFF ..

# Build Project
cmake --build . --config Release
