cmake_minimum_required(VERSION 3.0.2)
project(app VERSION 1.0.0)

configure_file(config.h.in config.h @ONLY)

find_package(Qt5Widgets)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

add_executable(app WIN32 main.cpp mainwindow.cpp)
target_link_libraries(app Qt5::Widgets)