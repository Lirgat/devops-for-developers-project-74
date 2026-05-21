# Сначала получаем имя пользователя GitHub
GITHUB_USERNAME="Lirgat"

cat > README.md << 'EOF'
# DevOps for Developers - Project 74

## CI/CD Status

[![CI/CD Pipeline](https://github.com/$GITHUB_USERNAME/devops-for-developers-project-74/actions/workflows/push.yml/badge.svg)](https://github.com/$GITHUB_USERNAME/devops-for-developers-project-74/actions/workflows/push.yml)

## Project Structure

- `app/` - JS Fastify Blog application
- `Dockerfile` - Development environment
- `Dockerfile.production` - Production build
- `docker-compose.yml` - Production compose configuration
- `docker-compose.override.yml` - Development overrides

## Local Development

```bash
# Setup and run
docker-compose up

# Run tests
make ci