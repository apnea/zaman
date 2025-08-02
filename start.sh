#!/bin/bash

# Zaman PyTorch Development Container Startup Script

set -e

echo "Starting Zaman PyTorch Development Environment..."

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "ERROR: Docker is not running. Please start Docker first."
    exit 1
fi

# Check if NVIDIA Docker runtime is available
if ! docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi > /dev/null 2>&1; then
    echo "WARNING: NVIDIA Docker runtime not available. GPU support may not work."
    echo "   Continuing anyway..."
fi

# Build and start the container
echo "Building and starting container..."
docker-compose up -d --build

echo "Container started successfully!"
echo ""
echo "Jupyter Lab is starting automatically and will be available at:"
echo "   http://localhost:8888"
echo ""
echo "Quick commands:"
echo "   View container logs:    docker-compose logs -f pytorch-dev"
echo "   Access container shell: docker-compose exec pytorch-dev /bin/bash"  
echo "   Stop container:         docker-compose down"
echo ""
echo "Other available ports:"
echo "   TensorBoard: http://localhost:6006"
echo "   Custom:      http://localhost:8080"
echo ""
echo "Note: Jupyter Lab starts without authentication (token/password disabled)"