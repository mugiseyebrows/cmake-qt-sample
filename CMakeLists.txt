cmake_minimum_required(VERSION 3.0.2)
project(app VERSION 1.0.0)

configure_file(config.h.in config.h @ONLY)

include(cmake/DeployQt5.cmake)
include(cmake/InstallRuntimeDeps.cmake)

find_package(Qt5Widgets)
find_package(Qt5Core)
find_package(Qt5Gui)

include(CPack)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

add_executable(app WIN32 main.cpp mainwindow.cpp)
target_link_libraries(app Qt5::Widgets)

if(WIN32) 
    install(TARGETS app RUNTIME DESTINATION ".")
    qt_install_plugins(Qt5::Core)
    qt_install_plugins(Qt5::Gui)
    qt_install_plugins(Qt5::Widgets)
    set(app_bin "${CMAKE_BINARY_DIR}/app.exe")
    install(CODE "install_runtime_deps(${app_bin})")
endif()
