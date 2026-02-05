FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    ninja-build \
    gcc-arm-none-eabi \
    git \
    curl \
    wget \
    gdb \
    python3 \
    python3-pip \
    ca-certificates \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Nem-root user devcontainerhez
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} -s /bin/bash \
    && mkdir -p /workspace \
    && chown -R ${USERNAME}:${USERNAME} /workspace

WORKDIR /workspace
USER ${USERNAME}

CMD ["bash"]
