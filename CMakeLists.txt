cmake_minimum_required(VERSION 3.10.2)
project("resample" C)
add_library(resample SHARED src/filterkit.c src/resample.c src/resamplesubs.c)
set_target_properties(resample PROPERTIES PUBLIC_HEADER include/libresample.h)
target_include_directories(resample PUBLIC include)

# Prepare install targets

install(TARGETS resample EXPORT resample-targets
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION bin
  INCLUDES DESTINATION include
)
install(
  FILES ${CMAKE_SOURCE_DIR}/include/libresample.h
  DESTINATION
    include
  COMPONENT
    Devel
)
