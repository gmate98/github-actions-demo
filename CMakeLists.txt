cmake_minimum_required(VERSION 3.10)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_definitions(-DSTM32L152xE -DUSE_HAL_DRIVER)

# Make 32Bit
set(CMAKE_C_FLAGS -m32)
set(CMAKE_CXX_FLAGS -m32)

# Set build type
set(CMAKE_BUILD_TYPE Debug)

project(MyProject)

macro(set_target_includes target)
    target_include_directories(${target} PRIVATE ${CMAKE_SOURCE_DIR}/mcu_test_proj/Core/Inc)
    target_include_directories(${target} PRIVATE ${CMAKE_SOURCE_DIR}/tests/src/helper)
    target_include_directories(${target} PRIVATE ${CMAKE_SOURCE_DIR}/mcu_test_proj/Drivers/CMSIS/Device/ST/STM32L1xx/Include)
    target_include_directories(${target} PRIVATE ${CMAKE_SOURCE_DIR}/mcu_test_proj/Drivers/CMSIS/Include)
    target_include_directories(${target} PRIVATE ${CMAKE_SOURCE_DIR}/mcu_test_proj/Drivers/STM32L1xx_HAL_Driver/Inc)
endmacro(set_target_includes)

# Add library for hal 
add_library(hal_mc mcu_test_proj/Core/Src/hal.c)
set_target_includes(hal_mc)

# # Add executable for tests
# add_executable(MyTests tests/test_main.cpp)

# # Find and link GoogleTest
# find_package(GTest REQUIRED)
# target_link_libraries(MyTests GTest::GTest GTest::Main)

enable_testing()
include(GoogleTest)
add_subdirectory("externals/googletest")
add_subdirectory(tests)
