FROM gitpod/workspace-full

USER gitpod

# Install system dependencies
RUN sudo apt-get update && sudo apt-get install -y \
    wget \
    bzip2 \
    ca-certificates \
    curl \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/*

# Install Miniforge3 (includes conda and mamba, replaces deprecated Mambaforge)
RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh \
    && bash Miniforge3-Linux-x86_64.sh -b -p $HOME/miniforge3 \
    && rm Miniforge3-Linux-x86_64.sh

# Initialize conda/mamba for bash
RUN $HOME/miniforge3/bin/conda init bash

# Add miniforge to PATH
ENV PATH="$HOME/miniforge3/bin:$PATH"
