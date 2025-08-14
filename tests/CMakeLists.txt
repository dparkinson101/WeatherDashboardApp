# Find all .cpp files in the tests directory
file(GLOB TEST_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp" "${CMAKE_CURRENT_SOURCE_DIR}/**/*.cpp")

# Create a test executable
add_executable(test_WeatherDashboardApp ${TEST_SOURCES})

# Ensure the test executable depends on the Boost project
add_dependencies(test_WeatherDashboardApp Boost)

# Register the test with CTest
add_test(NAME WeatherDashboardMockTests COMMAND test_WeatherDashboardApp)
