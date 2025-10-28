# MyQuote - Docker Setup Guide

This guide will help you run the MyQuote application using Docker on any device.

## Prerequisites

You only need **Docker** and **Docker Compose** installed on your machine:

- **Docker Desktop** (recommended for Windows/Mac): [Download here](https://www.docker.com/products/docker-desktop)
- **Docker Engine** (for Linux): [Install guide](https://docs.docker.com/engine/install/)

## Quick Start

### 1. Build and Run the Application

Open a terminal in the project directory and run:

```bash
docker-compose up --build
```

This command will:
- Build the Docker image with Ruby 3.2.2 and all dependencies
- Create the SQLite database
- Run migrations
- Seed the database with initial data
- Start the Rails server

### 2. Access the Application

Once you see the message `Listening on http://0.0.0.0:3000`, open your browser and go to:

```
http://localhost:3000
```

### 3. Stop the Application

Press `Ctrl+C` in the terminal, then run:

```bash
docker-compose down
```

## Common Commands

### Run in Detached Mode (Background)
```bash
docker-compose up -d
```

### View Logs
```bash
docker-compose logs -f
```

### Stop the Application
```bash
docker-compose down
```

### Rebuild After Changes
```bash
docker-compose up --build
```

### Access Rails Console
```bash
docker-compose exec web rails console
```

### Run Database Migrations
```bash
docker-compose exec web rails db:migrate
```

### Reset Database
```bash
docker-compose exec web rails db:drop db:create db:migrate db:seed
```

## Troubleshooting

### Port 3000 Already in Use
If you get an error about port 3000 being in use, either:
1. Stop the application using that port
2. Or change the port in `docker-compose.yml`:
   ```yaml
   ports:
     - "3001:3000"  # Use port 3001 instead
   ```

### Permission Issues (Linux/Mac)
If you encounter permission issues with volumes:
```bash
sudo chown -R $USER:$USER .
```

### Database Issues
If the database seems corrupted or you want a fresh start:
```bash
docker-compose down -v  # Remove volumes
docker-compose up --build
```

## What's Included

- **Ruby**: 3.2.2
- **Rails**: 7.0.8+
- **Database**: SQLite3
- **Server**: Puma
- **All dependencies**: Automatically installed from Gemfile

## Development Workflow

The application code is mounted as a volume, so any changes you make to the code will be reflected immediately. However:

- **Code changes**: Automatically reflected (may need page refresh)
- **Gemfile changes**: Requires rebuild (`docker-compose up --build`)
- **Database schema changes**: Requires migration (`docker-compose exec web rails db:migrate`)

## Notes

- The database files are stored in your local `db/` directory and persist between container restarts
- Logs are stored in your local `log/` directory
- The first build may take a few minutes to download and install everything
- Subsequent starts will be much faster

Enjoy using MyQuote!
