FROM gitpod/workspace-full

USER gitpod

# Install system dependencies
RUN sudo apt-get update && sudo apt-get install -y \
    wget \
    bzip2 \
    ca-certificates \
    curl \
    tar \
    gzip \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/*

# Install micromamba
RUN curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba \
    && sudo mv bin/micromamba /usr/local/bin/micromamba \
    && sudo chmod +x /usr/local/bin/micromamba

# Set environment variables for micromamba
ENV MAMBA_ROOT_PREFIX=/home/gitpod/micromamba
ENV MAMBA_EXE=/usr/local/bin/micromamba

# Create the micromamba directory and initialize
RUN mkdir -p /home/gitpod/micromamba \
    && micromamba shell init -s bash \
    && echo 'export MAMBA_ROOT_PREFIX=/home/gitpod/micromamba' >> /home/gitpod/.bashrc \
    && echo 'export MAMBA_EXE=/usr/local/bin/micromamba' >> /home/gitpod/.bashrc
