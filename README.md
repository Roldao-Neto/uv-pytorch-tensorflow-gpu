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

- Linux
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
├── PyTorch
│   ├── MNIST.ipynb
│   └── test_installation.py
├── TensorFlow
│   ├── MNIST.ipynb
│   └── test_installation.py
├── .python-version 
├── License 
├── pyproject.toml 
├── README.md  
├── setupKernel.sh 
└── uv.lock 
```

## Quick Start

### Quick Project Setup

Once you have followed all the next steps to correctly setup your environment for your future projects, you can use the following commands to pull all the important files in a new directory to start a fresh project:

#### TensorFlow Project

```bash
npx degit Roldao-Neto/uv-pytorch-tensorflow-gpu#tensorflow my_project
```

#### PyTorch Project

```bash
npx degit Roldao-Neto/uv-pytorch-tensorflow-gpu#PyTorch my_project
```

#### TensorFlow & PyTorch Project

```bash
npx degit Roldao-Neto/uv-pytorch-tensorflow-gpu#main my_project
```

### Regular Setup (.py files)

Fortunately, we do not have to install CUDA on our PCs to use PyTorch and TensorFlow, since you can install them with their CUDA. But, in order to make them uv compatible, you will need to add a wrapper in your `~/bashrc` file. The following command adds this wrapper:

```bash
export '
# Wrapper para uv run que configura LD_LIBRARY_PATH>
uv() {
    if [ "$1" = "run" ] && [ -f ".venv/bin/activate" ]; then
        local nvidia_libs=$(find ".venv/lib" -path "*/nvidia/*/lib" -type d 2>/dev/null | tr "\n" ":")
        if [ -n "$nvidia_libs" ]; then
            LD_LIBRARY_PATH="${nvidia_libs}${LD_LIBRARY_PATH}" command uv "$@"
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

**(Optional)**: You can disable a common warning from TF about ONEDNN by adding the following line to your bashrc file with the following command:

```bash
echo 'export TF_ENABLE_ONEDNN_OPTS=0' >> ~/.bashrc
echo 'export TF_CPP_MIN_LOG_LEVEL=1' >> ~/.bashrc
source ~/.bashrc
```

Setting these variables will disable ONEDNN and some warnings. ONEDNN is an optimized Intel's Deep Learning library, if your CPU is from Intel, it would make it faster to run DL operations (Convolutions, Matrix Multiplications, ...), but in the cost of floating point precision and reproducibility.

### Enabling Jupyter with uv

When you are working with DL, you regularly want to prototype and separate your code, instead of writing it all in one file and running it again and again until you achieve your goal. That's why many people really like using jupyter notebooks (.ipynb files), where you can use markdown notation to write your notes and execute different cells of code separately.

Therefore, it is recommended to learn and enable this tool in your DL projects. Here, I will present a quick tutorial on how to do that, but I strongly recommend you to read the full documentation of uv later in this link: [using jupyter within a project](https://docs.astral.sh/uv/guides/integration/jupyter/#using-jupyter-within-a-project)

What we will do is creating a kernel for our project, which enables the Jupyter Server to run in one environment. In order to do that, you will need to add `ipykernel` in your dependencies. You can do that with the following command:

```bash
uv add --dev ipykernel
```

In order to not needing to create a new kernel every time I create a new project, I will create a generic global kernel that depends on the wrapper done in the first step of the quick start, which injects `LD_LIBRARY_PATH` and the other Environment Variables in my notebook.

To do it, you will need to create a directory for your kernel in the correct path and execute the bash script `setupKernel.sh`:

```bash
mkdir -p ~/.local/share/jupyter/kernels/uv-python/

bash setupKernel.sh
```

**(ATTENTION)**: you will need to run the bash script every time you switch to a new project. It needs to be run in the root of the project so it can update the PATH of your CUDA downloaded with TensorFlow

To check if it worked, you can inspect the available jupyter kernels with the following command:

```bash
jupyter kernelspec list
```

If it prints a kernel named `uv-python` it worked.

## License

MIT
