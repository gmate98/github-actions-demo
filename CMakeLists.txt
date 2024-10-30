cmake_minimum_required(VERSION 3.10)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Make 32Bit
set(CMAKE_C_FLAGS -m32)
set(CMAKE_CXX_FLAGS -m32)

# Set build type
set(CMAKE_BUILD_TYPE Debug)

project(MyProject)

# Add executable for main program
add_executable(MyProject src/main.cpp)

# # Add executable for tests
# add_executable(MyTests tests/test_main.cpp)

# # Find and link GoogleTest
# find_package(GTest REQUIRED)
# target_link_libraries(MyTests GTest::GTest GTest::Main)

enable_testing()
include(GoogleTest)
add_subdirectory("externals/googletest")
add_subdirectory(tests)
