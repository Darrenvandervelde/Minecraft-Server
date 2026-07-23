# Minecraft Server

<!--Hey There-->

This repository contains the Minecraft Server configuration and setup.

## Directory Structure

```
.
├── server/              # Server files and configuration
├── plugins/             # Server plugins
├── mods/                # Server mods (if using Forge/Fabric)
├── config/              # Configuration files
├── backups/             # Server backups
├── docker/              # Docker configuration
└── scripts/             # Setup and management scripts
```

## Getting Started

1. Clone this repository
2. Install Java (version 17 or higher recommended)
3. Download the server jar file and place in `server/` directory
4. Configure `server/server.properties`
5. Run the server using `./scripts/start.sh`

## Requirements

- Java 17+
- Docker & Docker Compose (for containerized deployment)
- At least 2GB RAM (4GB+ recommended)

## Quick Start with Docker

```bash
docker-compose -f docker/docker-compose.yml up -d
```

## Server Configuration

Edit `config/server.properties` to configure your server settings including:
- Server name
- Max players
- Difficulty level
- Game mode (survival, creative, adventure)
- Port settings
- PvP settings

## Backups

Automatic backups can be created using the backup script:

```bash
./scripts/backup.sh
```

## Contributing

Please follow the contribution guidelines when making changes to the server configuration.
