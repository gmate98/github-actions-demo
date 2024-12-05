# Toolchain File for the IAR C/C++ Compiler

set(CMAKE_SYSTEM_NAME Generic)

# Define compilers
set(CMAKE_ASM_COMPILER /opt/iarsystems/bxarm/arm/bin/iasmarm)
set(CMAKE_C_COMPILER   /opt/iarsystems/bxarm/arm/bin/iccarm)
set(CMAKE_CXX_COMPILER /opt/iarsystems/bxarm/arm/bin/iccarm)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# Specify general C flags
set(CMAKE_C_FLAGS "-e --dlib_config full")
#set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS} --debug")
#set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS}")

# Avoid explicitly setting C11 if not supported

# Linker flags

# Ninja generator compatibility
if(CMAKE_GENERATOR MATCHES "^Ninja.*$")
  find_program(CMAKE_MAKE_PROGRAM
    NAMES ninja
    PATHS $ENV{PATH}
          /opt/iarsystems/bxarm/common/bin
    REQUIRED)
endif()
