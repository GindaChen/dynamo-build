FROM nvidia/cuda:12.8.1-cudnn-devel-ubuntu24.04

# Avoid interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# Install basic utilities and Python dev packages
RUN apt-get update && apt-get install -yq \
    curl wget git tmux tree less sudo \
    figlet toilet lolcat htop nvtop \
    ccache autoconf automake libtool pkg-config build-essential \
    python3 python3-dev python3-pip python3-venv libucx0 \ 
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set up build workspace
RUN mkdir -p /dynamo-workspace
WORKDIR /dynamo-workspace

# Clone dynamo
RUN git clone https://github.com/ai-dynamo/dynamo.git

# Activate virtualenv and install ai-dynamo[all]
COPY install.sh .
RUN chmod +x install.sh && ./install.sh

# Set default working directory
WORKDIR /dynamo-workspace
CMD ["/bin/bash"]