macro(set_test_helper_target_include_and_links target)
    set_test_target_include(${target})
    target_link_libraries(${target} gtest gmock)
endmacro(set_test_helper_target_include_and_links)

add_library(testhelper_stm32_hal_gpio_toggle_pin hal_gpio_togglepin.cpp)
set_test_helper_target_include_and_links(testhelper_stm32_hal_gpio_toggle_pin)