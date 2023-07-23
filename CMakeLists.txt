cmake_minimum_required (VERSION 3.18)

if(USE_STATIC_RUNTIME)
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
endif()

project ("vcpkg_verifier")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(eCAL 5.11 CONFIG REQUIRED)

# Add source to this project's executable.
add_executable (ecal_vcpkg_verifier "ecal_vcpkg_verifier.cpp")
target_link_libraries(ecal_vcpkg_verifier eCAL::core_c)

add_subdirectory(samples)

# Samples to run to verify correct operation:
# eCAL::core_c
# - minimal_rec && minimal_snd
# - minimal_<client/server>_c

# eCAL::core
# ping && pong

# eCAL::core w/ Protobuf
# person_<snd/rcv>

# eCAL::core_pb
# monitoring_<rec/reg>

# eCAL::hdf5
# measurement_<read/write>