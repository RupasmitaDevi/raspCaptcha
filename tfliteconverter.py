import argparse
import tensorflow as tf

def main():

    parser = argparse.ArgumentParser()
    parser.add_argument('--model-name', help='Model name to use for classification', type=str)
    args = parser.parse_args()

    with tf.device('/cpu:0'):
        keras_model = tf.keras.models.load_model(args.model_name+'.h5')
        converter = tf.lite.TFLiteConverter.from_keras_model(keras_model)
        model = converter.convert()
        open("converted_model1.tflite", "wb").write(model)

if __name__ == '__main__':
    main()