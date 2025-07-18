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

# Set up micromamba environment (faster and more suitable for GitPod than full mamba)
ENV MAMBA_ROOT_PREFIX /workspace/micromamba
ENV MAMBA_EXE /usr/local/bin/micromamba
ENV PATH $MAMBA_ROOT_PREFIX/bin:$PATH

# Install micromamba
RUN curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba \
    && sudo mv bin/micromamba /usr/local/bin/micromamba \
    && sudo chmod +x /usr/local/bin/micromamba

# Initialize micromamba for gitpod user (correct syntax without -p flag)
RUN micromamba shell init -s bash
