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
include kernel/sem/CMakeFiles/sem.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include kernel/sem/CMakeFiles/sem.dir/compiler_depend.make

# Include the progress variables for this target.
include kernel/sem/CMakeFiles/sem.dir/progress.make

# Include the compile flags for this target's objects.
include kernel/sem/CMakeFiles/sem.dir/flags.make

kernel/sem/CMakeFiles/sem.dir/prt_sem_init.c.obj: kernel/sem/CMakeFiles/sem.dir/flags.make
kernel/sem/CMakeFiles/sem.dir/prt_sem_init.c.obj: /home/zlz/lab9/src/kernel/sem/prt_sem_init.c
kernel/sem/CMakeFiles/sem.dir/prt_sem_init.c.obj: kernel/sem/CMakeFiles/sem.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zlz/lab9/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object kernel/sem/CMakeFiles/sem.dir/prt_sem_init.c.obj"
	cd /home/zlz/lab9/build/kernel/sem && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT kernel/sem/CMakeFiles/sem.dir/prt_sem_init.c.obj -MF CMakeFiles/sem.dir/prt_sem_init.c.obj.d -o CMakeFiles/sem.dir/prt_sem_init.c.obj -c /home/zlz/lab9/src/kernel/sem/prt_sem_init.c

kernel/sem/CMakeFiles/sem.dir/prt_sem_init.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sem.dir/prt_sem_init.c.i"
	cd /home/zlz/lab9/build/kernel/sem && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/zlz/lab9/src/kernel/sem/prt_sem_init.c > CMakeFiles/sem.dir/prt_sem_init.c.i

kernel/sem/CMakeFiles/sem.dir/prt_sem_init.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sem.dir/prt_sem_init.c.s"
	cd /home/zlz/lab9/build/kernel/sem && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/zlz/lab9/src/kernel/sem/prt_sem_init.c -o CMakeFiles/sem.dir/prt_sem_init.c.s

kernel/sem/CMakeFiles/sem.dir/prt_sem.c.obj: kernel/sem/CMakeFiles/sem.dir/flags.make
kernel/sem/CMakeFiles/sem.dir/prt_sem.c.obj: /home/zlz/lab9/src/kernel/sem/prt_sem.c
kernel/sem/CMakeFiles/sem.dir/prt_sem.c.obj: kernel/sem/CMakeFiles/sem.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zlz/lab9/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object kernel/sem/CMakeFiles/sem.dir/prt_sem.c.obj"
	cd /home/zlz/lab9/build/kernel/sem && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT kernel/sem/CMakeFiles/sem.dir/prt_sem.c.obj -MF CMakeFiles/sem.dir/prt_sem.c.obj.d -o CMakeFiles/sem.dir/prt_sem.c.obj -c /home/zlz/lab9/src/kernel/sem/prt_sem.c

kernel/sem/CMakeFiles/sem.dir/prt_sem.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sem.dir/prt_sem.c.i"
	cd /home/zlz/lab9/build/kernel/sem && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/zlz/lab9/src/kernel/sem/prt_sem.c > CMakeFiles/sem.dir/prt_sem.c.i

kernel/sem/CMakeFiles/sem.dir/prt_sem.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sem.dir/prt_sem.c.s"
	cd /home/zlz/lab9/build/kernel/sem && /home/zlz/aarch64-none-elf/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/zlz/lab9/src/kernel/sem/prt_sem.c -o CMakeFiles/sem.dir/prt_sem.c.s

sem: kernel/sem/CMakeFiles/sem.dir/prt_sem_init.c.obj
sem: kernel/sem/CMakeFiles/sem.dir/prt_sem.c.obj
sem: kernel/sem/CMakeFiles/sem.dir/build.make
.PHONY : sem

# Rule to build all files generated by this target.
kernel/sem/CMakeFiles/sem.dir/build: sem
.PHONY : kernel/sem/CMakeFiles/sem.dir/build

kernel/sem/CMakeFiles/sem.dir/clean:
	cd /home/zlz/lab9/build/kernel/sem && $(CMAKE_COMMAND) -P CMakeFiles/sem.dir/cmake_clean.cmake
.PHONY : kernel/sem/CMakeFiles/sem.dir/clean

kernel/sem/CMakeFiles/sem.dir/depend:
	cd /home/zlz/lab9/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zlz/lab9/src /home/zlz/lab9/src/kernel/sem /home/zlz/lab9/build /home/zlz/lab9/build/kernel/sem /home/zlz/lab9/build/kernel/sem/CMakeFiles/sem.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : kernel/sem/CMakeFiles/sem.dir/depend

