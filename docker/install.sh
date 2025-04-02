#!/bin/bash
set -e

# Create virtual environment
python3 -m venv dynamo-venv
source dynamo-venv/bin/activate

# Install ai-dynamo[all]
pip install --no-cache-dir 'ai-dynamo[all]'

# Optional: remove pip cache directory (in case pip ignores --no-cache-dir)
rm -rf ~/.cache/pip