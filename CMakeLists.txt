cmake_minimum_required(VERSION 3.22)

set(CMAKE_CXX_STANDARD 20)

project(Sparrow LANGUAGES CXX C)

if (APPLE)
    execute_process(
        COMMAND uname -m
        OUTPUT_VARIABLE ARCH
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    if (ARCH STREQUAL "arm64")
        set(IS_ARM_MAC TRUE)
    else()
        set(IS_ARM_MAC FALSE)
    endif()
else()
    set(IS_ARM_MAC FALSE)
endif()

set(ProjectRootDir "${CMAKE_CURRENT_SOURCE_DIR}")
set(ExternalDir "${ProjectRootDir}/external")
set(SoundDir "${ProjectRootDir}/sounds")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

add_subdirectory(external)

add_executable(fmodtest "main.cpp")

target_include_directories(fmodtest PRIVATE ${ExternalDir})

target_link_libraries(fmodtest PUBLIC headers
    PUBLIC FMOD::Core FMOD::Fsbank FMOD::Studio)

FILE(COPY ${SoundDir} DESTINATION ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})