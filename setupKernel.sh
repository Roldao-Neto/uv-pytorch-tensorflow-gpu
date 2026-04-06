nvidia_libs=$(find "$(pwd)/.venv/lib" -path "*/nvidia/*/lib" -type d 2>/dev/null | tr '\n' ':')

cat > ~/.local/share/jupyter/kernels/uv-python/kernel.json << EOF
{
    "argv": ["uv", "run", "python", "-m", "ipykernel_launcher", "-f", "{connection_file}"],
    "display_name": "Python (uv)",
    "language": "python",
    "env": {
        "LD_LIBRARY_PATH": "${nvidia_libs}"
        "TF_ENABLE_ONEDNN_OPTS": "0",
        "TF_CPP_MIN_LOG_LEVEL": "1"
    }
}
EOF