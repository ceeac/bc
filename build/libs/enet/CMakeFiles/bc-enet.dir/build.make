# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /media/ceeac/Projects/code/bc

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ceeac/Projects/code/bc/build

# Include any dependencies generated for this target.
include libs/enet/CMakeFiles/bc-enet.dir/depend.make

# Include the progress variables for this target.
include libs/enet/CMakeFiles/bc-enet.dir/progress.make

# Include the compile flags for this target's objects.
include libs/enet/CMakeFiles/bc-enet.dir/flags.make

libs/enet/CMakeFiles/bc-enet.dir/callbacks.c.o: libs/enet/CMakeFiles/bc-enet.dir/flags.make
libs/enet/CMakeFiles/bc-enet.dir/callbacks.c.o: /media/ceeac/Projects/code/bc/libs/enet/callbacks.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceeac/Projects/code/bc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object libs/enet/CMakeFiles/bc-enet.dir/callbacks.c.o"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bc-enet.dir/callbacks.c.o   -c /media/ceeac/Projects/code/bc/libs/enet/callbacks.c

libs/enet/CMakeFiles/bc-enet.dir/callbacks.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bc-enet.dir/callbacks.c.i"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/ceeac/Projects/code/bc/libs/enet/callbacks.c > CMakeFiles/bc-enet.dir/callbacks.c.i

libs/enet/CMakeFiles/bc-enet.dir/callbacks.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bc-enet.dir/callbacks.c.s"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/ceeac/Projects/code/bc/libs/enet/callbacks.c -o CMakeFiles/bc-enet.dir/callbacks.c.s

libs/enet/CMakeFiles/bc-enet.dir/compress.c.o: libs/enet/CMakeFiles/bc-enet.dir/flags.make
libs/enet/CMakeFiles/bc-enet.dir/compress.c.o: /media/ceeac/Projects/code/bc/libs/enet/compress.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceeac/Projects/code/bc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object libs/enet/CMakeFiles/bc-enet.dir/compress.c.o"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bc-enet.dir/compress.c.o   -c /media/ceeac/Projects/code/bc/libs/enet/compress.c

libs/enet/CMakeFiles/bc-enet.dir/compress.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bc-enet.dir/compress.c.i"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/ceeac/Projects/code/bc/libs/enet/compress.c > CMakeFiles/bc-enet.dir/compress.c.i

libs/enet/CMakeFiles/bc-enet.dir/compress.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bc-enet.dir/compress.c.s"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/ceeac/Projects/code/bc/libs/enet/compress.c -o CMakeFiles/bc-enet.dir/compress.c.s

libs/enet/CMakeFiles/bc-enet.dir/host.c.o: libs/enet/CMakeFiles/bc-enet.dir/flags.make
libs/enet/CMakeFiles/bc-enet.dir/host.c.o: /media/ceeac/Projects/code/bc/libs/enet/host.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceeac/Projects/code/bc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object libs/enet/CMakeFiles/bc-enet.dir/host.c.o"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bc-enet.dir/host.c.o   -c /media/ceeac/Projects/code/bc/libs/enet/host.c

libs/enet/CMakeFiles/bc-enet.dir/host.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bc-enet.dir/host.c.i"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/ceeac/Projects/code/bc/libs/enet/host.c > CMakeFiles/bc-enet.dir/host.c.i

libs/enet/CMakeFiles/bc-enet.dir/host.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bc-enet.dir/host.c.s"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/ceeac/Projects/code/bc/libs/enet/host.c -o CMakeFiles/bc-enet.dir/host.c.s

libs/enet/CMakeFiles/bc-enet.dir/list.c.o: libs/enet/CMakeFiles/bc-enet.dir/flags.make
libs/enet/CMakeFiles/bc-enet.dir/list.c.o: /media/ceeac/Projects/code/bc/libs/enet/list.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceeac/Projects/code/bc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object libs/enet/CMakeFiles/bc-enet.dir/list.c.o"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bc-enet.dir/list.c.o   -c /media/ceeac/Projects/code/bc/libs/enet/list.c

libs/enet/CMakeFiles/bc-enet.dir/list.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bc-enet.dir/list.c.i"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/ceeac/Projects/code/bc/libs/enet/list.c > CMakeFiles/bc-enet.dir/list.c.i

