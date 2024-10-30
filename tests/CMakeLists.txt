macro(set_test_target_include_and_links target)
    target_include_directories(${target} PRIVATE ${CMAKE_SOURCE_DIR}/externals/googletest/googletest/include)
    target_link_libraries(${target} gtest)
endmacro(set_test_target_include_and_links)

add_executable(test_main test_main.cpp)
set_test_target_include_and_links(test_main)
add_test(TestMain test_main)