# Makefile

# Compiler
CXX := g++

# Flags
CXXFLAGS := -Wall -Wextra -pedantic -std=c++11

# Directories
SRC_DIR := src
BUILD_DIR := build
RAYLIB_DIR := /usr/local/lib/

# Executable
EXEC := raylib-particle-simulator

# Source files
SRCS := $(wildcard $(SRC_DIR)/*.cpp)
OBJS := $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SRCS))

# Static Raylib library
RAYLIB_STATIC := $(RAYLIB_DIR)/libraylib.a

.PHONY: all clean

all: $(BUILD_DIR)/$(EXEC)

$(BUILD_DIR)/$(EXEC): $(OBJS)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(RAYLIB_STATIC) -lGL -lm -lpthread -ldl -lrt -lX11

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	@$(RM) -r $(BUILD_DIR)