libs/enet/CMakeFiles/bc-enet.dir/list.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bc-enet.dir/list.c.s"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/ceeac/Projects/code/bc/libs/enet/list.c -o CMakeFiles/bc-enet.dir/list.c.s

libs/enet/CMakeFiles/bc-enet.dir/packet.c.o: libs/enet/CMakeFiles/bc-enet.dir/flags.make
libs/enet/CMakeFiles/bc-enet.dir/packet.c.o: /media/ceeac/Projects/code/bc/libs/enet/packet.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceeac/Projects/code/bc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object libs/enet/CMakeFiles/bc-enet.dir/packet.c.o"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bc-enet.dir/packet.c.o   -c /media/ceeac/Projects/code/bc/libs/enet/packet.c

libs/enet/CMakeFiles/bc-enet.dir/packet.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bc-enet.dir/packet.c.i"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/ceeac/Projects/code/bc/libs/enet/packet.c > CMakeFiles/bc-enet.dir/packet.c.i

libs/enet/CMakeFiles/bc-enet.dir/packet.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bc-enet.dir/packet.c.s"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/ceeac/Projects/code/bc/libs/enet/packet.c -o CMakeFiles/bc-enet.dir/packet.c.s

libs/enet/CMakeFiles/bc-enet.dir/peer.c.o: libs/enet/CMakeFiles/bc-enet.dir/flags.make
libs/enet/CMakeFiles/bc-enet.dir/peer.c.o: /media/ceeac/Projects/code/bc/libs/enet/peer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceeac/Projects/code/bc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object libs/enet/CMakeFiles/bc-enet.dir/peer.c.o"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bc-enet.dir/peer.c.o   -c /media/ceeac/Projects/code/bc/libs/enet/peer.c

libs/enet/CMakeFiles/bc-enet.dir/peer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bc-enet.dir/peer.c.i"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/ceeac/Projects/code/bc/libs/enet/peer.c > CMakeFiles/bc-enet.dir/peer.c.i

libs/enet/CMakeFiles/bc-enet.dir/peer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bc-enet.dir/peer.c.s"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/ceeac/Projects/code/bc/libs/enet/peer.c -o CMakeFiles/bc-enet.dir/peer.c.s

libs/enet/CMakeFiles/bc-enet.dir/protocol.c.o: libs/enet/CMakeFiles/bc-enet.dir/flags.make
libs/enet/CMakeFiles/bc-enet.dir/protocol.c.o: /media/ceeac/Projects/code/bc/libs/enet/protocol.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceeac/Projects/code/bc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object libs/enet/CMakeFiles/bc-enet.dir/protocol.c.o"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bc-enet.dir/protocol.c.o   -c /media/ceeac/Projects/code/bc/libs/enet/protocol.c

libs/enet/CMakeFiles/bc-enet.dir/protocol.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bc-enet.dir/protocol.c.i"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/ceeac/Projects/code/bc/libs/enet/protocol.c > CMakeFiles/bc-enet.dir/protocol.c.i

libs/enet/CMakeFiles/bc-enet.dir/protocol.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bc-enet.dir/protocol.c.s"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/ceeac/Projects/code/bc/libs/enet/protocol.c -o CMakeFiles/bc-enet.dir/protocol.c.s

libs/enet/CMakeFiles/bc-enet.dir/unix.c.o: libs/enet/CMakeFiles/bc-enet.dir/flags.make
libs/enet/CMakeFiles/bc-enet.dir/unix.c.o: /media/ceeac/Projects/code/bc/libs/enet/unix.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceeac/Projects/code/bc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object libs/enet/CMakeFiles/bc-enet.dir/unix.c.o"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bc-enet.dir/unix.c.o   -c /media/ceeac/Projects/code/bc/libs/enet/unix.c

libs/enet/CMakeFiles/bc-enet.dir/unix.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bc-enet.dir/unix.c.i"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/ceeac/Projects/code/bc/libs/enet/unix.c > CMakeFiles/bc-enet.dir/unix.c.i

libs/enet/CMakeFiles/bc-enet.dir/unix.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bc-enet.dir/unix.c.s"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/ceeac/Projects/code/bc/libs/enet/unix.c -o CMakeFiles/bc-enet.dir/unix.c.s

