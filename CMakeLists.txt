# Socket static library
file(GLOB_RECURSE IMGUI_SOURCES
    "*.cpp"
    "*.c")  

file(GLOB_RECURSE IMGUI_HEADERS
    "*.h"
    "*.hpp") 

file(GLOB_RECURSE EXCLUDE_FILES
    "${CMAKE_CURRENT_SOURCE_DIR}/backends/*"
    "${CMAKE_CURRENT_SOURCE_DIR}/examples/*"
    "${CMAKE_CURRENT_SOURCE_DIR}/misc/freetype/*"
)

foreach(file ${EXCLUDE_FILES})
    list(REMOVE_ITEM IMGUI_SOURCES ${file})
    list(REMOVE_ITEM IMGUI_HEADERS ${file})
endforeach()

file(GLOB_RECURSE IMGUI_BACKEND
    "${CMAKE_CURRENT_SOURCE_DIR}/backends/imgui_impl_opengl3.h"
    "${CMAKE_CURRENT_SOURCE_DIR}/backends/imgui_impl_opengl3.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/backends/imgui_impl_glfw.h"
    "${CMAKE_CURRENT_SOURCE_DIR}/backends/imgui_impl_glfw.cpp"
)

add_library(imgui STATIC ${IMGUI_SOURCES} ${IMGUI_HEADERS} ${IMGUI_BACKEND})
  
create_source_groups(${CMAKE_CURRENT_SOURCE_DIR})

target_include_directories(imgui PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(imgui PRIVATE glfw)

target_compile_features(imgui PUBLIC cxx_std_17)