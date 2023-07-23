cmake_minimum_required (VERSION 3.18)

if(USE_STATIC_RUNTIME)
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
endif()

project ("vcpkg_verifier")

add_subdirectory(src)