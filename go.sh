# !/bin/bash
# Run TFlite inference from home with default values
# Should be placed in the home directory with paths changed to match your file structure

now=$(date)
echo "$now"
echo "Current date: $now"

modelFile="converted_model2.tflite"
captchaDir="KILROYDA-project2rpi"
outputFile="$captchaDir""_output.txt"

outputModified=" M $outputFile"
modelModified=" M $outputFile"

cd ./code

# create venv if none exists
if [  ! -d "./temp/bin" ]; then
    
    echo "Creating venv..."
    python3 -m venv temp python=3.8

    # virtual env is activated
    echo "Activating venv..."
    . ./temp/bin/activate

    echo "Installing wheel..."
    pip3 install wheel
 
    echo "Installing tflite_runtime..."
    pip3 install https://github.com/google-coral/pycoral/releases/download/release-frogfish/tflite_runtime-2.5.0-cp38-cp38-linux_armv7l.whl

    echo "Installing cv2..."
    pip3 install opencv-python

    echo "Installing numpy..."
    pip3 install numpy
else
    echo "Venv already exists"
    source temp/bin/activate
fi

cd ./project2
cd ./code/raspCaptcha

python classify.py --model-name $modelFile --captcha-dir $captchaDir --output $outputFile --symbols train_classify_symbols.txt

status=`git status --porcelain`

if [[ "$status" == "$outputModified" ]]; then
    echo "Output file has been changed:"
    echo "$status"
    git add $outputFile
    git commit -a -m "Current changes: $outputFile $now"
    git push 
elif [[ "$status" ]]; then
    echo "Some other files have been changed:"
    echo "$status"
else
    echo "No file changes in the output detected!"
fi
