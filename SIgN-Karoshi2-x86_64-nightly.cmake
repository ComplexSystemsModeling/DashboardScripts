# maintainer: Alex Gouaillard <agouaillard@gmail.com>
# gcc (GCC) 4.2

set( arch x86_64 ) # ppc;i386;ppc64;x86_64
set( CTEST_SITE "karoshi2.SIgN" )
set( CTEST_BUILD_NAME "Darwin-c++-4.2-${arch}-WRAPITK" )
set( CTEST_BUILD_CONFIGURATION "Release" )
set( CTEST_CMAKE_GENERATOR "Unix Makefiles" )
set( CTEST_BUILD_FLAGS -j12 )
set( CTEST_TEST_ARGS PARALLEL_LEVEL 8 )
set( dashboard_root_name "Dashboards" )
set( dashboard_binary_name ITK-${arch}-WRAPITK )

set(ENV{CC}  gcc-4.2)
set(ENV{CXX} c++-4.2)
set(ENV{CFLAGS} "")
set(ENV{CXXFLAGS} "")

macro(dashboard_hook_init)
  set( dashboard_cache "
    CMAKE_OSX_ARCHITECTURES:STRING=${arch}
    BUILD_TESTING:BOOL=ON
    BUILD_EXAMPLES:BOOL=ON
    BUILD_SHARED_LIBS:BOOL=ON
    ITK_LEGACY_SILENT:BOOL=ON
    ITK_USE_REVIEW:BOOL=ON
    ITK_USE_CCACHE:BOOL=ON
    ITK_USE_SYSTEM_GCCXML:BOOL=ON
    GCCXML:FILEPATH=/Users/alexgouaillard/DEVEL/CVSROOT/gccxml/build-${arch}/bin/gccxml
    ITK_WRAP_JAVA:BOOL=ON
    ITK_WRAP_PYTHON:BOOL=ON
    ITK_WRAP_TCL:BOOL=ON
    ITK_WRAP_DOC:BOOL=ON
    PYTHON_EXECUTABLE:FILEPATH=/opt/local/bin/python2.7
    PYTHON_INCLUDE_DIR:PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/Headers
    PYTHON_LIBRARY:FILEPATH=/opt/local/lib/libpython2.7.dylib
    PY_SITE_PACKAGES_PATH:PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages
    "
    )

  if("${dashboard_model}" STREQUAL "Nightly")
    message("Making sure to use the nightly-master branch")
    execute_process(
      COMMAND "${CTEST_GIT_COMMAND}" checkout nightly-master
      WORKING_DIRECTORY "${CTEST_SOURCE_DIRECTORY}"
      )
  endif()
endmacro(dashboard_hook_init)

include(${CTEST_SCRIPT_DIRECTORY}/itk_common.cmake)
