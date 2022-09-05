cmake_minimum_required(VERSION 3.0.2)
project(app)

find_package(Qt5Widgets)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

add_executable(app main.cpp mainwindow.cpp)
target_link_libraries(app Qt5::Widgets)
