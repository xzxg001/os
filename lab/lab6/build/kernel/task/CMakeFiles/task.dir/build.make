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
CMAKE_SOURCE_DIR = /home/zlz/lab6-z/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zlz/lab6-z/build

# Include any dependencies generated for this target.
include kernel/task/CMakeFiles/task.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include kernel/task/CMakeFiles/task.dir/compiler_depend.make

# Include the progress variables for this target.
include kernel/task/CMakeFiles/task.dir/progress.make

# Include the compile flags for this target's objects.
include kernel/task/CMakeFiles/task.dir/flags.make

kernel/task/CMakeFiles/task.dir/prt_sys.c.obj: kernel/task/CMakeFiles/task.dir/flags.make
kernel/task/CMakeFiles/task.dir/prt_sys.c.obj: /home/zlz/lab6-z/src/kernel/task/prt_sys.c
kernel/task/CMakeFiles/task.dir/prt_sys.c.obj: kernel/task/CMakeFiles/task.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zlz/lab6-z/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object kernel/task/CMakeFiles/task.dir/prt_sys.c.obj"
	cd /home/zlz/lab6-z/build/kernel/task && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT kernel/task/CMakeFiles/task.dir/prt_sys.c.obj -MF CMakeFiles/task.dir/prt_sys.c.obj.d -o CMakeFiles/task.dir/prt_sys.c.obj -c /home/zlz/lab6-z/src/kernel/task/prt_sys.c

kernel/task/CMakeFiles/task.dir/prt_sys.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/task.dir/prt_sys.c.i"
	cd /home/zlz/lab6-z/build/kernel/task && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/zlz/lab6-z/src/kernel/task/prt_sys.c > CMakeFiles/task.dir/prt_sys.c.i

kernel/task/CMakeFiles/task.dir/prt_sys.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/task.dir/prt_sys.c.s"
	cd /home/zlz/lab6-z/build/kernel/task && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/zlz/lab6-z/src/kernel/task/prt_sys.c -o CMakeFiles/task.dir/prt_sys.c.s

kernel/task/CMakeFiles/task.dir/prt_task.c.obj: kernel/task/CMakeFiles/task.dir/flags.make
kernel/task/CMakeFiles/task.dir/prt_task.c.obj: /home/zlz/lab6-z/src/kernel/task/prt_task.c
kernel/task/CMakeFiles/task.dir/prt_task.c.obj: kernel/task/CMakeFiles/task.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zlz/lab6-z/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object kernel/task/CMakeFiles/task.dir/prt_task.c.obj"
	cd /home/zlz/lab6-z/build/kernel/task && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT kernel/task/CMakeFiles/task.dir/prt_task.c.obj -MF CMakeFiles/task.dir/prt_task.c.obj.d -o CMakeFiles/task.dir/prt_task.c.obj -c /home/zlz/lab6-z/src/kernel/task/prt_task.c

kernel/task/CMakeFiles/task.dir/prt_task.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/task.dir/prt_task.c.i"
	cd /home/zlz/lab6-z/build/kernel/task && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/zlz/lab6-z/src/kernel/task/prt_task.c > CMakeFiles/task.dir/prt_task.c.i

kernel/task/CMakeFiles/task.dir/prt_task.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/task.dir/prt_task.c.s"
	cd /home/zlz/lab6-z/build/kernel/task && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/zlz/lab6-z/src/kernel/task/prt_task.c -o CMakeFiles/task.dir/prt_task.c.s

kernel/task/CMakeFiles/task.dir/prt_task_init.c.obj: kernel/task/CMakeFiles/task.dir/flags.make
kernel/task/CMakeFiles/task.dir/prt_task_init.c.obj: /home/zlz/lab6-z/src/kernel/task/prt_task_init.c
kernel/task/CMakeFiles/task.dir/prt_task_init.c.obj: kernel/task/CMakeFiles/task.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zlz/lab6-z/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object kernel/task/CMakeFiles/task.dir/prt_task_init.c.obj"
	cd /home/zlz/lab6-z/build/kernel/task && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT kernel/task/CMakeFiles/task.dir/prt_task_init.c.obj -MF CMakeFiles/task.dir/prt_task_init.c.obj.d -o CMakeFiles/task.dir/prt_task_init.c.obj -c /home/zlz/lab6-z/src/kernel/task/prt_task_init.c

kernel/task/CMakeFiles/task.dir/prt_task_init.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/task.dir/prt_task_init.c.i"
	cd /home/zlz/lab6-z/build/kernel/task && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/zlz/lab6-z/src/kernel/task/prt_task_init.c > CMakeFiles/task.dir/prt_task_init.c.i

kernel/task/CMakeFiles/task.dir/prt_task_init.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/task.dir/prt_task_init.c.s"
	cd /home/zlz/lab6-z/build/kernel/task && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/zlz/lab6-z/src/kernel/task/prt_task_init.c -o CMakeFiles/task.dir/prt_task_init.c.s

task: kernel/task/CMakeFiles/task.dir/prt_sys.c.obj
task: kernel/task/CMakeFiles/task.dir/prt_task.c.obj
task: kernel/task/CMakeFiles/task.dir/prt_task_init.c.obj
task: kernel/task/CMakeFiles/task.dir/build.make
.PHONY : task

# Rule to build all files generated by this target.
kernel/task/CMakeFiles/task.dir/build: task
.PHONY : kernel/task/CMakeFiles/task.dir/build

kernel/task/CMakeFiles/task.dir/clean:
	cd /home/zlz/lab6-z/build/kernel/task && $(CMAKE_COMMAND) -P CMakeFiles/task.dir/cmake_clean.cmake
.PHONY : kernel/task/CMakeFiles/task.dir/clean

kernel/task/CMakeFiles/task.dir/depend:
	cd /home/zlz/lab6-z/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zlz/lab6-z/src /home/zlz/lab6-z/src/kernel/task /home/zlz/lab6-z/build /home/zlz/lab6-z/build/kernel/task /home/zlz/lab6-z/build/kernel/task/CMakeFiles/task.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : kernel/task/CMakeFiles/task.dir/depend

