cmake_minimum_required(VERSION 3.2.0 FATAL_ERROR)

project("example_app" CXX)
set(PROJECT_VERSION 1.0.0)

# Including Library settings
include(cmake_modules/Project.cmake)

# Define target
include_directories(include)
add_executable(${PROJECT_NAME} src/hello_app.cpp)
add_dependencies(${PROJECT_NAME} FooProject)
set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 14)
target_link_libraries(${PROJECT_NAME} fooproject)

# Define installation 
install(TARGETS ${PROJECT_NAME}
  RUNTIME DESTINATION bin
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
)