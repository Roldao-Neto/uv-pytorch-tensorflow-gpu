# uv-pytorch-tensorflow-gpu

**A practical guide to setting up GPU-accelerated deep learning with [uv](https://github.com/astral-sh/uv) — covering both PyTorch and TensorFlow with Jupyter Notebook, with end-to-end MNIST training examples.**

## So you decided to create a PyTorch project!

This `README.md` assumes that you've read and followed the setup steps described in the main branch. If you have not, please do it [here](https://github.com/Roldao-Neto/uv-pytorch-tensorflow-gpu/).

## Repository Structure

```txt
uv-pytorch-tensorflow-gpu/
│
├── PyTorch
│   ├── MNIST.ipynb
│   └── test_installation.py
├── .python-version 
├── License 
├── pyproject.toml 
├── README.md  
└── uv.lock 
```

## Next Steps

Run the following commands:

```bash
uv sync
```

That's it! Now to run your `.py` files run:

```bash
# Test it with the test installation!
uv run ./PyTorch/test_installation.py
```

To run Jupyter Notebooks (`.ipynb` files):

1) Click Select a Kernel (In the top-right corner)
2) Select the Kernel that shows the path of the `.venv` in you repository.
3) Run the Jupyter Notebook Test (MNIST.ipynb)

You can also start a jupyter server using this .venv if you want to.

**Have fun with your PyTorch Project!**

## License

MIT
