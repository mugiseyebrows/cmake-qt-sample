install(CODE [[ 
    function(install_runtime_deps _lib)
        message("_lib ${_lib}")
        LIST(APPEND pre_exclude_regexes "api-ms-.*")
        LIST(APPEND pre_exclude_regexes "ext-ms-.*")
        LIST(APPEND post_exclude_regexes ".*[Ww][Ii][Nn][Dd][Oo][Ww][Ss][\\/]system32.*")
        file(GET_RUNTIME_DEPENDENCIES
            EXECUTABLES "${_lib}"
            RESOLVED_DEPENDENCIES_VAR _r_deps
            UNRESOLVED_DEPENDENCIES_VAR _u_deps
            DIRECTORIES $ENV{PATH}
            PRE_EXCLUDE_REGEXES ${pre_exclude_regexes}
            POST_EXCLUDE_REGEXES ${post_exclude_regexes}
        )
        #message("resolved ${_r_deps}")
        #message("unresolved ${_u_deps}")
        foreach(_file ${_r_deps})
            file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}" TYPE SHARED_LIBRARY FILES "${_file}")
        endforeach()
    endfunction()
]])