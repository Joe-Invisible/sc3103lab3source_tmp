CC = gcc
CFLAGS = -Wall
DEBUGFLAGS = -g
PROFILEFLAGS = -pg

# Program names
TARGET = helloworld
DEBUG_TARGET = helloworld-d
PROFILE_TARGET = helloworld-p

SOURCES = hello-main.c hello-funct1.c hello-funct2.c
OBJECTS = $(SOURCES:.c=.o)
DEBUG_OBJECTS = $(SOURCES:.c=-d.o)
PROFILE_OBJECTS = $(SOURCES:.c=-p.o)

.PHONY: all debug clean

# General Rule:
# target: dependencies
#   command
#
# The first line tells Make _when_ to run the command:
# when the target is missing or when the dependencies
# are newer than the target (modified).
# Make treats command as an opaque string.

# Executables
all: $(TARGET) $(DEBUG_TARGET)

debug: $(DEBUG_TARGET)

profile: $(PROFILE_TARGET)

# Linking rules
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

$(DEBUG_TARGET): $(DEBUG_OBJECTS)
	$(CC) $(DEBUG_OBJECTS) -o $(DEBUG_TARGET)

$(PROFILE_TARGET): $(PROFILE_OBJECTS)
	$(CC) $(PROFILEFLAGS) $(PROFILE_OBJECTS) -o $(PROFILE_TARGET)

# Compilation rules
%.o: %.c
	$(CC) $(CFLAGS) $(FLAGS) -c $< -o $@

# Debug Compilation rules
%-d.o: %.c
	$(CC) $(CFLAGS) $(DEBUGFLAGS) -c $< -o $@

# Profiling Compilation rules
%-p.o: %.c
	$(CC) $(CFLAGS) $(PROFILEFLAGS) -c $< -o $@

# Clean
clean:
	rm -f $(OBJECTS) $(DEBUG_OBJECTS) $(PROFILE_OBJECTS) $(TARGET) $(DEBUG_TARGET) $(PROFILE_TARGET)
