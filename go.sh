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
source temp/bin/activate
cd ./project2
cd ./code/validationData

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
