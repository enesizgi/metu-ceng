# Muhammed Enes Izgi - 2310142
# Emre Berk Kaya - 2380590

from sre_constants import IN
import cv2
import numpy as np
import matplotlib.pyplot as plt
import os
from sympy import fwht 

INPUT_PATH = "/Users/emreberkkaya/Desktop/ceng/466/the2/THE2_images/"
OUTPUT_PATH = "/Users/emreberkkaya/Desktop/ceng/466/the2/Outputs/"


def read_image(img_path):
    img = cv2.imread(img_path)
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    return img


def write_image(img, output_path):
    cv2.imwrite(output_path, cv2.cvtColor(img, cv2.COLOR_RGB2BGR))

def fourier_transform_fn(img):
    img_float32 = np.float32(img)
    dft = cv2.dft(img_float32, flags = cv2.DFT_COMPLEX_OUTPUT)
    dft_shift = np.fft.fftshift(dft)
    magnitude_spectrum = 20*np.log(cv2.magnitude(dft_shift[:,:,0],dft_shift[:,:,1]))
    return magnitude_spectrum

def fourier_transform(img):
    (R, G, B) = cv2.split(img)
    R = fourier_transform_fn(R)
    G = fourier_transform_fn(G)
    B = fourier_transform_fn(B)
    return cv2.merge([R, G, B])

def hadamard_fn(img):
    (row, col) = img.shape
    flatImage = img.flatten()
    hadamard = fwht(flatImage)
    hadamard = np.array(hadamard)
    (row, col) = hadamard.shape
    newImage = hadamard.reshape(row, col)
    return newImage

def hadamard_transform(img):
    (R, G, B) = cv2.split(img)
    R = hadamard_fn(R)
    G = hadamard_fn(G)
    B = hadamard_fn(B)
    return cv2.merge([R, G, B])
    

if __name__ == '__main__':
    if not os.path.exists(OUTPUT_PATH):
        os.makedirs(OUTPUT_PATH)

    # Fourier
    img1 = read_image(INPUT_PATH + "1.png")
    imgx = read_image(INPUT_PATH + "xx.png")
    img1_fourier = fourier_transform(img1)
    write_image(img1_fourier, OUTPUT_PATH + 'F1.png')

    img2 = read_image(INPUT_PATH + "2.png")
    img2_fourier = fourier_transform(img2)
    write_image(img2_fourier, OUTPUT_PATH + 'F2.png')

    imgx_hadamard = hadamard_transform(imgx)
    write_image(imgx_hadamard, OUTPUT_PATH + 'xxx.png')





    

