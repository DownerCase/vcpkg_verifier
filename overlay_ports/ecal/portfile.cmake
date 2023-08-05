if (VCPKG_TARGET_IS_WINDOWS)
    vcpkg_check_linkage(ONLY_STATIC_LIBRARY)
endif()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO eclipse-ecal/ecal
    REF v5.11.5
    SHA512 5048f332e72892deeaf2d90b8e4193ef3e05187fbccde22ae1561fe40d2a9a2617749cf91a546f7dad456ecd2438e6d6d6b59304656b2e2769e7036100c37a99
    HEAD_REF master
    PATCHES
        0001-disable-app-plugins.patch
        0002-fix-build.patch
        0003-fix-dependencies.patch
        0004-install-cmake-files-to-share.patch
        0005-remove-install-prefix-macro-value.patch
        0006-use-find_dependency-in-cmake-config.patch
        0007-allow-static-build-of-core.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DHAS_HDF5=ON
        -DHAS_QT5=OFF
        -DHAS_CURL=OFF
        -DHAS_CAPNPROTO=OFF
        -DHAS_FTXUI=OFF
        -DBUILD_DOCS=OFF
        -DBUILD_APPS=OFF
        -DBUILD_SAMPLES=OFF
        -DBUILD_TIME=OFF
        -DBUILD_PY_BINDING=OFF
        -DBUILD_CSHARP_BINDING=OFF
        -DBUILD_ECAL_TESTS=OFF
        -DECAL_LAYER_ICEORYX=OFF
        -DECAL_INCLUDE_PY_SAMPLES=OFF
        -DECAL_INSTALL_SAMPLE_SOURCES=OFF
        -DECAL_JOIN_MULTICAST_TWICE=OFF
        -DECAL_NPCAP_SUPPORT=OFF
        -DECAL_THIRDPARTY_BUILD_CMAKE_FUNCTIONS=ON
        -DECAL_THIRDPARTY_BUILD_SPDLOG=OFF
        -DECAL_THIRDPARTY_BUILD_TINYXML2=OFF
        -DECAL_THIRDPARTY_BUILD_FINEFTP=OFF
        -DECAL_THIRDPARTY_BUILD_TERMCOLOR=OFF
        -DECAL_THIRDPARTY_BUILD_TCP_PUBSUB=OFF
        -DECAL_THIRDPARTY_BUILD_RECYCLE=OFF
        -DECAL_THIRDPARTY_BUILD_FTXUI=OFF
        -DECAL_THIRDPARTY_BUILD_GTEST=OFF
        -DECAL_THIRDPARTY_BUILD_UDPCAP=OFF
        -DECAL_THIRDPARTY_BUILD_PROTOBUF=OFF
        -DECAL_THIRDPARTY_BUILD_YAML-CPP=OFF
        -DECAL_THIRDPARTY_BUILD_CURL=OFF
        -DECAL_THIRDPARTY_BUILD_HDF5=OFF
        -DCPACK_PACK_WITH_INNOSETUP=OFF
        -DDISABLE_FIND_PACKAGE_OVERLOAD=ON # From patch, disable find_package macro
        -DECAL_BUILD_VERSION="5.11.5"
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME eCAL           CONFIG_PATH share/eCAL)

# Remove extra debug files
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

# Don't need global ini files
if (VCPKG_TARGET_IS_WINDOWS)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/cfg" "${CURRENT_PACKAGES_DIR}/debug/cfg")
else()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/etc" "${CURRENT_PACKAGES_DIR}/debug/etc")
endif()

# Install copyright and usage
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
