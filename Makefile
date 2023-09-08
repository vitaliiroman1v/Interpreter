# Compiler
CXX=g++

# Directories
SRC_DIR=src/
BUILD_DIR=build/

# Source files
SRC_FILES=$(wildcard $(SRC_DIR)*.cpp)

# Object files
OBJ_FILES=$(patsubst $(SRC_DIR)%.cpp,$(BUILD_DIR)%.o,$(SRC_FILES))

# Target name
TARGET_NAME=rmn1v

# Compiler flags
CXXFLAGS=-std=c++17 -Wall

# Linker flags (if needed)
LDFLAGS=

# Create the build directory if it doesn't exist
$(shell mkdir -p $(BUILD_DIR))

# Build target
all: $(BUILD_DIR)$(TARGET_NAME)

# Linking
$(BUILD_DIR)$(TARGET_NAME): $(OBJ_FILES)
	$(CXX) $(LDFLAGS) -o $@ $^

# Compiling source files
$(BUILD_DIR)%.o: $(SRC_DIR)%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

# Clean up
clean:
	rm -rf $(BUILD_DIR)

# Phony targets
.PHONY: all clean

# Default rule
.DEFAULT_GOAL := all
