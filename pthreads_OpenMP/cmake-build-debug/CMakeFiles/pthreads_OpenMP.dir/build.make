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
CMAKE_COMMAND = /snap/clion/57/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/57/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/pthreads_OpenMP.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/pthreads_OpenMP.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/pthreads_OpenMP.dir/flags.make

CMakeFiles/pthreads_OpenMP.dir/src/sources/main.cpp.o: CMakeFiles/pthreads_OpenMP.dir/flags.make
CMakeFiles/pthreads_OpenMP.dir/src/sources/main.cpp.o: ../src/sources/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/pthreads_OpenMP.dir/src/sources/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pthreads_OpenMP.dir/src/sources/main.cpp.o -c /home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP/src/sources/main.cpp

CMakeFiles/pthreads_OpenMP.dir/src/sources/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pthreads_OpenMP.dir/src/sources/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP/src/sources/main.cpp > CMakeFiles/pthreads_OpenMP.dir/src/sources/main.cpp.i

CMakeFiles/pthreads_OpenMP.dir/src/sources/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pthreads_OpenMP.dir/src/sources/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP/src/sources/main.cpp -o CMakeFiles/pthreads_OpenMP.dir/src/sources/main.cpp.s

CMakeFiles/pthreads_OpenMP.dir/src/sources/Matrix.cpp.o: CMakeFiles/pthreads_OpenMP.dir/flags.make
CMakeFiles/pthreads_OpenMP.dir/src/sources/Matrix.cpp.o: ../src/sources/Matrix.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/pthreads_OpenMP.dir/src/sources/Matrix.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pthreads_OpenMP.dir/src/sources/Matrix.cpp.o -c /home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP/src/sources/Matrix.cpp

CMakeFiles/pthreads_OpenMP.dir/src/sources/Matrix.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pthreads_OpenMP.dir/src/sources/Matrix.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP/src/sources/Matrix.cpp > CMakeFiles/pthreads_OpenMP.dir/src/sources/Matrix.cpp.i

CMakeFiles/pthreads_OpenMP.dir/src/sources/Matrix.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pthreads_OpenMP.dir/src/sources/Matrix.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP/src/sources/Matrix.cpp -o CMakeFiles/pthreads_OpenMP.dir/src/sources/Matrix.cpp.s

# Object files for target pthreads_OpenMP
pthreads_OpenMP_OBJECTS = \
"CMakeFiles/pthreads_OpenMP.dir/src/sources/main.cpp.o" \
"CMakeFiles/pthreads_OpenMP.dir/src/sources/Matrix.cpp.o"

# External object files for target pthreads_OpenMP
pthreads_OpenMP_EXTERNAL_OBJECTS =

pthreads_OpenMP: CMakeFiles/pthreads_OpenMP.dir/src/sources/main.cpp.o
pthreads_OpenMP: CMakeFiles/pthreads_OpenMP.dir/src/sources/Matrix.cpp.o
pthreads_OpenMP: CMakeFiles/pthreads_OpenMP.dir/build.make
pthreads_OpenMP: CMakeFiles/pthreads_OpenMP.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable pthreads_OpenMP"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pthreads_OpenMP.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/pthreads_OpenMP.dir/build: pthreads_OpenMP

.PHONY : CMakeFiles/pthreads_OpenMP.dir/build

CMakeFiles/pthreads_OpenMP.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/pthreads_OpenMP.dir/cmake_clean.cmake
.PHONY : CMakeFiles/pthreads_OpenMP.dir/clean

CMakeFiles/pthreads_OpenMP.dir/depend:
	cd /home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP /home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP /home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP/cmake-build-debug /home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP/cmake-build-debug /home/ilya1032/IdeaProjects/Multithread-course-work-Java-threads-pthreads-OpenMPI-/pthreads_OpenMP/cmake-build-debug/CMakeFiles/pthreads_OpenMP.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/pthreads_OpenMP.dir/depend

