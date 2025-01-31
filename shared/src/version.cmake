find_package(Git)

if(NOT GIT_FOUND)
    message(FATAL_ERROR "Git needed")
endif()

# Check if the directory is a git directory
execute_process(COMMAND ${GIT_EXECUTABLE} rev-parse
                WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
                RESULT_VARIABLE IS_GIT_RESULT)
if(NOT IS_GIT_RESULT EQUAL 0)
    message(FATAL_ERROR "${CMAKE_SOURCE_DIR} is not a git repository")
endif()

#get commit hash
execute_process(COMMAND ${GIT_EXECUTABLE} rev-parse HEAD
                WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
                OUTPUT_VARIABLE GIT_HASH)
string(REGEX REPLACE "\n$" "" GIT_HASH "${GIT_HASH}")
string(SUBSTRING ${GIT_HASH} 0 7 GIT_HASH_SHORT)
string(SUBSTRING ${GIT_HASH} 0 2 GIT_HASH_P1)
string(SUBSTRING ${GIT_HASH} 2 2 GIT_HASH_P2)
string(SUBSTRING ${GIT_HASH} 4 2 GIT_HASH_P3)
string(SUBSTRING ${GIT_HASH} 6 2 GIT_HASH_P4)


# Get version tag
execute_process(COMMAND ${GIT_EXECUTABLE} tag --sort=-v:refname --merged
                WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
                OUTPUT_VARIABLE GIT_TAGS)
message(STATUS "${GIT_TAGS}")
string(REPLACE "'\n'" ";" GIT_TAGS_ARRAY "${GIT_TAGS}")
foreach(TAGS_LOOP ${GIT_TAGS_ARRAY})
    string(REGEX MATCH "^v([0-9]|[1-9][0-9]+).([0-9]|[1-9][0-9]+).([0-9]|[1-9][0-9]+)(-[Rr][Cc])?$" VERSION_MATCH ${TAGS_LOOP})
    if(NOT ${VERSION_MATCH} STREQUAL "")
        set(MAJOR ${CMAKE_MATCH_1})
        set(MINOR ${CMAKE_MATCH_2})
        set(PATCH ${CMAKE_MATCH_3})
        if(${CMAKE_MATCH_COUNT} EQUAL 4)
            set(TAG_HAS_RC TRUE)
        endif()
        break()
    endif()
endforeach(TAGS_LOOP)
if (NOT DEFINED MAJOR)
    message(STATUS "${GIT_TAGS_ARRAY}")
    message(FATAL_ERROR "No version found")
endif()

# Get current branch
execute_process(COMMAND ${GIT_EXECUTABLE} branch --contains ${GIT_HASH}
                WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
                OUTPUT_VARIABLE GIT_BRANCH)
# string(REGEX REPLACE "\n$" "" GIT_BRANCH "${GIT_BRANCH}")
if (${GIT_BRANCH} MATCHES "master\n")
    set(ON_MASTER TRUE)
endif()
if (${GIT_BRANCH} MATCHES "development\n")
    set(ON_DEV TRUE)
endif()

# Check if rc tag on master
if (DEFINED TAG_HAS_RC AND DEFINED ON_MASTER)
    message(FATAL_ERROR "RC Tag not allowed on master")
endif()

# Is development?
if (NOT DEFINED ON_MASTER AND NOT DEFINED ON_DEV)
    set(IS_DEV TRUE)
endif()

#check if dirty
execute_process(COMMAND ${GIT_EXECUTABLE} describe --always --dirty=.dirty
                WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
                OUTPUT_VARIABLE GIT_DIRTY)
string(REGEX REPLACE "\n$" "" GIT_DIRTY "${GIT_DIRTY}")
if (${GIT_DIRTY} MATCHES "\\.dirty$")
    set(IS_DIRTY TRUE)
endif()

# Create complete version string
if(DEFINED TAG_HAS_RC)
    set(RC_STR "-rc")
    set(RC_FLAG 1)
else()
    set(RC_STR "")
    set(RC_FLAG 0)
endif()
if(DEFINED IS_DEV)
    set(DEV_STR ".dev")
    set(DEV_FLAG 1)
else()
    set(DEV_STR "")
    set(DEV_FLAG 0)
endif()
if(DEFINED IS_DIRTY)
    set(DIRTY_STR ".dirty")
    set(DIRTY_FLAG 1)
else()
    set(DIRTY_STR "")
    set(DIRTY_FLAG 0)
endif()
set(VERSION_STRING "v${MAJOR}.${MINOR}.${PATCH}${RC_STR}+${GIT_HASH_SHORT}${DEV_STR}${DIRTY_STR}")

message(STATUS "Version: ${VERSION_STRING}")