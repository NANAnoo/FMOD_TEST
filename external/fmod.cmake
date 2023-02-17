set(FmodSourceDir ${ExternalDir}/FMOD)


if (${IS_ARM_MAC}) 
    set(FmodCoreDyLibFile "${FmodSourceDir}/core/lib/arm_macos/libfmod.dylib")
    set(FmodFsBankDyLibFile "${FmodSourceDir}/fsbank/lib/arm_macos/libfsbank.dylib")
    set(FmodStudioDyLibFile "${FmodSourceDir}/studio/lib/arm_macos/libfmodstudio.dylib")
elseif(WIN32)

endif()

set(FmodLibFile
    ${FmodCoreDyLibFile}
    ${FmodFsBankDyLibFile}
    ${FmodStudioDyLibFile}
)

set(FmodIncludeDir
    "${FmodSourceDir}/core/inc"
    "${FmodSourceDir}/fsbank/inc"
    "${FmodSourceDir}/studio/inc"
)

add_library(FMOD_CORE SHARED IMPORTED GLOBAL)
add_library(FMOD::Core ALIAS FMOD_CORE)
set_target_properties(FMOD_CORE PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${FmodSourceDir}/core/inc")
set_target_properties(FMOD_CORE PROPERTIES IMPORTED_IMPLIB ${FmodCoreDyLibFile})
set_target_properties(FMOD_CORE PROPERTIES IMPORTED_LOCATION ${FmodCoreDyLibFile})


add_library(FMOD_FSBANK SHARED IMPORTED GLOBAL)
add_library(FMOD::Fsbank ALIAS FMOD_FSBANK)
set_target_properties(FMOD_FSBANK PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${FmodSourceDir}/fsbank/inc")
set_target_properties(FMOD_FSBANK PROPERTIES IMPORTED_IMPLIB ${FmodFsBankDyLibFile})
set_target_properties(FMOD_FSBANK PROPERTIES IMPORTED_LOCATION ${FmodFsBankDyLibFile})



add_library(FMOD_STUDIO SHARED IMPORTED GLOBAL)
add_library(FMOD::Studio ALIAS FMOD_STUDIO)
set_target_properties(FMOD_STUDIO PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${FmodSourceDir}/studio/inc")
set_target_properties(FMOD_STUDIO PROPERTIES IMPORTED_IMPLIB ${FmodStudioDyLibFile})
set_target_properties(FMOD_STUDIO PROPERTIES IMPORTED_LOCATION ${FmodStudioDyLibFile})

# file(COPY ${FmodLibFile} DESTINATION ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})