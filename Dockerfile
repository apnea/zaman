FROM nvcr.io/nvidia/pytorch:23.12-py3

# Set working directory
WORKDIR /workspace

# Update package list and upgrade existing packages
RUN apt-get update && apt-get upgrade -y

# Install commonly needed development tools
RUN apt-get install -y \
    fish\
    git \
    vim \
    nano \
    curl \
    wget \
    htop \
    tree \
    build-essential \
    software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install uv to /usr/local/bin
RUN curl -LsSf https://astral.sh/uv/install.sh | sh && mv /root/.local/bin/uv /usr/local/bin

# Upgrade pip and install common Python packages
RUN uv pip install --system --upgrade pip setuptools wheel

# Install additional Python packages commonly used in ML development
RUN uv pip install --system \
    jupyter \
    jupyterlab \
    notebook \
    matplotlib \
    seaborn \
    plotly \
    pandas \
    numpy \
    scikit-learn \
    opencv-python \
    pillow \
    tqdm \
    wandb \
    tensorboard \
    antropy \
    tsai \
    tsflex
# Expose Jupyter port
EXPOSE 8888
