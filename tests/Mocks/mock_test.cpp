#define BOOST_TEST_MODULE WeatherDashboardMockTests
#include <boost/test/included/unit_test.hpp>
#include "mock.h"

BOOST_AUTO_TEST_CASE(mock_test)
{
    BOOST_CHECK(testMethod() == 1);
}
