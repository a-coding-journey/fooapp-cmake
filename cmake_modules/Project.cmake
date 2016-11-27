# Set CMake options given by User
option(BUILD_SHARED_LIBS "Build Shared libraries" OFF)
option(BUILD_TESTS "Build test cases" OFF)
option(CMAKE_CXX_STANDARD_REQUIRED "Set the C++ standard set as required" OFF)

include(${CMAKE_SOURCE_DIR}/cmake_modules/deps/fooproject.cmake)

# Include Packaging settings
include(${CMAKE_SOURCE_DIR}/cmake_modules/cpack.cmake)