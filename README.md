# Minecraft Server

![poster](./poster.jpg)

This repository contains the configuration and setup files for the Minecraft server.

## Directory Structure

```
.
├── server/              # Server files and configuration
├── plugins/             # Server plugins
├── mods/                # Server mods (Forge or Fabric)
├── config/              # Configuration files
├── backups/             # Server backups
├── docker/              # Docker configuration
└── scripts/             # Setup and management scripts
```

## Requirements

| Requirement | Details |
|---|---|
| Java | Version 17 or higher |
| Docker | Docker and Docker Compose for containerized deployment |
| RAM | Minimum 2GB, 4GB or more recommended |

## Getting Started

1. Clone this repository
2. Install Java 17 or higher
3. Download the server jar file and place it in the `server/` directory
4. Configure `server/server.properties`
5. Run the server using `./scripts/start.sh`

## Quick Start with Docker

```bash
docker-compose -f docker/docker-compose.yml up -d
```

## Server Configuration

Edit `config/server.properties` to configure your server settings:

| Setting | Description |
|---|---|
| Server name | The name displayed to players |
| Max players | Maximum concurrent player count |
| Difficulty | Peaceful, Easy, Normal, or Hard |
| Game mode | Survival, Creative, or Adventure |
| Port | The port the server listens on |
| PvP | Enable or disable player vs player combat |

## Backups

Automatic backups can be created using the backup script:

```bash
./scripts/backup.sh
```

Backups are stored in the `backups/` directory.

## Contributing

Please follow the contribution guidelines when making changes to the server configuration.
