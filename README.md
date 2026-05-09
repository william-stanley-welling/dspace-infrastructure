# DSpace Infrastructure

Complete Docker-based DSpace infrastructure setup with PostgreSQL and Solr.

## Quick Start

### Prerequisites
- Docker
- Docker Compose
- Git

### Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/william-stanley-welling/dspace-infrastructure.git
   cd dspace-infrastructure
   ```

2. **Configure environment:**
   ```bash
   cp .env.example .env
   # Edit .env with your settings
   ```

3. **Start services:**
   ```bash
   chmod +x scripts/*.sh
   ./scripts/start.sh
   ```

4. **Access services:**
   - DSpace: http://localhost:8080
   - Solr Admin: http://localhost:8983/solr

## Available Scripts

### Start Services
```bash
./scripts/start.sh
```

### Stop Services
```bash
./scripts/stop.sh
```

### Backup Database
```bash
./scripts/backup.sh
```

### Restore Database
```bash
./scripts/restore.sh <backup_file>
```

### Health Check
```bash
./scripts/health-check.sh
```

## Production Deployment

For production, use the production compose file:

```bash
docker-compose -f docker-compose.prod.yml up -d
```

Ensure:
- Environment variables are properly set in `.env`
- Database passwords are changed from defaults
- Services are configured for your domain
- Backup strategy is in place

## Architecture

- **DSpace**: Main application container
- **Solr**: Search and indexing engine
- **PostgreSQL**: Database backend
- **Network**: Isolated bridge network for inter-container communication

## Documentation

For detailed DSpace documentation, visit: https://wiki.lyrasis.org/display/DSPACE

## License

DSpace is licensed under the BSD license. See LICENSE file for details.
