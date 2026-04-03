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

Fortunatelly, we do not have to install CUDA on our PCs to use PyTorch and TensorFlow, since you can install them with their CUDA. But, in order to make them uv compatible, you will need to add a wrapper in your `~/bashrc` file. The following command adds this wrapper:

```bash
export '
# Wrapper para uv run que configura LD_LIBRARY_PAT>
uv() {
    if [ "$1" = "run" ] && [ -f ".venv/bin/activat>
        local nvidia_libs=$(find ".venv/lib" -path>
        if [ -n "$nvidia_libs" ]; then
            LD_LIBRARY_PATH="${nvidia_libs}${LD_LI>
            return
        fi
    fi
    command uv "$@"
}' >> ~/.bashrc

source ~/.bashrc
```

Now, they should be working on your terminal. However, if you are using the terminal in VSCode or another IDE you should configure you settings to run ~/.bashrc, you can do it in VSCode changing the following line to `settings.json`:

```json
"terminal.integrated.profiles.linux": {
    // exemple for bash
    "bash": {
      "path": "bash",
      "args": ["-i"],
      // ...
    },
    // ...
  },
```

## License

MIT
