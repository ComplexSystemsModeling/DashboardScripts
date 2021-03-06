# maintainer: Alex Gouaillard <agouaillard@gmail.com>
# gcc (GCC) 4.2

set( arch x86_64 ) # ppc;i386;ppc64;x86_64
set( CTEST_SITE "karoshi2.SIgN" )
set( CTEST_BUILD_NAME "Darwin-c++-4.2-${arch}-SYSTEM-GDCM-FORK" )
set( CTEST_BUILD_CONFIGURATION "Release" )
set( CTEST_CMAKE_GENERATOR "Unix Makefiles" )
set( CTEST_BUILD_FLAGS -j12 )
set( CTEST_TEST_ARGS PARALLEL_LEVEL 8 )
set( dashboard_root_name "Dashboards" )
set( dashboard_binary_name ITK-${arch}-SYSTEM-GDCM-FORK )

set(ENV{CC}  gcc)
set(ENV{CXX} g++)

macro(dashboard_hook_init)
  set( dashboard_cache "
    CMAKE_OSX_ARCHITECTURES:STRING=${arch}
    BUILD_TESTING:BOOL=ON
    BUILD_EXAMPLES:BOOL=ON
    BUILD_SHARED_LIBS:BOOL=ON
    ITK_LEGACY_SILENT:BOOL=ON
    ITK_USE_REVIEW:BOOL=ON
    ITK_USE_SYSTEM_GDCM:BOOL=ON
    GDCM_DIR:PATH=/Users/alexgouaillard/DEVEL/GITROOT/GDCM-FORK-Build-x86_64
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
