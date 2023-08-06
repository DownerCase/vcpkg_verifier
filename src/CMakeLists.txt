
find_package(unofficial-inih CONFIG REQUIRED)

add_executable(dummy main.cpp)
target_link_libraries(dummy PRIVATE unofficial::inih::inih)