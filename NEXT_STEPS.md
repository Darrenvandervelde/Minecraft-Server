# Next Steps - Minecraft Server Setup

## Phase 1: Initial Setup (Immediate)

### 1.1 Download Server Software
- [ ] Download Minecraft Server JAR from [minecraft.net](https://www.minecraft.net/download/server)
  - Choose version (Latest recommended or specific version)
  - Place JAR file in `server/` directory
  - Rename to `server.jar` for consistency

### 1.2 Accept EULA
- [ ] Run the server once: `java -Xmx1024M -Xms1024M -jar server/server.jar nogui`
- [ ] Server will create `eula.txt` - set `eula=true`
- [ ] Run server again to generate world and configuration files

### 1.3 Initial Configuration
- [ ] Edit `server/server.properties`:
  - [ ] Set `motd=` (Server name/message)
  - [ ] Set `max-players=` (recommend 10-20 for stability)
  - [ ] Set `difficulty=` (0=peaceful, 1=easy, 2=normal, 3=hard)
  - [ ] Set `gamemode=` (0=survival, 1=creative, 2=adventure, 3=spectator)
  - [ ] Set `pvp=` (true/false)
  - [ ] Set `server-port=` (default 25565)
  - [ ] Set `enable-query=true` (for server discovery)

## Phase 2: Scripts & Automation (Next)

### 2.1 Create Start Script
- [ ] Create `scripts/start.sh`:
  ```bash
  #!/bin/bash
  cd "$(dirname "$0")/../server"
  java -Xmx4G -Xms2G -jar server.jar nogui
  ```
- [ ] Make executable: `chmod +x scripts/start.sh`

### 2.2 Create Backup Script
- [ ] Create `scripts/backup.sh`:
  ```bash
  #!/bin/bash
  BACKUP_DIR="../backups"
  mkdir -p "$BACKUP_DIR"
  tar -czf "$BACKUP_DIR/backup-$(date +%Y%m%d-%H%M%S).tar.gz" ../server/world
  echo "Backup completed"
  ```
- [ ] Make executable: `chmod +x scripts/backup.sh`

### 2.3 Create Stop Script
- [ ] Create `scripts/stop.sh` for graceful server shutdown
- [ ] Make executable: `chmod +x scripts/stop.sh`

## Phase 3: Docker Setup (For Containerized Deployment)

### 3.1 Create Dockerfile
- [ ] Create `docker/Dockerfile`:
  ```dockerfile
  FROM openjdk:17-jdk-slim
  
  WORKDIR /minecraft
  COPY server/ ./server/
  COPY scripts/ ./scripts/
  
  RUN chmod +x ./scripts/start.sh
  
  EXPOSE 25565
  
  CMD ["./scripts/start.sh"]
  ```

### 3.2 Create Docker Compose
- [ ] Create `docker/docker-compose.yml`:
  ```yaml
  version: '3.8'
  services:
    minecraft:
      build:
        context: ../
        dockerfile: docker/Dockerfile
      container_name: minecraft-server
      ports:
        - "25565:25565"
      volumes:
        - minecraft-data:/minecraft/server/world
      environment:
        - MAX_RAM=4G
      restart: unless-stopped
  
  volumes:
    minecraft-data:
  ```

### 3.3 Create .dockerignore
- [ ] Create `docker/.dockerignore` to exclude unnecessary files

## Phase 4: Repository Organization

### 4.1 Directory Structure
- [ ] Verify all directories exist:
  ```
  server/          # Server JAR and properties
  plugins/         # Plugin JARs (if using Spigot/Paper)
  mods/            # Mod files (if using Forge/Fabric)
  config/          # Configuration files
  backups/         # Backup storage
  docker/          # Docker files
  scripts/         # Startup, backup, management scripts
  ```

### 4.2 Git Configuration
- [ ] Create `.gitignore`:
  ```
  server/world/
  server/cache/
  server/logs/
  server/*.log
  backups/
  *.jar
  !scripts/
  .DS_Store
  ```

### 4.3 Documentation
- [ ] Create `docs/MAINTENANCE.md` - Server maintenance procedures
- [ ] Create `docs/PLUGINS.md` - Plugin installation guide
- [ ] Create `docs/TROUBLESHOOTING.md` - Common issues and solutions

## Phase 5: Monitoring & Maintenance

### 5.1 Logging Setup
- [ ] Configure server logging in `server/server.properties`
- [ ] Set up log rotation for `server/logs/` directory
- [ ] Create `scripts/check-logs.sh` for log monitoring

### 5.2 Backup Strategy
- [ ] Schedule automatic backups (cron job recommended):
  ```bash
  0 */6 * * * /path/to/scripts/backup.sh
  ```
- [ ] Set retention policy (e.g., keep last 10 backups)

### 5.3 Performance Tuning
- [ ] Monitor server performance metrics
- [ ] Adjust RAM allocation in scripts
- [ ] Configure `server.properties` for optimal performance

## Phase 6: Security & Networking

### 6.1 Network Configuration
- [ ] Configure port forwarding (if hosting locally)
- [ ] Set up firewall rules for port 25565
- [ ] Consider whitelist mode for private servers

### 6.2 Admin Setup
- [ ] Define server admins in `ops.json`
- [ ] Set up authentication if needed
- [ ] Configure difficulty/gamemode locks

### 6.3 Security Hardening
- [ ] Disable rcon if not needed
- [ ] Use strong server properties passwords
- [ ] Regular security updates for Java and server software

## Phase 7: Optional Enhancements

### 7.1 Plugins (if using Spigot/Paper)
- [ ] Download compatible plugins
- [ ] Place in `plugins/` directory
- [ ] Configure plugin files
- [ ] Test plugin compatibility

### 7.2 Mods (if using Forge/Fabric)
- [ ] Download compatible mods
- [ ] Place in `mods/` directory
- [ ] Update mod loader if necessary
- [ ] Test mod compatibility

### 7.3 Performance Improvements
- [ ] Install performance plugins (e.g., Spark)
- [ ] Monitor TPS (Ticks Per Second)
- [ ] Optimize chunk loading settings

## Phase 8: Testing & Deployment

### 8.1 Local Testing
- [ ] Test server startup with `./scripts/start.sh`
- [ ] Test backup functionality
- [ ] Verify all configurations load correctly
- [ ] Test with multiple player connections

### 8.2 Docker Testing
- [ ] Build Docker image: `docker build -t minecraft-server:latest docker/`
- [ ] Run container and test
- [ ] Verify persistence with volumes
- [ ] Test restart behavior

### 8.3 Documentation Finalization
- [ ] Update README.md with deployment instructions
- [ ] Document all custom scripts and their usage
- [ ] Create troubleshooting guide
- [ ] Add performance tuning recommendations

## Critical Checklist Before Going Live

- [ ] EULA accepted (`eula.txt`)
- [ ] `server.properties` properly configured
- [ ] Adequate backups in place
- [ ] Startup script tested and working
- [ ] Port forwarding configured (if needed)
- [ ] Java version compatible (17+)
- [ ] Sufficient disk space and RAM available
- [ ] All scripts are executable (`chmod +x`)
- [ ] `.gitignore` configured to not commit world data
- [ ] Regular backup schedule established

## Resource Requirements

| Resource | Minimum | Recommended |
|----------|---------|-------------|
| RAM | 2GB | 4GB+ |
| Disk Space | 5GB | 20GB+ |
| CPU Cores | 2 | 4+ |
| Java Version | 11+ | 17+ LTS |
| Network | 100 Mbps | 1 Gbps |

## Useful Commands

```bash
# Start server
./scripts/start.sh

# Backup world
./scripts/backup.sh

# Docker deployment
docker-compose -f docker/docker-compose.yml up -d

# Check server logs
tail -f server/logs/latest.log

# Stop Docker container
docker-compose -f docker/docker-compose.yml down
```

## Support Resources

- [Minecraft Server Documentation](https://minecraft.fandom.com/wiki/Server)
- [Spigot Documentation](https://www.spigotmc.org/wiki/)
- [Paper Server Documentation](https://docs.papermc.io/)
- [Docker Documentation](https://docs.docker.com/)
- [Java Documentation](https://docs.oracle.com/en/java/)

---

**Last Updated:** July 22, 2026  
**Next Review:** After initial server deployment
