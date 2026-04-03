import tensorflow as tf

print("\n\n\nTensorFlow version:", tf.__version__)

print(f"Is TensorFlow built with CUDA support? {'Yes' if tf.test.is_built_with_cuda() else 'No'}")

if tf.config.list_physical_devices('GPU'):
    print("GPU devices found:")
    for gpu in tf.config.list_physical_devices('GPU'):
        print(f"  - {gpu}")
else:    
    print("No GPU devices found.")
