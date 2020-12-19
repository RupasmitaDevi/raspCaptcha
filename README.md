# raspCaptcha

Go.sh is our automation script and can be run under the following assumptions:
1. 	In a linux environment, the script is located in the Home folder with a local git repo already set up in the following location
		~/code/project2/code/raspCaptcha
  	This directory must contain these files - converted_model2.tflite (a tflite model file), captcha_directory, the classify.py, train_classify_symbols.txt (the symobol set).
2.	The script assumes git and pip3 are already installed on the system but will create a venv and download other required libraries if they do not exist
3. 	The venv exists (or is newly created) in 
		~/code/temp
4. 	The configured git repo contains a valid tflite file and captcha directory, that will be downloaded if they don't exist locally.
5. 	The names of the associated model and test files (Line 10) are hardcoded into the script.
6. 	In case the git repo is not configured so we have provided the required files in this zip that would aid to run the automation script successfully.
Given these assumptions, the script can be run from the Home directory with:
		~$ bash go.sh 
	(or alternatively sourced if you prefer with:)
		~$ . go.sh
	If not already exist, the automation script will install/create the following -
		a virtual environment - "temp"
		install wheel
		install tflite_runtime (tflite_runtime-2.5.0-cp38-cp38-linux_armv7l)
		install opencv-python
		install numpy
