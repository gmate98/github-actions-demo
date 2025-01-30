include(version.cmake)

#Create header file
configure_file(${SHARED_DIR}/src/version.c.in ${SHARED_DIR}/src/version.c)