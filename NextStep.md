

### 📄 Core Files
* README.md - Complete documentation with quick start guide
* .gitignore - Configured for server files and backups

### 🐳 Docker Configuration
* docker/Dockerfile - Java 17 container setup
* docker/docker-compose.yml - Full deployment stack

### ⚙️ Server Configuration
* config/server.properties - Pre-configured server settings with customizable options
### 📜 Management Scripts
* scripts/start.sh - Startup script with memory management
* scripts/backup.sh - Automated world backup with cleanup
### 🚀 Ready to Use
* Download server JAR from minecraft.net
* Place it in the server/ directory as server.jar
Start with:
```bash
chmod +x scripts/start.sh
./scripts/start.sh
Or use Docker:
bash
docker-compose -f docker/docker-compose.yml up -d
View your repository: https://github.com/Darrenvandervelde/Minecraft-Server
```
Your Minecraft Server is ready to go! 🎮
