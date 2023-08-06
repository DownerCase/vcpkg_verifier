cmake_minimum_required(VERSION 3.19)
project(
  inih
  VERSION 56
  LANGUAGES C CXX)

 # Create and install version file
include(CMakePackageConfigHelpers)

set(VERSION_FILE_PATH "${CMAKE_CURRENT_BINARY_DIR}/unofficial-${PROJECT_NAME}ConfigVersion.cmake")
set(CONFIG_FILE_PATH "${CMAKE_CURRENT_BINARY_DIR}/unofficial-${PROJECT_NAME}Config.cmake")
set(INIH_INSTALL_CMAKE_DIR "share/unofficial-${PROJECT_NAME}")

write_basic_package_version_file(
  "${VERSION_FILE_PATH}"
  VERSION       "${PROJECT_VERSION}"
  COMPATIBILITY SameMajorVersion
)

configure_package_config_file( 
    "${CMAKE_CURRENT_LIST_DIR}/unofficial-inihConfig.cmake.in"
    "${CONFIG_FILE_PATH}" 
    INSTALL_DESTINATION "${INIH_INSTALL_CMAKE_DIR}"
    NO_CHECK_REQUIRED_COMPONENTS_MACRO
)

install(FILES 
          "${VERSION_FILE_PATH}"
          "${CONFIG_FILE_PATH}"
        DESTINATION "${INIH_INSTALL_CMAKE_DIR}"
)

#set(Header_Files "ini.h")
#set(Source_Files "ini.c")

# TODO: Put this as vcpkg-feature before `project(` so can do `LANGUAGES C` if false
# option(with_INIReader "build the C++ library" OFF)
# if (with_INIReader)
#   list(APPEND Header_Files "cpp/INIReader.h")
#   list(APPEND Source_Files "cpp/INIReader.cpp")
# endif (with_INIReader)

# add_library("${PROJECT_NAME}" "${Header_Files}" "${Source_Files}")

# include(GNUInstallDirs)
# target_include_directories(
#   "${PROJECT_NAME}"
#   PUBLIC
#   "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>"
#   "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
# )
# target_compile_features("${PROJECT_NAME}" PRIVATE c_std_90)
# set_target_properties("${PROJECT_NAME}" PROPERTIES C_VISIBILITY_PRESET hidden
#                       PUBLIC_HEADER "${Header_Files}")

# install(
#   TARGETS                   "${PROJECT_NAME}"
#   EXPORT                    "unofficial-${PROJECT_NAME}Config"
#   RUNTIME       DESTINATION "${CMAKE_INSTALL_BINDIR}"
#   ARCHIVE       DESTINATION "${CMAKE_INSTALL_LIBDIR}"
#   LIBRARY       DESTINATION "${CMAKE_INSTALL_LIBDIR}"
#   PUBLIC_HEADER DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
# )

# install(
#   EXPORT      "unofficial-${PROJECT_NAME}Config"
#   FILE        "unofficial-${PROJECT_NAME}Config.cmake"
#   NAMESPACE   "unofficial::${PROJECT_NAME}::"
#   DESTINATION "share/unofficial-${PROJECT_NAME}")
# 
# export(PACKAGE "${PROJECT_NAME}")
