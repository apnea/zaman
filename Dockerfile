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

# Upgrade pip and install common Python packages
RUN pip install --upgrade pip setuptools wheel

# Install additional Python packages commonly used in ML development
RUN pip install \
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
    tensorboard

# Configure Jupyter Lab
RUN jupyter lab --generate-config
RUN echo "c.ServerApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.port = 8888" >> /root/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.open_browser = False" >> /root/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.allow_root = True" >> /root/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.token = ''" >> /root/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.password = ''" >> /root/.jupyter/jupyter_lab_config.py

# Expose Jupyter port
EXPOSE 8888

# Set default command to start Jupyter Lab
CMD ["jupyter", "lab"]
