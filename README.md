# uv-pytorch-tensorflow-gpu

**A practical guide to setting up GPU-accelerated deep learning with [uv](https://github.com/astral-sh/uv) — covering both PyTorch and TensorFlow with Jupyter Notebook, with end-to-end MNIST training examples.**

## Why uv?

Python packaging for GPU workloads has historically been painful (if you do not want to use Docker for some reason). CUDA-specific wheels, conflicting dependencies, and fragile `pip` incantations make reproducible environments hard to achieve.

If you do want to use Docker (Recommended), check: **REPO UNDER BUILD**.

`uv` is a really fast Python package manager written in Rust. It resolves environments in milliseconds, handles platform-specific wheels cleanly.

This repo shows you how to wire `uv` together with NVIDIA GPU support for both major deep learning frameworks, and gives you working MNIST examples to verify everything runs correctly end to end.

## Prerequisites

Before continuing, make sure you have the following:

### **Hardware**

- A compatible NVIDIA GPU, check it in [developer.nvidia](https://developer.nvidia.com/cuda/gpus)

### **System software**

- Linux (Not tested on Windows)
- Updated NVIDIA Driver
- Cuda Toolkit drivers installed

> Good news for you when installing the CUDA driver:

TensorFlow and PyTorch, in their latest versions, usually support different versions of CUDA, but CUDA has forward compatibility, which means that a new version of CUDA usually runs older versions without a problem!

**Recommendation:** Just install the newest CUDA version, check the **Quick_Start** section below to continue!

### **Python tooling**

- `uv` installed — if you haven't already check their [documentation](https://github.com/astral-sh/uv).

- Python **>=3.10** (uv can manage this for you — see the setup guides), you MUST also verify what is the latest Python version in which Tensorflow and PyTorch are available.

**For this examples I will be using Python 3.12, since it is currently the latest Python version with the latest stable version of TensorFlow (2.21) and PyTorch (2.6) available**.

## Repository Structure

```txt
uv-pytorch-tensorflow-gpu/
│
├── README.md                    ← You are here
├── License
├── pyproject.toml
├── uv.lock
└── .python-version 
```

## Quick Start

1) Verify if you have you nvidia driver updated && CUDA version. You can run the following command to check if they are downloaded:

```bash
# This command will return some GPU Stats
# One of these is CUDA Version
# If it does not appear, you will need to follow steps 2-4
nvidia-smi
```

2) Find the correct repository for your Linux Distro in [developer.nvidia cuda downloads](https://developer.nvidia.com/cuda-downloads). In order to know your distro and version:

```bash
cat /etc/os-release
uname -m # Architecture
```

3) Add the repo (recommended: network) to your system following the tutorial in their website.

4) After adding the new repo, there is a huge chance that your system also provides a nvidia driver for your repo, causing a conflict. In order to resolve that, you will need to uninstall your current nvidia-driver (if downloaded) to install NVIDIA's.

Here is a example on Fedora 43 KDE:

```bash
# Update for safety:
sudo dnf update

# Print all enabled repositories:
sudo dnf repolist

# Both this repos are conflicting, I will keep NVIDIA's:
# rpmfusion-nonfree-nvidia-driver
# cuda-fedora43-x86_64

# Disable rpmfusion nvidia driver
sudo dnf config-manager setopt rpmfusion-nonfree-nvidia-driver.enabled=0

# Remove drivers from the deleted repo:
sudo dnf remove xorg-x11-drv-nvidia nvidia-modprobe nvidia-persistenced nvidia-settings

# Reinstall driver + Install Toolkit
sudo dnf install cuda-toolkit nvidia-driver-cuda

# Add to PATH:
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc

echo '# CUDA - carrega libs do venv ativo automaticamente
if [ -n "$VIRTUAL_ENV" ]; then
    export LD_LIBRARY_PATH=$(find $VIRTUAL_ENV/lib -path "*/nvidia/*/lib" -type d 2>/dev/null | tr "\n" ":")$LD_LIBRARY_PATH
fi' >> ~/.bashrc
source ~/.bashrc

source ~/.bashrc

# Update & Reboot system:
sudo dnf update
sudo reboot -h now
```

5) To check if everything is ok now run the following commands. Both commands should print your GPU stats and the nvcc version.

```bash
nvidia-smi
nvcc --version
```

6) 

## License

MIT
