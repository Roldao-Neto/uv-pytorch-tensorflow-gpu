# uv-pytorch-tensorflow-gpu

**A practical guide to setting up GPU-accelerated deep learning with [uv](https://github.com/astral-sh/uv) — covering both PyTorch and TensorFlow with Jupyter Notebook, with end-to-end MNIST training examples.**

## Why uv?

Python packaging for GPU workloads has historically been painful (if you do not want to use Docker for some reason). CUDA-specific wheels, conflicting dependencies, and fragile `pip` incantations make reproducible environments hard to achieve.

If you do want to use Docker (Recommended), check: **REPO UNDER BUILD**.

`uv` is a really fast Python package manager written in Rust. It resolves environments in milliseconds, handles platform-specific wheels cleanly.

This repo shows you how to wire `uv` together with NVIDIA GPU support for both major deep learning frameworks, and gives you working MNIST examples to verify everything runs correctly end to end.

## Prerequisites

Before diving in, make sure you have the following:

**Hardware**:

- A compatible NVIDIA GPU, check it in [developer.nvidia](https://developer.nvidia.com/cuda/gpus)

**System software**:

- Linux (Not tested on Windows)
- Updated NVIDIA Driver — check with `nvidia-smi`

**Python tooling**:

- `uv` installed — if you haven't already check their [documentation](https://github.com/astral-sh/uv).

- Python **>=3.10** (uv can manage this for you — see the setup guides), you MUST also verify what is the latest Python version in which Tensorflow and PyTorch are available.

**For this examples I will be using Python 3.13, since it is currently the latest Python version with the latest stable version of TensorFlow (2.21) and PyTorch (2.6) available**.

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

<!-- TODO -->

## License

MIT
