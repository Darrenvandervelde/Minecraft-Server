FROM itzg/minecraft-server:latest

# Accept the Minecraft EULA
ENV EULA=TRUE

# Expose the default Minecraft port
EXPOSE 25565

# Persist server data
VOLUME /data

# Start the server (the itzg image handles launching)
CMD ["start"]
