cmake_minimum_required(VERSION 3.0)
project(VoxelEngine)

# Set the C++ standard and other flags
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add the include directories for headers
include_directories(include)
include_directories("/opt/homebrew/Cellar/glfw/3.4/include")

# Add your source files (C and C++ files together)
set(SOURCE_FILES
    src/main.cpp
    src/core/glad.c
)

# Create the executable target from the source files
add_executable(voxel-engine.exe ${SOURCE_FILES})

# Compile options for both C and C++ code
target_compile_options(voxel-engine.exe PRIVATE -g)

# Link libraries (GLFW, OpenGL, and Cocoa frameworks)
target_link_libraries(voxel-engine.exe PRIVATE
    /opt/homebrew/Cellar/glfw/3.4/lib/libglfw.3.4.dylib
    "-framework OpenGL"
    "-framework Cocoa"
)

# Add custom command for running the executable
add_custom_target(run
    COMMAND ${CMAKE_BINARY_DIR}/voxel-engine.exe
    DEPENDS voxel-engine.exe
)