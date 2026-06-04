# uv-pytorch-tensorflow-gpu

**A practical guide to setting up GPU-accelerated deep learning with [uv](https://github.com/astral-sh/uv) — covering both PyTorch and TensorFlow with Jupyter Notebook, with end-to-end MNIST training examples.**

## So you decided to create a TensorFlow project!

This `README.md` assumes that you've read and followed the setup steps described in the main branch. If you have not, please do it [here](https://github.com/Roldao-Neto/uv-pytorch-tensorflow-gpu/).

## Repository Structure

```txt
uv-pytorch-tensorflow-gpu/
│
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

## Next Steps

Run the following commands:

```bash
uv sync
```

That's it! Now to run your `.py` files run:

```bash
# Test it with the test installation!
uv run ./TensorFlow/test_installation.py
```

To run a Jupyter Notebook:

1) Run the following command:

```bash
bash setupKernel.sh
```
2) Click Select a Kernel (In the top-right corner)
3) Select the Kernel that shows the Kernel you set up before.
4) Run the Jupyter Notebook Test (MNIST.ipynb)

**Have fun with your TensorFlow Project!**

## License

MIT
