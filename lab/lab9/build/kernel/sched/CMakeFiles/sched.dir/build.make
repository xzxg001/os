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
CMAKE_SOURCE_DIR = /home/zlz/lab9/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zlz/lab9/build

# Include any dependencies generated for this target.
include kernel/sched/CMakeFiles/sched.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include kernel/sched/CMakeFiles/sched.dir/compiler_depend.make

# Include the progress variables for this target.
include kernel/sched/CMakeFiles/sched.dir/progress.make

# Include the compile flags for this target's objects.
include kernel/sched/CMakeFiles/sched.dir/flags.make

kernel/sched/CMakeFiles/sched.dir/prt_sched_single.c.obj: kernel/sched/CMakeFiles/sched.dir/flags.make
kernel/sched/CMakeFiles/sched.dir/prt_sched_single.c.obj: /home/zlz/lab9/src/kernel/sched/prt_sched_single.c
kernel/sched/CMakeFiles/sched.dir/prt_sched_single.c.obj: kernel/sched/CMakeFiles/sched.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zlz/lab9/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object kernel/sched/CMakeFiles/sched.dir/prt_sched_single.c.obj"
	cd /home/zlz/lab9/build/kernel/sched && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT kernel/sched/CMakeFiles/sched.dir/prt_sched_single.c.obj -MF CMakeFiles/sched.dir/prt_sched_single.c.obj.d -o CMakeFiles/sched.dir/prt_sched_single.c.obj -c /home/zlz/lab9/src/kernel/sched/prt_sched_single.c

kernel/sched/CMakeFiles/sched.dir/prt_sched_single.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sched.dir/prt_sched_single.c.i"
	cd /home/zlz/lab9/build/kernel/sched && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/zlz/lab9/src/kernel/sched/prt_sched_single.c > CMakeFiles/sched.dir/prt_sched_single.c.i

kernel/sched/CMakeFiles/sched.dir/prt_sched_single.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sched.dir/prt_sched_single.c.s"
	cd /home/zlz/lab9/build/kernel/sched && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/zlz/lab9/src/kernel/sched/prt_sched_single.c -o CMakeFiles/sched.dir/prt_sched_single.c.s

sched: kernel/sched/CMakeFiles/sched.dir/prt_sched_single.c.obj
sched: kernel/sched/CMakeFiles/sched.dir/build.make
.PHONY : sched

# Rule to build all files generated by this target.
kernel/sched/CMakeFiles/sched.dir/build: sched
.PHONY : kernel/sched/CMakeFiles/sched.dir/build

kernel/sched/CMakeFiles/sched.dir/clean:
	cd /home/zlz/lab9/build/kernel/sched && $(CMAKE_COMMAND) -P CMakeFiles/sched.dir/cmake_clean.cmake
.PHONY : kernel/sched/CMakeFiles/sched.dir/clean

kernel/sched/CMakeFiles/sched.dir/depend:
	cd /home/zlz/lab9/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zlz/lab9/src /home/zlz/lab9/src/kernel/sched /home/zlz/lab9/build /home/zlz/lab9/build/kernel/sched /home/zlz/lab9/build/kernel/sched/CMakeFiles/sched.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : kernel/sched/CMakeFiles/sched.dir/depend

