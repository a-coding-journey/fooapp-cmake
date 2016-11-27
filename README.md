# fooapp-cmake

This example shows how to create a modular CMake based application, including the foolibrary-cmake, downloaded, built and linked in the final executable

# How to build the code

Basically, this application exposes the properties needed by the foolibrary-cmake project.

You have the choice to build a shared or a static library, by setting the CMake option *BUILD_SHARED_LIBS* and it's possible to define the install prefix with *CMAKE_INSTALL_PREFIX* (the installation directory, which is by default /usr/ in Linux and C:\Program Files in Windows).

The generation of test is enabled by default, but it can be turned off by setting *BUILD_TESTS* to OFF.

Type in your command line terminal (e.g. in Linux):

`cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=$(pwd)/install ..`

and then

`cmake --build .`

If you want to create a compressed package, you can use CPack:

`cpack`