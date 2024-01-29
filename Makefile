# Makefile for NASM projects on macOS

# Name of the source and output files
SOURCE = triangle.asm
OUTPUT = triangle

# Compiler and linker flags
NASMFLAGS = -fmacho64
LDFLAGS = -macos_version_min 11.0 -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie

# Build target
all: $(OUTPUT)

$(OUTPUT): $(SOURCE)
	nasm $(NASMFLAGS) $(SOURCE)
	ld $(OUTPUT).o -o $(OUTPUT) $(LDFLAGS)

# Clean target
clean:
	rm -f $(OUTPUT) $(OUTPUT).o

.PHONY: all clean
# The `.PHONY` target in a Makefile is used to declare that certain targets are not associated with files. In other words,
# it tells `make` that the targets listed under `.PHONY` are always out-of-date and should always be executed, regardless of
# whether there are files with those names.
# In a Makefile, targets are usually associated with files, and `make` determines whether a target needs to be rebuilt by
# checking if the associated file is out-of-date compared to its dependencies. However, there are cases where you have
# targets that do not represent files but are rather just a series of commands you want to run. For example, `clean` is a
# common target in Makefiles used to delete generated files. Since there is no file named "clean," you want `make` to run
# this target every time you call `make clean`, even if a file named "clean" exists in the directory.

# In this case, both `all` and `clean` are declared as `.PHONY` targets. This ensures that `make all` always rebuilds your project,
# and `make clean` always runs the commands to clean up your project, irrespective of the presence of files named "all" or "clean."
