cmake_minimum_required(VERSION 3.22)

# Project setup
project(mcu_test_proj)

# Core project settings
enable_language(C ASM)

# Define the build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug")
endif()

# Define variables and glob files
set(SHARED_DIR ../shared)

# Add STM32CubeMX generated sources
add_subdirectory(cmake/stm32cubemx)

# Define a custom target that uses the custom command
execute_process(COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_SOURCE_DIR}/${SHARED_DIR}/src/version_output.cmake
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${SHARED_DIR}/src)

# Create an executable object type
add_executable(${CMAKE_PROJECT_NAME})

# Add the modified list of sources to the executable
target_sources(${CMAKE_PROJECT_NAME} PRIVATE
    ${SHARED_DIR}/src/version.c
    # Add user sources here
)

# Link directories setup
target_link_directories(${CMAKE_PROJECT_NAME} PRIVATE
    # Add user-defined library search paths here if needed
)

# Add include paths
target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE
    ${SHARED_DIR}/inc
    # Add user-defined include paths here
)

# Add project symbols (macros)
target_compile_definitions(${CMAKE_PROJECT_NAME} PRIVATE
    # Add user-defined symbols here
)

# Add linked libraries
target_link_libraries(${CMAKE_PROJECT_NAME}
    stm32cubemx
    # Add user-defined libraries here
)

# Validate that STM32CubeMX code is compatible with C standard
if(CMAKE_C_STANDARD LESS 11)
    message(ERROR "Generated code requires C11 or higher")
endif()

# Enable compile command to ease indexing with e.g. clangd
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)
