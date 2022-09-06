cmake_minimum_required(VERSION 3.0.2)
project(app)

find_package(Qt5Widgets)
find_package(Qt5Core)
find_package(Qt5Gui)

include(CPack)

cmake_policy(SET CMP0087 NEW)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

add_executable(app WIN32 main.cpp mainwindow.cpp)
target_link_libraries(app Qt5::Widgets)

install(TARGETS app RUNTIME DESTINATION ".")

if (WIN32)
    get_target_property(core_loc Qt5::Core LOCATION)
    cmake_path(SET plugins_base NORMALIZE "${core_loc}/../..")
    foreach(plugin ${Qt5Widgets_PLUGINS} ${Qt5Core_PLUGINS} ${Qt5Gui_PLUGINS})
        get_target_property(loc ${plugin} LOCATION)
        cmake_path(RELATIVE_PATH loc BASE_DIRECTORY ${plugins_base} OUTPUT_VARIABLE rel_loc)
        cmake_path(REMOVE_FILENAME rel_loc)
        install(IMPORTED_RUNTIME_ARTIFACTS ${plugin} DESTINATION ${rel_loc})
    endforeach()
    install(CODE [[
        file(GET_RUNTIME_DEPENDENCIES
            EXECUTABLES $<TARGET_FILE:app>
            RESOLVED_DEPENDENCIES_VAR _r_deps
            UNRESOLVED_DEPENDENCIES_VAR _u_deps
            DIRECTORIES $ENV{PATH}
            POST_EXCLUDE_REGEXES "[Cc]:.[Ww]indows"
        )
        #message("resolved ${_r_deps}")
        #message("unresolved ${_u_deps}")
        foreach(_file ${_r_deps})
            file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}" TYPE SHARED_LIBRARY FILES "${_file}")
        endforeach()
    ]])
endif()


