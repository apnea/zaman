# Zaman PyTorch Development Container

This setup provides a complete PyTorch development environment using NVIDIA's official PyTorch container as the base.
Uses 23.12, the last container supporting the Pascal arch (see also https://docs.nvidia.com/deeplearning/frameworks/support-matrix/index.html#framework-matrix-2023)

Jupyter Lab will start automatically and be available at: http://localhost:8889

## Features

- **Base Image**: `nvcr.io/nvidia/pytorch:23.12-py3`
- **GPU Support**: Full NVIDIA GPU access
- **Jupyter Lab**: Starts automatically on container launch
- **Development Tools**: git, vim, nano, htop, tree, build-essential
- **Python Packages**: 
  - Jupyter Lab/Notebook
  - Common ML libraries (matplotlib, seaborn, plotly, pandas, numpy, scikit-learn)
  - Computer Vision (opencv-python, pillow)
  - Utilities (tqdm, wandb, tensorboard)

See also https://docs.nvidia.com/deeplearning/frameworks/support-matrix/index.html#framework-matrix-2023

## Port Mappings

- `8889`: Jupyter Lab (starts automatically)
- `6006`: TensorBoard
- `8080`: General purpose

## Volume Mounts

- Current directory (`zaman/`) mounted to `/workspace/zaman` in container
- Git configuration shared from host
- SSH keys shared from host (read-only)

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

## Roadmap

[ ] pin correct python versions based on base container python install

[ ] remove redundant libs

[ ] install TensorRT / check

## Refs

https://jan.ai/post/benchmarking-nvidia-tensorrt-llm