libs/enet/CMakeFiles/bc-enet.dir/win32.c.o: libs/enet/CMakeFiles/bc-enet.dir/flags.make
libs/enet/CMakeFiles/bc-enet.dir/win32.c.o: /media/ceeac/Projects/code/bc/libs/enet/win32.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceeac/Projects/code/bc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object libs/enet/CMakeFiles/bc-enet.dir/win32.c.o"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bc-enet.dir/win32.c.o   -c /media/ceeac/Projects/code/bc/libs/enet/win32.c

libs/enet/CMakeFiles/bc-enet.dir/win32.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bc-enet.dir/win32.c.i"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/ceeac/Projects/code/bc/libs/enet/win32.c > CMakeFiles/bc-enet.dir/win32.c.i

libs/enet/CMakeFiles/bc-enet.dir/win32.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bc-enet.dir/win32.c.s"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/ceeac/Projects/code/bc/libs/enet/win32.c -o CMakeFiles/bc-enet.dir/win32.c.s

# Object files for target bc-enet
bc__enet_OBJECTS = \
"CMakeFiles/bc-enet.dir/callbacks.c.o" \
"CMakeFiles/bc-enet.dir/compress.c.o" \
"CMakeFiles/bc-enet.dir/host.c.o" \
"CMakeFiles/bc-enet.dir/list.c.o" \
"CMakeFiles/bc-enet.dir/packet.c.o" \
"CMakeFiles/bc-enet.dir/peer.c.o" \
"CMakeFiles/bc-enet.dir/protocol.c.o" \
"CMakeFiles/bc-enet.dir/unix.c.o" \
"CMakeFiles/bc-enet.dir/win32.c.o"

# External object files for target bc-enet
bc__enet_EXTERNAL_OBJECTS =

libs/enet/libbc-enet.a: libs/enet/CMakeFiles/bc-enet.dir/callbacks.c.o
libs/enet/libbc-enet.a: libs/enet/CMakeFiles/bc-enet.dir/compress.c.o
libs/enet/libbc-enet.a: libs/enet/CMakeFiles/bc-enet.dir/host.c.o
libs/enet/libbc-enet.a: libs/enet/CMakeFiles/bc-enet.dir/list.c.o
libs/enet/libbc-enet.a: libs/enet/CMakeFiles/bc-enet.dir/packet.c.o
libs/enet/libbc-enet.a: libs/enet/CMakeFiles/bc-enet.dir/peer.c.o
libs/enet/libbc-enet.a: libs/enet/CMakeFiles/bc-enet.dir/protocol.c.o
libs/enet/libbc-enet.a: libs/enet/CMakeFiles/bc-enet.dir/unix.c.o
libs/enet/libbc-enet.a: libs/enet/CMakeFiles/bc-enet.dir/win32.c.o
libs/enet/libbc-enet.a: libs/enet/CMakeFiles/bc-enet.dir/build.make
libs/enet/libbc-enet.a: libs/enet/CMakeFiles/bc-enet.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ceeac/Projects/code/bc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Linking C static library libbc-enet.a"
	cd /home/ceeac/Projects/code/bc/build/libs/enet && $(CMAKE_COMMAND) -P CMakeFiles/bc-enet.dir/cmake_clean_target.cmake
	cd /home/ceeac/Projects/code/bc/build/libs/enet && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bc-enet.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libs/enet/CMakeFiles/bc-enet.dir/build: libs/enet/libbc-enet.a

.PHONY : libs/enet/CMakeFiles/bc-enet.dir/build

libs/enet/CMakeFiles/bc-enet.dir/clean:
	cd /home/ceeac/Projects/code/bc/build/libs/enet && $(CMAKE_COMMAND) -P CMakeFiles/bc-enet.dir/cmake_clean.cmake
.PHONY : libs/enet/CMakeFiles/bc-enet.dir/clean

libs/enet/CMakeFiles/bc-enet.dir/depend:
	cd /home/ceeac/Projects/code/bc/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/ceeac/Projects/code/bc /media/ceeac/Projects/code/bc/libs/enet /home/ceeac/Projects/code/bc/build /home/ceeac/Projects/code/bc/build/libs/enet /home/ceeac/Projects/code/bc/build/libs/enet/CMakeFiles/bc-enet.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libs/enet/CMakeFiles/bc-enet.dir/depend

