find_package(Boost REQUIRED COMPONENTS unit_test_framework CONFIG)

# Find all .cpp files in the tests directory
file(GLOB TEST_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp" "${CMAKE_CURRENT_SOURCE_DIR}/**/*.cpp")

# Create a test executable
add_executable(test_WeatherDashboardApp ${TEST_SOURCES})

# Add new boost libs as needed
target_link_libraries(test_WeatherDashboardApp
    PRIVATE Boost::unit_test_framework
)

# Register the test with CTest
add_test(NAME WeatherDashboardMockTests COMMAND test_WeatherDashboardApp)
