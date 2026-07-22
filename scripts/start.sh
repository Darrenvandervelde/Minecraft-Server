#!/bin/bash

# Minecraft Server Startup Script

set -e

echo "Starting Minecraft Server..."

# Check if server.jar exists
if [ ! -f "server/server.jar" ]; then
    echo "Error: server.jar not found in server/ directory"
    echo "Please download the server jar and place it in the server/ directory"
    exit 1
fi

# Check if EULA is accepted
if [ ! -f "server/eula.txt" ]; then
    echo "Creating eula.txt..."
    echo "eula=true" > server/eula.txt
fi

# Set memory allocation (adjust as needed)
MEMORY=${MEMORY:-1024M}
MAX_MEMORY=${MAX_MEMORY:-1024M}

# Change to server directory
cd server

# Start the server
echo "Starting server with ${MEMORY} minimum and ${MAX_MEMORY} maximum memory..."
java -Xms${MEMORY} -Xmx${MAX_MEMORY} -jar server.jar nogui

