cmake_minimum_required(VERSION 3.22)

# Project setup
set(CMAKE_PROJECT_NAME mcu_test_proj)
project(${CMAKE_PROJECT_NAME})

# Define the build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug")
endif()

# Add STM32CubeMX generated sources
add_subdirectory(cmake/stm32cubemx)

# Core project settings
enable_language(C ASM)
enable_language(CXX)

# Create an executable object type
add_executable(${CMAKE_PROJECT_NAME})

# Add the modified list of sources to the executable
target_sources(${CMAKE_PROJECT_NAME} PRIVATE
    ${STM32CUBE_SOURCES}  # Include all source files
)

# Link directories setup
target_link_directories(${CMAKE_PROJECT_NAME} PRIVATE
    # Add user-defined library search paths here if needed
)

# Add include paths
target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE
    # Add user-defined include paths here
)

# Add project symbols (macros)
target_compile_definitions(${CMAKE_PROJECT_NAME} PRIVATE
    # Add user-defined symbols here
)

# Conditionally add linker options for bxarm-debug
if(CMAKE_BUILD_TYPE STREQUAL "Debug" AND CMAKE_GENERATOR_TOOLSET MATCHES "bxarm")
    target_link_options(${CMAKE_PROJECT_NAME} PRIVATE 
        --config ${PROJECT_SOURCE_DIR}/bxarm_startup/stm32l152xe_flash.icf 
        --semihosting)
endif()

# Add linked libraries
target_link_libraries(${CMAKE_PROJECT_NAME}
    stm32cubemx
    # Add user-defined libraries here
)

# Enable compile command to ease indexing with e.g. clangd
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

# Validate that STM32CubeMX code is compatible with C standard
if(CMAKE_C_STANDARD LESS 11)
    message(ERROR "Generated code requires C11 or higher")
endif()
