FROM nvcr.io/nvidia/pytorch:23.12-py3

WORKDIR /workspace

# Install system packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
        fish git vim nano curl wget htop tree \
        build-essential software-properties-common \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    mv /root/.local/bin/uv /usr/local/bin

# Use requirements.txt for Python packages
COPY requirements.txt ./

# Install Python packages with version pinning
RUN uv pip install --system --upgrade pip setuptools wheel && \
    uv pip install --system -r requirements.txt

EXPOSE 8888
