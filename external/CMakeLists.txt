set(ExternalFolder "external")

if(NOT TARGET FMOD)
    include(fmod.cmake)
endif()

if(NOT TARGET headers)
    add_library(headers INTERFACE)
    target_include_directories(headers INTERFACE ${ExternalDir})
    target_include_directories(headers INTERFACE ${FmodIncludeDir})
endif()