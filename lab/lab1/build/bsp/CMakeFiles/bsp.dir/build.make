# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zlz/lab1/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zlz/lab1/build

# Include any dependencies generated for this target.
include bsp/CMakeFiles/bsp.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include bsp/CMakeFiles/bsp.dir/compiler_depend.make

# Include the progress variables for this target.
include bsp/CMakeFiles/bsp.dir/progress.make

# Include the compile flags for this target's objects.
include bsp/CMakeFiles/bsp.dir/flags.make

bsp/CMakeFiles/bsp.dir/start.S.obj: bsp/CMakeFiles/bsp.dir/flags.make
bsp/CMakeFiles/bsp.dir/start.S.obj: /home/zlz/lab1/src/bsp/start.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zlz/lab1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building ASM object bsp/CMakeFiles/bsp.dir/start.S.obj"
	cd /home/zlz/lab1/build/bsp && /home/zlz/aarch64-none-elf/bin/aarch64-none-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/bsp.dir/start.S.obj -c /home/zlz/lab1/src/bsp/start.S

bsp/CMakeFiles/bsp.dir/start.S.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing ASM source to CMakeFiles/bsp.dir/start.S.i"
	cd /home/zlz/lab1/build/bsp && /home/zlz/aarch64-none-elf/bin/aarch64-none-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -E /home/zlz/lab1/src/bsp/start.S > CMakeFiles/bsp.dir/start.S.i

bsp/CMakeFiles/bsp.dir/start.S.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling ASM source to assembly CMakeFiles/bsp.dir/start.S.s"
	cd /home/zlz/lab1/build/bsp && /home/zlz/aarch64-none-elf/bin/aarch64-none-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -S /home/zlz/lab1/src/bsp/start.S -o CMakeFiles/bsp.dir/start.S.s

bsp/CMakeFiles/bsp.dir/prt_reset_vector.S.obj: bsp/CMakeFiles/bsp.dir/flags.make
bsp/CMakeFiles/bsp.dir/prt_reset_vector.S.obj: /home/zlz/lab1/src/bsp/prt_reset_vector.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zlz/lab1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building ASM object bsp/CMakeFiles/bsp.dir/prt_reset_vector.S.obj"
	cd /home/zlz/lab1/build/bsp && /home/zlz/aarch64-none-elf/bin/aarch64-none-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/bsp.dir/prt_reset_vector.S.obj -c /home/zlz/lab1/src/bsp/prt_reset_vector.S

bsp/CMakeFiles/bsp.dir/prt_reset_vector.S.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing ASM source to CMakeFiles/bsp.dir/prt_reset_vector.S.i"
	cd /home/zlz/lab1/build/bsp && /home/zlz/aarch64-none-elf/bin/aarch64-none-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -E /home/zlz/lab1/src/bsp/prt_reset_vector.S > CMakeFiles/bsp.dir/prt_reset_vector.S.i

bsp/CMakeFiles/bsp.dir/prt_reset_vector.S.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling ASM source to assembly CMakeFiles/bsp.dir/prt_reset_vector.S.s"
	cd /home/zlz/lab1/build/bsp && /home/zlz/aarch64-none-elf/bin/aarch64-none-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -S /home/zlz/lab1/src/bsp/prt_reset_vector.S -o CMakeFiles/bsp.dir/prt_reset_vector.S.s

bsp: bsp/CMakeFiles/bsp.dir/start.S.obj
bsp: bsp/CMakeFiles/bsp.dir/prt_reset_vector.S.obj
bsp: bsp/CMakeFiles/bsp.dir/build.make
.PHONY : bsp

# Rule to build all files generated by this target.
bsp/CMakeFiles/bsp.dir/build: bsp
.PHONY : bsp/CMakeFiles/bsp.dir/build

bsp/CMakeFiles/bsp.dir/clean:
	cd /home/zlz/lab1/build/bsp && $(CMAKE_COMMAND) -P CMakeFiles/bsp.dir/cmake_clean.cmake
.PHONY : bsp/CMakeFiles/bsp.dir/clean

bsp/CMakeFiles/bsp.dir/depend:
	cd /home/zlz/lab1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zlz/lab1/src /home/zlz/lab1/src/bsp /home/zlz/lab1/build /home/zlz/lab1/build/bsp /home/zlz/lab1/build/bsp/CMakeFiles/bsp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : bsp/CMakeFiles/bsp.dir/depend

