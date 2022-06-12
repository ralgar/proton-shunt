CC = x86_64-w64-mingw32-gcc

CFLAGS = -Wall -Wextra -pedantic-errors
LDFLAGS = # Paths to libraries, if required
LDLIBS = #-lws2_32

TARGET_EXEC := proton-shunt.exe

BUILD_DIR := ./build
SRC_DIR := ./src

# Find all the source files we want to compile.
SRCS := $(shell find $(SRC_DIR) -maxdepth 2 -name '*.c')

# String substitution for every source file.
# As an example, hello.c turns into ./build/hello.c.o
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)

# Final build step (link objects)
$(BUILD_DIR)/$(TARGET_EXEC): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) $(LDLIBS) -o $@

# Build individual source files
$(BUILD_DIR)/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

# Build tests
tests: $(BUILD_DIR)/tests/test.exe

$(BUILD_DIR)/tests/test.exe: tests/test.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $< -o $@

# Cleanup build files
clean:
	rm -r $(BUILD_DIR)
