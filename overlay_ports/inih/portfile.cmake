vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO benhoyt/inih
    REF 5e1d9e2625842dddb3f9c086a50f22e4f45dfc2b # r56
    SHA512 477a66643f6636a5826a1206c6588a12827e24a4a2609e11f0695888998e2bfcba8bdb2240c561404ee675bf4c72e85d7d008a1fbddb142c0d263b413de8d358
    HEAD_REF master
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        cpp with_INIReader
)

string(REPLACE "OFF" "false" FEATURE_OPTIONS "${FEATURE_OPTIONS}")
string(REPLACE "ON" "true" FEATURE_OPTIONS "${FEATURE_OPTIONS}")

vcpkg_configure_meson(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_install_meson()

vcpkg_fixup_pkgconfig()
vcpkg_copy_pdbs()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

#file(WRITE "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" [=[
#inih provides CMake targets:
#    find_package(unofficial-inih CONFIG REQUIRED)
#    target_link_libraries(main PRIVATE unofficial::inih::inih)
#]=])

#file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share"
#                    "${CURRENT_PACKAGES_DIR}/debug/include")
