
find_package(unofficial-inih 57 CONFIG REQUIRED)

add_executable(inireader-example INIReaderExample.cpp)
target_link_libraries(inireader-example PRIVATE unofficial::inih::inireader)