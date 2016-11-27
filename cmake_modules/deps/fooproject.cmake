# Use ExternalProject_Add facility
include(ExternalProject)

# Define settings
set(FooProject_INSTALL_DIR "${CMAKE_BINARY_DIR}/fooproject/install")
set(FooProject_URL "https://github.com/a-coding-journey/cmake-cpp-library.git")

# Define CMake Parameters
set(FooProject_CMAKE_BUILD_MODE "-DBUILD_SHARED_LIBS=${BUILD_SHARED_LIBS}")
set(FooProject_CMAKE_BUILD_TESTS "-DBUILD_TESTS=${BUILD_TESTS}")
set(FooProject_CMAKE_INSTALL_DIR "-DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/fooproject/install")

# Define steps
set(CONFIGURE_COMMAND cmake ${FooProject_CMAKE_BUILD_MODE} ${FooProject_CMAKE_BUILD_TESTS} ${FooProject_CMAKE_INSTALL_DIR} .)
set(BUILD_COMMAND cmake --build .)
set(INSTALL_COMMAND cmake --build . --target install)

# Find and set fooproject
ExternalProject_Add(
  FooProject
  PREFIX              fooproject
  TMP_DIR             "${CMAKE_BINARY_DIR}/fooproject/temp"
  STAMP_DIR           "${CMAKE_BINARY_DIR}/fooproject/stamp"
  #--Download step--------------
  DOWNLOAD_DIR        "${CMAKE_BINARY_DIR}/fooproject/download"
  GIT_REPOSITORY      "${FooProject_URL}"
  #--Configure step-------------
  SOURCE_DIR          "${CMAKE_BINARY_DIR}/fooproject/source"
  CONFIGURE_COMMAND   ${CONFIGURE_COMMAND}
  UPDATE_DISCONNECTED 1
  #--Build step-------------
  BUILD_COMMAND       ${BUILD_COMMAND}
  BUILD_IN_SOURCE     1
  #--Install step---------------
  INSTALL_DIR         "${FooProject_INSTALL_DIR}"
  INSTALL_COMMAND     ${INSTALL_COMMAND}
)

# Make include directory visible to CMake
set(FooProject_INCLUDE_DIR "${FooProject_INSTALL_DIR}/include")
include_directories("${FooProject_INCLUDE_DIR}")

# Import newly built library
set(FooProject_LIBRARY_DIR "${FooProject_INSTALL_DIR}/lib")

set(FooProject_LIB_PREFIX ${CMAKE_STATIC_LIBRARY_PREFIX})
set(FooProject_LIB_SUFFIX ${CMAKE_STATIC_LIBRARY_SUFFIX})
if(BUILD_SHARED_LIBS)
  add_library(fooproject SHARED IMPORTED)
  set(FooProject_LIB_PREFIX ${CMAKE_SHARED_LIBRARY_PREFIX})
  set(FooProject_LIB_SUFFIX ${CMAKE_SHARED_LIBRARY_SUFFIX})
else()
  add_library(fooproject STATIC IMPORTED)
endif()

set_target_properties(fooproject PROPERTIES IMPORTED_LOCATION "${FooProject_LIBRARY_DIR}/${FooProject_LIB_PREFIX}fooproject${FooProject_LIB_SUFFIX}")

# Install shared lib dependency
if(BUILD_SHARED_LIBS)
  file(GLOB FooProject_LIBS "${FooProject_LIBRARY_DIR}/*fooproject*")
  install(FILES ${FooProject_LIBS} DESTINATION bin)
endif()