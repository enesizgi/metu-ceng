# Muhammed Enes Izgi - 2310142
# Emre Berk Kaya - 2380590

from heapq import merge
from sre_constants import IN
from sys import flags
import cv2
import numpy as np
import matplotlib.pyplot as plt
import os
from sympy import fwht 
import math
import scipy.fftpack as fp 
from skimage import exposure

INPUT_PATH = "/Users/emreberkkaya/Desktop/ceng/466/the2/THE2_images/"
OUTPUT_PATH = "/Users/emreberkkaya/Desktop/ceng/466/the2/Outputs/"


def read_image(img_path):
    img = cv2.imread(img_path)
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    return img


def write_image(img, output_path):
    img = np.float32(img)
    cv2.imwrite(output_path, cv2.cvtColor(img, cv2.COLOR_RGB2BGR))

def write_grayscale_image(img, output_path):
    img = np.float32(img)
    cv2.imwrite(output_path, img)

def split_image(img):
    R = img[:,:,0]
    G = img[:,:,1]
    B = img[:,:,2]
    return (R, G, B)

def merge_image(R, G, B):
    row, col = len(R), len(R[0])
    new_img = np.zeros((row, col, 3), dtype=complex)
    new_img[:,:,0] = R
    new_img[:,:,1] = G
    new_img[:,:,2] = B
    return new_img

def fourier_transform_fn(img):
    f = fp.fftn(img)
    fshift = fp.fftshift(f)
    return fshift

def inverse_fourier_transform_fn(dft):
    f_ishift = fp.ifftshift(dft)
    img_back = fp.ifftn(f_ishift)
    return img_back

def inverse_fourier_transform(img):
    (R, G, B) = split_image(img)
    R = inverse_fourier_transform_fn(R)
    G = inverse_fourier_transform_fn(G)
    B = inverse_fourier_transform_fn(B)
    return merge_image(R, G, B)

def fourier_transform(img):
    (R, G, B) = split_image(img)
    R = fourier_transform_fn(R)
    G = fourier_transform_fn(G)
    B = fourier_transform_fn(B)

    return merge_image(R, G, B)

def hadamard_fn(img):
    (rows, cols) = img.shape
    log2row = math.log(rows, 2)
    log2col = math.log(cols, 2)
    maxlog2 = max(log2row, log2col)
    ceil = math.ceil(maxlog2)
    newDimension = 2**ceil
    new_image = np.zeros((newDimension, newDimension)) # new image is 2^n x 2^n
    for i in range(rows):
        for j in range(cols):
            new_image[i][j] = img[i][j]
    newShape = new_image.shape
    flatImage = new_image.flatten()
    hadamard = fwht(flatImage)
    hadamard = np.array(hadamard)
    newImage = hadamard.reshape(newShape)
    return newImage[0:rows, 0:cols]

def hadamard_transform(img):
    (R, G, B) = cv2.split(img)
    R = hadamard_fn(R)
    G = hadamard_fn(G)
    B = hadamard_fn(B)
    return cv2.merge([R, G, B])

def cosine_fn(img):
    return fp.dct(fp.dct(img.T, norm='ortho').T, norm='ortho')

def cosine_transform(img):
    #(R, G, B) = cv2.split(img)
    (R, G, B) = split_image(img)
    R = cosine_fn(R.astype(float))
    G = cosine_fn(G.astype(float))
    B = cosine_fn(B.astype(float))
    return merge_image(R, G, B)

def insideCircle(point, center, r):
    return math.sqrt((point[0] - center[0])**2 + (point[1] - center[1])**2) <= r

def insideBand(point, center, r1, r2):
    dist = math.sqrt((point[0] - center[0])**2 + (point[1] - center[1])**2)
    return r1 <= dist and dist <= r2

