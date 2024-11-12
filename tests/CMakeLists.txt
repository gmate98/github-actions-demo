macro(set_test_target_include target)
    target_include_directories(${target} PRIVATE ${CMAKE_SOURCE_DIR})
    target_include_directories(${target} PRIVATE ${CMAKE_SOURCE_DIR}/mcu_test_proj/Drivers/STM32L1xx_HAL_Driver/Inc)
    target_include_directories(${target} PRIVATE ${CMAKE_SOURCE_DIR}/mcu_test_proj/Drivers/CMSIS/Device/ST/STM32L1xx/Include)
    target_include_directories(${target} PRIVATE ${CMAKE_SOURCE_DIR}/mcu_test_proj/Drivers/CMSIS/Include)
    target_include_directories(${target} PRIVATE ${CMAKE_SOURCE_DIR}/externals/googletest/googletest/include)
    target_include_directories(${target} PRIVATE ${CMAKE_SOURCE_DIR}/externals/googletest/googlemock/include)
    target_include_directories(${target} PRIVATE ${CMAKE_SOURCE_DIR}/mcu_test_proj/Core/Inc)
endmacro(set_test_target_include)

macro(set_test_target_include_and_links target)
    set_test_target_include(${target})
    target_link_libraries(${target} gtest gmock gmock_main)
endmacro(set_test_target_include_and_links)

add_executable(test_toggle src/test_toggle.cpp)
set_test_target_include_and_links(test_toggle)
target_link_libraries(test_toggle 
    hal_mc
    testhelper_stm32_hal_gpio_toggle_pin)
add_test(TestToggle test_toggle)

add_subdirectory(src/helper)

