if (VCPKG_TARGET_IS_WINDOWS)
    vcpkg_check_linkage(ONLY_STATIC_LIBRARY)
endif()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO eclipse-ecal/ecal
    REF v5.11.4
    SHA512 c340c336ed36d9c85990d2bf1f755bd32ea620eaeca6253565c1db8c1fdac7ec0e3ac934fedf396f8258d451c37d48a750ed5ba331a6b9b1822ae92962c0528a
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
        -DECAL_BUILD_VERSION="5.11.4"
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()

# Install the helper_functions scripts first
# file(INSTALL "${CURRENT_PACKAGES_DIR}/lib/cmake/eCAL/helper_functions" DESTINATION "${CURRENT_PACKAGES_DIR}/share/eCAL")

vcpkg_cmake_config_fixup(PACKAGE_NAME eCAL           CONFIG_PATH share/eCAL)
vcpkg_cmake_config_fixup(PACKAGE_NAME CMakeFunctions CONFIG_PATH cmake)

# Remove extra debug files
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

# Don't need global ini files
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/cfg" "${CURRENT_PACKAGES_DIR}/debug/cfg")

file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)