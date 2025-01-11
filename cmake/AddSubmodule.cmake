function(add_submodule dir)
    find_package(GIT REQUIRED)

    if(NOT EXISTS ${CMAKE_SOURCE_DIR}/${dir}/CMakeLists.txt)
        execute_process(
            COMMAND ${GIT_EXECUTABLE} submodule update --init --recursive -- ${CMAKE_SOURCE_DIR}/${dir}
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
    endif()

    if(EXISTS ${CMAKE_SOURCE_DIR}/${dir}/CMakeLists.txt)
        add_subdirectory(${dir})
    else()
        message(FATAL_ERROR "Submodule ${dir} not found")
    endif()
endfunction()
