
import librosa
import os
from tensorflow import keras
from tensorflow.keras import backend as K
import numpy as np
def recall_m(y_true, y_pred):
    true_positives = K.sum(K.round(K.clip(y_true * y_pred, 0, 1)))
    possible_positives = K.sum(K.round(K.clip(y_true, 0, 1)))
    recall = true_positives / (possible_positives + K.epsilon())
    return recall

def precision_m(y_true, y_pred):
    true_positives = K.sum(K.round(K.clip(y_true * y_pred, 0, 1)))
    predicted_positives = K.sum(K.round(K.clip(y_pred, 0, 1)))
    precision = true_positives / (predicted_positives + K.epsilon())
    return precision

def f1_m(y_true, y_pred):
    precision = precision_m(y_true, y_pred)
    recall = recall_m(y_true, y_pred)
    return 2*((precision*recall)/(precision+recall+K.epsilon()))
y, sr = librosa.load(os.path.join("uploads/", "blob.wav"))
ps =  librosa.feature.melspectrogram (y=y ,  sr=sr )

ps = ps.flatten()[:2376].reshape(1,2376,1)
emotions = ["Neutral", "Calm", "Happy", "Sad", "Angry", "Fearful", "Disgust", "Surprised"]
model = keras.models.load_model('./res_model.h5', custom_objects={'f1_m': f1_m})
print(emotions[np.argmax(model.predict(ps)) - 1])
