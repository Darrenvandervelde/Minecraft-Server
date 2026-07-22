FROM eclipse-temurin:17-jdk

WORKDIR /minecraft

# Install necessary tools
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Create necessary directories
RUN mkdir -p /minecraft/plugins \
    && mkdir -p /minecraft/backups \
    && mkdir -p /minecraft/world

# Expose Minecraft server port
EXPOSE 25565

# Set working directory to server
WORKDIR /minecraft/server

# Run the server
ENTRYPOINT ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
