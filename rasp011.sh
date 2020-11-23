'#!/bin/sh'

echo "creating a virtual environment..."
python3 -m venv testenv python=3.8

# virtual env is activated
echo "activating virtual environment - testenv..."
. ./testenv/bin/activate

echo "installing wheel..."
pip3 install wheel

echo "installing tflite_runtime..."
pip3 install https://github.com/google-coral/pycoral/releases/download/release-frogfish/tflite_runtime-2.5.0-cp38-cp38-linux_armv7l.whl

echo "installing cv2..."
pip3 install opencv-python

echo "installing numpy..."
pip3 install numpy

$SHELL
