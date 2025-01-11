set(LIBRARY_SOURCE_FILES "my_lib.cc")
set(LIBRARY_HEADER_FILES "my_lib.h")

add_library(${LIBRARY_NAME} STATIC ${LIBRARY_SOURCE_FILES} ${LIBRARY_HEADER_FILES})
target_include_directories(${LIBRARY_NAME} PUBLIC 
"./"
${CMAKE_BINARY_DIR}/configured/
)