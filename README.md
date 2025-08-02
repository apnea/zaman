# Zaman PyTorch Development Container

This setup provides a complete PyTorch development environment using NVIDIA's official PyTorch container as the base.

## Prerequisites

- Docker and Docker Compose installed
- NVIDIA Docker runtime (for GPU support)
- NVIDIA drivers installed on host system

## Quick Start

### Build and run the container:
```bash
docker-compose up -d --build
```

Jupyter Lab will start automatically and be available at: http://localhost:8888

### Access the container shell (if needed):
```bash
docker-compose exec pytorch-dev /bin/bash
```

### Stop the container:
```bash
docker-compose down
```

## Features

- **Base Image**: `nvcr.io/nvidia/pytorch:23.12-py3`
- **GPU Support**: Full NVIDIA GPU access
- **Development Tools**: git, vim, nano, htop, tree, build-essential
- **Python Packages**: 
  - Jupyter Lab/Notebook
  - Common ML libraries (matplotlib, seaborn, plotly, pandas, numpy, scikit-learn)
  - Computer Vision (opencv-python, pillow)
  - Utilities (tqdm, wandb, tensorboard)

## Port Mappings

- `8888`: Jupyter Lab/Notebook
- `6006`: TensorBoard
- `8080`: General purpose

## Volume Mounts

- Current directory (`zaman/`) mounted to `/workspace/zaman` in container
- Git configuration shared from host
- SSH keys shared from host (read-only)

## Starting Jupyter Lab

From inside the container:
```bash
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root
```

Then access it at: http://localhost:8888

## GPU Testing

Test GPU availability inside the container:
```python
import torch
print(f"CUDA available: {torch.cuda.is_available()}")
print(f"CUDA devices: {torch.cuda.device_count()}")
if torch.cuda.is_available():
    print(f"Current device: {torch.cuda.current_device()}")
    print(f"Device name: {torch.cuda.get_device_name()}")
```