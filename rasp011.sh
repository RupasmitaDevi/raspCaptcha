'#!/bin/sh' 

echo "creating folder..."
mkdir project2_group_2
cd project2_group_2

echo "installing virtualenv..."
pip install virtualenv

echo "checking the installed virtualenv version..."
virtualenv --version

echo "creating a virtual env with python 3.8..."
virtualenv testenv

# virtual env is activated
echo "activating virtual environment - testenv..."
source testenv/bin/activate

echo "installing wheel..."
pip install wheel

echo "installing tflite_runtime..."
pip3 install https://github.com/google-coral/pycoral/releases/download/release-frogfish/tflite_runtime-2.5.0-cp38-cp38-linux_armv7l.whl

echo "installing cv2..."
pip install opencv-python

echo "installing numpy..."
pip install numpy

$SHELL
