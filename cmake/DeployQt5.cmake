function(qt_install_plugins _mod)
    get_target_property(_mod_loc ${_mod} LOCATION)
    cmake_path(SET _plugins_base NORMALIZE "${_mod_loc}/../..")
    string(REGEX REPLACE "Qt[5]?[:]?[:]?" "" _mod_name ${_mod})
    foreach(_plugin ${Qt5${_mod_name}_PLUGINS})
        get_target_property(_loc ${_plugin} LOCATION)
        cmake_path(RELATIVE_PATH _loc BASE_DIRECTORY ${_plugins_base} OUTPUT_VARIABLE _rel_loc)
        cmake_path(REMOVE_FILENAME _rel_loc)
        install(IMPORTED_RUNTIME_ARTIFACTS ${_plugin} DESTINATION ${_rel_loc})
    endforeach()
endfunction()