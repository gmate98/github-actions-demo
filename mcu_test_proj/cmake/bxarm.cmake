# Toolchain File for the IAR C/C++ toolchain

set(CMAKE_SYSTEM_NAME               Generic)
set(CMAKE_SYSTEM_PROCESSOR          arm)

# Define compilers
set(CMAKE_ASM_COMPILER /opt/iarsystems/bxarmfs/arm/bin/iasmarm)
set(CMAKE_C_COMPILER   /opt/iarsystems/bxarmfs/arm/bin/iccarm)
set(CMAKE_CXX_COMPILER /opt/iarsystems/bxarmfs/arm/bin/iccarm)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# Specify general C flags
set(CMAKE_C_FLAGS "-e --dlib_config full --cpu=cortex-m3")
#set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS} --debug")
#set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS}")

# Linker flags
set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} --config \"${PROJECT_SOURCE_DIR}/cmake/bxarm/stm32l152xe_flash.icf\" --semihosting")

# Ninja generator compatibility
if(CMAKE_GENERATOR MATCHES "^Ninja.*$")
  find_program(CMAKE_MAKE_PROGRAM
    NAMES ninja
    PATHS $ENV{PATH}
          /opt/iarsystems/bxarm/common/bin
    REQUIRED)
endif()
