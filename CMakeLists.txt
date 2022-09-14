cmake_minimum_required(VERSION 3.0.2)
project(app VERSION 1.0.0)

configure_file(config.h.in config.h @ONLY)

find_package(Qt5Widgets)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

add_executable(app WIN32 main.cpp mainwindow.cpp)
target_link_libraries(app Qt5::Widgets)

if (CMAKE_BUILD_TYPE STREQUAL "Release")
    if (WIN32) 
        set(_binary "$<TARGET_FILE:app>")
        set(_arch "win64")
        set(_base "app-${CMAKE_PROJECT_VERSION}-${_arch}")
        set(_zip "${_base}.zip")
        add_custom_command(
            TARGET app
            POST_BUILD 
            COMMAND windeployqt ${_binary} --dir ${_base}
            COMMAND ${CMAKE_COMMAND} -E copy ${_binary} ${_base}
            COMMAND del /f ${_zip}
            COMMAND 7z a ${_zip} ${_base}
        )
    endif()
endif()