def findCenter(img, rgb=False):
    return (img.shape[0] // 2, img.shape[1] // 2)

def ideal_lpf_fn(img, r):
    (rows, cols) = img.shape
    new_image = np.zeros((rows, cols), dtype=complex)
    
    lowerRow = (rows // 2) - r if (rows // 2) - r > 0 else 0
    upperRow = (rows // 2) + r if (rows // 2) + r < rows else rows - 1

    lowerCol = (cols // 2) - r if (cols // 2) - r > 0 else 0
    upperCol = (cols // 2) + r if (cols // 2) + r < cols else cols - 1
    
    for i in range(lowerRow, upperRow):
        for j in range(lowerCol, upperCol):
            new_image[i][j] = img[i][j]
    
    return new_image

def ideal_hpf_fn(img, r):
    (rows, cols) = img.shape
    new_image = np.copy(img)
    
    lowerRow = (rows // 2) - r if (rows // 2) - r > 0 else 0
    upperRow = (rows // 2) + r if (rows // 2) + r < rows else rows - 1

    lowerCol = (cols // 2) - r if (cols // 2) - r > 0 else 0
    upperCol = (cols // 2) + r if (cols // 2) + r < cols else cols - 1
    
    for i in range(lowerRow, upperRow + 1):
        for j in range(lowerCol, upperCol + 1):
            new_image[i][j] = 0
    
    return new_image


def gaussian_lpf_fn(img, r):
    (rows, cols) = img.shape
    new_image = np.zeros((rows, cols), dtype=complex)
    center = findCenter(img)

    lowerRow = (rows // 2) - r if (rows // 2) - r > 0 else 0
    upperRow = (rows // 2) + r if (rows // 2) + r < rows else rows - 1

    lowerCol = (cols // 2) - r if (cols // 2) - r > 0 else 0
    upperCol = (cols // 2) + r if (cols // 2) + r < cols else cols - 1

    for i in range(lowerRow, upperRow + 1):
        for j in range(lowerCol, upperCol + 1):
            exponent = -2*(math.pi**2) * ((i - center[0])**2 + (j - center[1])**2) * 9 # stddev is assumed to be 3
            #print(exponent, math.exp(exponent))
            new_image[i][j] = img[i][j] * math.exp(exponent)
    return new_image

def gaussian_hpf_fn(img, r):
    (rows, cols) = img.shape
    new_image = np.copy(img)

    center = findCenter(img)

    lowerRow = (rows // 2) - r if (rows // 2) - r > 0 else 0
    upperRow = (rows // 2) + r if (rows // 2) + r < rows else rows - 1

    lowerCol = (cols // 2) - r if (cols // 2) - r > 0 else 0
    upperCol = (cols // 2) + r if (cols // 2) + r < cols else cols - 1

    for i in range(lowerRow, upperRow + 1):
        for j in range(lowerCol, upperCol + 1):
            exponent = -2*(math.pi**2) * ((i - center[0])**2 + (j - center[1])**2) * 1 # stddev is assumed to be 10
            new_image[i][j] = img[i][j] * (1 - math.exp(exponent))

    return new_image

def butterworth_lpf_fn(img, r):
    (rows, cols) = img.shape
    new_image = np.zeros((rows, cols), dtype=complex)

    center = findCenter(img)

    lowerRow = (rows // 2) - r if (rows // 2) - r > 0 else 0
    upperRow = (rows // 2) + r if (rows // 2) + r < rows else rows - 1

    lowerCol = (cols // 2) - r if (cols // 2) - r > 0 else 0
    upperCol = (cols // 2) + r if (cols // 2) + r < cols else cols - 1

    for i in range(lowerRow, upperRow + 1):
        for j in range(lowerCol, upperCol + 1):
            new_image[i][j] = img[i][j] *  1 / ((math.sqrt(((i-center[0])**2 + (j-center[1])**2)**4) / r) + 1)
    
    return new_image

def butterworth_hpf_fn(img, r):
    (rows, cols) = img.shape
    new_image = np.copy(img)

    center = findCenter(img)

    lowerRow = (rows // 2) - r if (rows // 2) - r > 0 else 0
    upperRow = (rows // 2) + r if (rows // 2) + r < rows else rows - 1

    lowerCol = (cols // 2) - r if (cols // 2) - r > 0 else 0
    upperCol = (cols // 2) + r if (cols // 2) + r < cols else cols - 1

    for i in range(lowerRow, upperRow + 1):
        for j in range(lowerCol, upperCol + 1):
            new_image[i][j] = img[i][j] *  (1 - 1 / ((math.sqrt(((i-center[0])**2 + (j-center[1])**2)**4) / r) + 1))
    
    return new_image

def lpf(img, r, method):
    methods = {"ideal": ideal_lpf_fn, "gaussian": gaussian_lpf_fn, "butterworth": butterworth_lpf_fn}
    lpf_fn = methods[method]
    img_fourier = fourier_transform(img)

    (R, G, B) = split_image(img_fourier)
    R = lpf_fn(R, r)
    G = lpf_fn(G, r)
    B = lpf_fn(B, r)
    R = inverse_fourier_transform_fn(R)
    G = inverse_fourier_transform_fn(G)
    B = inverse_fourier_transform_fn(B)

    return merge_image(R, G, B).real

def hpf(img, r, method):
    methods = {"ideal": ideal_hpf_fn, "gaussian": gaussian_hpf_fn, "butterworth": butterworth_hpf_fn}
    hpf_fn = methods[method]
    img_fourier = fourier_transform(img)

    (R, G, B) = split_image(img_fourier)
    R = hpf_fn(R, r)
    G = hpf_fn(G, r)
    B = hpf_fn(B, r)
    R = inverse_fourier_transform_fn(R)
    G = inverse_fourier_transform_fn(G)
    B = inverse_fourier_transform_fn(B)
    return merge_image(R, G, B).real

def band_pass_fn(img, r1, r2):
    (rows, cols) = img.shape
    new_image = np.zeros((rows, cols), dtype=complex)

    center = findCenter(img)

    for i in range(0, rows):
        for j in range(0, cols):
            if (insideBand((i, j), center, min(r1, r2), max(r1, r2))):
                new_image[i][j] = img[i][j]
    
    return new_image

def band_reject_fn(img, r1, r2):
    (rows, cols) = img.shape
    new_image = np.copy(img)

    center = findCenter(img)

    for i in range(0, rows):
        for j in range(0, cols):
            if (insideBand((i, j), center, min(r1, r2), max(r1, r2))):
                new_image[i][j] = 0
    
    return new_image

def band_reject(img, r1, r2):
    img_fourier = fourier_transform(img)

    (R, G, B) = split_image(img_fourier)
    R = band_reject_fn(R, r1, r2)
    G = band_reject_fn(G, r1, r2)
    B = band_reject_fn(B, r1, r2)
    R = inverse_fourier_transform_fn(R)
    G = inverse_fourier_transform_fn(G)
    B = inverse_fourier_transform_fn(B)
    return merge_image(R, G, B).real



def band_pass(img, r1, r2):
    img_fourier = fourier_transform(img)

    (R, G, B) = split_image(img_fourier)
    R = band_pass_fn(R, r1, r2)
    G = band_pass_fn(G, r1, r2)
    B = band_pass_fn(B, r1, r2)
    R = inverse_fourier_transform_fn(R)
    G = inverse_fourier_transform_fn(G)
    B = inverse_fourier_transform_fn(B)
    return merge_image(R, G, B).real

def powerLaw(img, c, gamma):
    return np.array(255 * (img / 255) ** gamma) * c

def adaptive_histogram_equalization(img):
    clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(8, 8))
    return clahe.apply(img)


def improve_contrast1(img):
    (R, G, B) = split_image(img)
    R =  cv2.equalizeHist(R)
    R = powerLaw(R, c = 1, gamma = 2)
    G = cv2.equalizeHist(G)
    G = powerLaw(G, c = 1, gamma = 2)
    B = cv2.equalizeHist(B)
    B = powerLaw(B, c = 1, gamma = 2)
    return merge_image(R, G, B)

def improve_contrast2(img):
    (R, G, B) = split_image(img)
    R = adaptive_histogram_equalization(R)
    G = adaptive_histogram_equalization(G)
    B = adaptive_histogram_equalization(B)

    return merge_image(R, G, B)


if __name__ == '__main__':
    if not os.path.exists(OUTPUT_PATH):
        os.makedirs(OUTPUT_PATH)

    # Fourier
    img1 = read_image(INPUT_PATH + "1.png")
    img1_fourier = fourier_transform(img1)
    img1_magn = 20*np.log(np.abs(img1_fourier))
    write_image(img1_magn, OUTPUT_PATH + 'F1.png')
    
    img2 = read_image(INPUT_PATH + "2.png")

    img2_fourier = fourier_transform(img2)
    img2_magn = 20*np.log(np.abs(img2_fourier))
    write_image(img2_magn, OUTPUT_PATH + 'F2.png')
    img1_cosine = cosine_transform(img1)
    write_image(img1_cosine, OUTPUT_PATH + "C1.png")

    img2_cosine = cosine_transform(img2)
    write_image(img2_cosine, OUTPUT_PATH + "C2.png")
    img3 = read_image(INPUT_PATH + "3.png")

    """
    img1 = read_image(INPUT_PATH + "1.png")
    img1_hadamard = hadamard_transform(img1)
    write_image(img1_hadamard, OUTPUT_PATH + "H1.png")
    """

    img3_ilp_r1 = lpf(img3, r = 50, method="ideal")
    img3_ilp_r2 = lpf(img3, r = 300, method="ideal")
    img3_ilp_r3 = lpf(img3, r = 950, method="ideal")
    write_image(img3_ilp_r1, OUTPUT_PATH + "ILP_r1.png")
    write_image(img3_ilp_r2, OUTPUT_PATH + "ILP_r2.png")
    write_image(img3_ilp_r3, OUTPUT_PATH + "ILP_r3.png")
    img3 = read_image(INPUT_PATH + "3.png")

    img3_glp_r1 = lpf(img3, r = 50, method="gaussian")
    img3_glp_r2 = lpf(img3, r = 300, method="gaussian")
    img3_glp_r3 = lpf(img3, r = 950, method="gaussian")
    write_image(img3_glp_r1, OUTPUT_PATH + "GLP_r1.png")
    write_image(img3_glp_r2, OUTPUT_PATH + "GLP_r2.png")
    write_image(img3_glp_r3, OUTPUT_PATH + "GLP_r3.png")

    img3_blp_r1 = lpf(img3, r = 50, method="butterworth")
    img3_blp_r2 = lpf(img3, r = 300, method="butterworth")
    img3_blp_r3 = lpf(img3, r = 1000, method="butterworth")
    write_image(img3_blp_r1, OUTPUT_PATH + "BLP_r1.png")
    write_image(img3_blp_r2, OUTPUT_PATH + "BLP_r2.png")
    write_image(img3_blp_r3, OUTPUT_PATH + "BLP_r3.png")

    img3_ihp_r1 = hpf(img3, r = 50, method="ideal")
    img3_ihp_r2 = hpf(img3, r = 300, method="ideal")
    img3_ihp_r3 = hpf(img3, r = 500, method="ideal")
    write_image(img3_ihp_r1, OUTPUT_PATH + "IHP_r1.png")
    write_image(img3_ihp_r2, OUTPUT_PATH + "IHP_r2.png")
    write_image(img3_ihp_r3, OUTPUT_PATH + "IHP_r3.png")

    img3_ghp_r1 = hpf(img3, r = 50, method="gaussian")
    img3_ghp_r2 = hpf(img3, r = 300, method="gaussian")
    img3_ghp_r3 = hpf(img3, r = 500, method="gaussian")
    write_image(img3_ghp_r1, OUTPUT_PATH + "GHP_r1.png")
    write_image(img3_ghp_r2, OUTPUT_PATH + "GHP_r2.png")
    write_image(img3_ghp_r3, OUTPUT_PATH + "GHP_r3.png")
    
    img3_bhp_r1 = hpf(img3, r = 50, method="butterworth")
    img3_bhp_r2 = hpf(img3, r = 300, method="butterworth")
    img3_bhp_r3 = hpf(img3, r = 500, method="butterworth")
    write_image(img3_bhp_r1, OUTPUT_PATH + "BHP_r1.png")
    write_image(img3_bhp_r2, OUTPUT_PATH + "BHP_r2.png")
    write_image(img3_bhp_r3, OUTPUT_PATH + "BHP_r3.png")

    img4 = read_image(INPUT_PATH + "4.png")
    img5 = read_image(INPUT_PATH + "5.png")
    
    img4_bpf = band_pass(img4, 200, 50)
    write_image(img4_bpf, OUTPUT_PATH + "BP1.png")
    img4_brf = band_reject(img4, 200, 50)
    write_image(img4_brf, OUTPUT_PATH + "BR1.png")

    img5_bpf = band_pass(img5, 200, 50)
    write_image(img5_bpf, OUTPUT_PATH + "BP2.png")
    img5_brf = band_reject(img5, 200, 50)
    write_image(img5_brf, OUTPUT_PATH + "BR2.png")

    img6 = read_image(INPUT_PATH + "6.png")
    img6_improved = improve_contrast1(img6)
    write_image(img6_improved, OUTPUT_PATH + "Space6.png")

    img7 = read_image(INPUT_PATH + "7.png")
    img7_improved = improve_contrast2(img7)
    write_image(img7_improved, OUTPUT_PATH + "Space7.png")
    