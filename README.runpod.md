# Use Dynamo on RunPod

Build Dynamo on RunPod.


## Option 1: Use a pre-built image

Use the image that @GindaChen has built:
```
mike307/dynamo-dev:0.1.0
```

The Dynasor is already installed in the image under `/dynamo-workspace/`.

```
/dynamo-workspace
|-- dynamo         # Dynamo Repo
|-- dynamo-venv    # Dynamo Virtual Environment
`-- install.sh     # Script to build Dynamo
```

Once you created a pod, run Dynamo and try a simple example with vLLM:
```bash
# Activate the virtual environment
source /dynamo-workspace/dynamo-venv/bin/activate

# Run Dynamo
export LD_LIBRARY_PATH=/dynamo-workspace/envs/dynamo/lib:$LD_LIBRARY_PATH
dynamo run out=vllm Qwen/Qwen2.5-0.5B
```


## Option 2: Prepare RunPod Environment


Use the following image for your template:
```
nvidia/cuda:12.8.1-cudnn-devel-ubuntu24.04
```

or, use the runpod template `Dynamo Base`. 


1. Install dependencies
```bash
apt-get install -y curl wget git tmux tree less sudo figlet \
    toilet lolcat htop nvtop ccache \
    autoconf automake libtool pkg-config build-essential

curl -LsSf https://astral.sh/uv/install.sh | sh

git clone https://github.com/ai-dynamo/dynamo.git
cd dynamo/

# Install libucx0 as dependency
DEBIAN_FRONTEND=noninteractive apt-get install -yq libucx0
```

2. Create virtual environment and install Dynamo
```bash
# Create virtual environment
mkdir -p /workspace/envs
uv venv /workspace/envs/dynamo
source /workspace/envs/dynamo/bin/activate
uv pip install "ai-dynamo[all]"
```

3. Run Dynamo and try a simple example with vLLM
```bash
source /workspace/envs/dynamo/bin/activate

# Run Dynamo
export LD_LIBRARY_PATH=/workspace/envs/dynamo/lib:$LD_LIBRARY_PATH
dynamo run out=vllm Qwen/Qwen2.5-0.5B
```
