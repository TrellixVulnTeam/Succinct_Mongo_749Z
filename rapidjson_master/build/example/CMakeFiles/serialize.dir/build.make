# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.13.0/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.13.0/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson/build

# Include any dependencies generated for this target.
include example/CMakeFiles/serialize.dir/depend.make

# Include the progress variables for this target.
include example/CMakeFiles/serialize.dir/progress.make

# Include the compile flags for this target's objects.
include example/CMakeFiles/serialize.dir/flags.make

example/CMakeFiles/serialize.dir/serialize/serialize.cpp.o: example/CMakeFiles/serialize.dir/flags.make
example/CMakeFiles/serialize.dir/serialize/serialize.cpp.o: ../example/serialize/serialize.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object example/CMakeFiles/serialize.dir/serialize/serialize.cpp.o"
	cd /Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson/build/example && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/serialize.dir/serialize/serialize.cpp.o -c /Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson/example/serialize/serialize.cpp

example/CMakeFiles/serialize.dir/serialize/serialize.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/serialize.dir/serialize/serialize.cpp.i"
	cd /Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson/build/example && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson/example/serialize/serialize.cpp > CMakeFiles/serialize.dir/serialize/serialize.cpp.i

example/CMakeFiles/serialize.dir/serialize/serialize.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/serialize.dir/serialize/serialize.cpp.s"
	cd /Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson/build/example && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson/example/serialize/serialize.cpp -o CMakeFiles/serialize.dir/serialize/serialize.cpp.s

# Object files for target serialize
serialize_OBJECTS = \
"CMakeFiles/serialize.dir/serialize/serialize.cpp.o"

# External object files for target serialize
serialize_EXTERNAL_OBJECTS =

bin/serialize: example/CMakeFiles/serialize.dir/serialize/serialize.cpp.o
bin/serialize: example/CMakeFiles/serialize.dir/build.make
bin/serialize: example/CMakeFiles/serialize.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/serialize"
	cd /Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson/build/example && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/serialize.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
example/CMakeFiles/serialize.dir/build: bin/serialize

.PHONY : example/CMakeFiles/serialize.dir/build

example/CMakeFiles/serialize.dir/clean:
	cd /Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson/build/example && $(CMAKE_COMMAND) -P CMakeFiles/serialize.dir/cmake_clean.cmake
.PHONY : example/CMakeFiles/serialize.dir/clean

example/CMakeFiles/serialize.dir/depend:
	cd /Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson /Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson/example /Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson/build /Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson/build/example /Users/zhipengxu/Desktop/FALL18/EECS584/project/mongo/src/mongo/rapidjson/build/example/CMakeFiles/serialize.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : example/CMakeFiles/serialize.dir/depend

