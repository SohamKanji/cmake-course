set(EXECUTABLE_SOURCE_FILES "main.cc")

add_executable(${EXECUTABLE_NAME} ${EXECUTABLE_SOURCE_FILES})
target_link_libraries(${EXECUTABLE_NAME} PUBLIC 
    Library
    nlohmann_json
)