# Muhammed Enes Izgi - 2310142
# Emre Berk Kaya - 2380590

from ctypes.wintypes import RGB
import cv2
import numpy as np
import os
import math
import scipy.fftpack as fp
from scipy.linalg import hadamard
import random as rng


INPUT_PATH = "./THE3_Images/"
OUTPUT_PATH = "./Outputs/"


def read_image(img_path):
    img = cv2.imread(img_path)
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    return img


def fwht_fn(a) -> None:
    '''In-place Fast Walsh–Hadamard Transform of array a.'''
    h = 1
    while h < len(a):
        # perform FWHT
        for i in range(0, len(a), h * 2):
            for j in range(i, i + h):
                x = a[j]
                y = a[j + h]
                a[j] = x + y
                a[j + h] = x - y
        # normalize and increment
        a /= 2
        h *= 2


def write_image(img, output_path):
    img = np.float32(img)
    cv2.imwrite(output_path, cv2.cvtColor(img, cv2.COLOR_RGB2BGR))


def write_grayscale_image(img, output_path):
    img = np.float32(img)
    cv2.imwrite(output_path, img)


def split_image(img):
    R = img[:, :, 0]
    G = img[:, :, 1]
    B = img[:, :, 2]
    return (R, G, B)


def merge_image(R, G, B):
    row, col = len(R), len(R[0])
    new_img = np.zeros((row, col, 3), dtype=complex)
    new_img[:, :, 0] = R
    new_img[:, :, 1] = G
    new_img[:, :, 2] = B
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
    newDimension = 2 ** ceil
    new_image = np.zeros((newDimension, newDimension))  # new image is 2^n x 2^n
    for i in range(rows):
        for j in range(cols):
            new_image[i][j] = img[i][j]
    # newShape = new_image.shape
    # flatImage = new_image.flatten()
    # fwht_fn(new_image)
    # hadamard = fwht(flatImage)
    # hadamard = np.array(new_image)
    had_matrix = hadamard(newDimension)
    newImage = had_matrix * new_image * had_matrix
    return newImage[0:rows, 0:cols]


def hadamard_transform(img):
    # img = fourier_transform(img)
    (R, G, B) = cv2.split(img)
    R = hadamard_fn(fourier_transform_fn(R))
    G = hadamard_fn(fourier_transform_fn(G))
    B = hadamard_fn(fourier_transform_fn(B))
    return cv2.merge([R, G, B])


def cosine_fn(img):
    return fp.dct(fp.dct(img.T, norm='ortho').T, norm='ortho')


def cosine_transform(img):
    # (R, G, B) = cv2.split(img)
    (R, G, B) = split_image(img)
    R = cosine_fn(R.astype(float))
    G = cosine_fn(G.astype(float))
    B = cosine_fn(B.astype(float))
    return merge_image(R, G, B)


def insideCircle(point, center, r):
    return math.sqrt((point[0] - center[0]) ** 2 + (point[1] - center[1]) ** 2) <= r


def insideBand(point, center, r1, r2):
    dist = math.sqrt((point[0] - center[0]) ** 2 + (point[1] - center[1]) ** 2)
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
            exponent = -2 * (math.pi ** 2) * (
                        (i - center[0]) ** 2 + (j - center[1]) ** 2) * 4  # stddev is assumed to be 3
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
            exponent = -2 * (math.pi ** 2) * (
                        (i - center[0]) ** 2 + (j - center[1]) ** 2) * 1  # stddev is assumed to be 10
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
            new_image[i][j] = img[i][j] * 1 / ((math.sqrt(((i - center[0]) ** 2 + (j - center[1]) ** 2) ** 4) / r) + 1)

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
            new_image[i][j] = img[i][j] * (
                        1 - 1 / ((math.sqrt(((i - center[0]) ** 2 + (j - center[1]) ** 2) ** 4) / r) + 1))

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
    R = cv2.equalizeHist(R)
    R = powerLaw(R, c=1, gamma=2)
    G = cv2.equalizeHist(G)
    G = powerLaw(G, c=1, gamma=2)
    B = cv2.equalizeHist(B)
    B = powerLaw(B, c=1, gamma=2)
    return merge_image(R, G, B)


def improve_contrast2(img):
    (R, G, B) = split_image(img)
    R = adaptive_histogram_equalization(R)
    G = adaptive_histogram_equalization(G)
    B = adaptive_histogram_equalization(B)

    return merge_image(R, G, B)


def detect_faces(image, lower_yellow, upper_yellow, number_of_faces, erod_iterations, dial_iterations):
    original_image = image.copy()
    original_image = cv2.cvtColor(original_image, cv2.COLOR_BGR2RGB)

    image = cv2.GaussianBlur(image, (3, 3), 0)
    hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

    # Create a mask. Threshold the HSV image to get only yellow colors
    mask = cv2.inRange(hsv, lower_yellow, upper_yellow)

    # The resulting mask will contain white pixels for the edges and black pixels for the background
    # You can then apply this mask to the input image to remove the background
    image = cv2.bitwise_and(image, image, mask=mask)
    write_image(image, "yellow_mask.jpg")

    kernel = np.ones((5, 5), np.uint8)
    dilation = cv2.dilate(image, kernel, iterations=dial_iterations)
    write_image(dilation, "dilation.jpg")
    erosion = cv2.erode(dilation, kernel, iterations=erod_iterations)
    write_image(erosion, "erosion.jpg")

    imgray = cv2.cvtColor(erosion, cv2.COLOR_BGR2GRAY)
    ret, thresh = cv2.threshold(imgray, 127, 255, 0)
    contours, hierarchy = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    cv2.drawContours(erosion, contours, -1, (0, 255, 0), 3)

    img2 = erosion
    shape = img2.shape
    img2 = img2.reshape((-1, 3))
    img2 = np.float32(img2)
    criteria = (cv2.TERM_CRITERIA_EPS, 10, 1.0)
    # Set flags (Just to avoid line break in the code)
    flags = cv2.KMEANS_RANDOM_CENTERS

    compactness,labels,centers = cv2.kmeans(img2, 2, None, criteria, 10, flags)
    centers = np.uint8(centers)
    labels = labels.flatten()
    segmented_image = centers[labels.flatten()]
    segmented_image = segmented_image.reshape(shape)
    # print(OUTPUT_PATH + 'test.png')
    imgray = cv2.cvtColor(segmented_image, cv2.COLOR_BGR2GRAY)
    ret, thresh = cv2.threshold(imgray, 127, 255, 0)
    contours, hierarchy = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    # sort contours and take the biggest five
    contours = sorted(contours, key=cv2.contourArea, reverse=True)[:number_of_faces]
    for contour in contours:
        x, y, w, h = cv2.boundingRect(contour)
        cv2.rectangle(original_image, (x, y), (x + w, y + h), (255, 0, 0), original_image.shape[0] // 200)
    return original_image

def colorizeImage(source_img, img):
    source_img_gray = cv2.cvtColor(source_img, cv2.COLOR_BGR2GRAY)
    img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    colored = np.zeros((img_gray.shape[0], img_gray.shape[1], 3))
    colorMap = {}

    sourceImgShape = source_img.shape
    imgShape = img_gray.shape
    for x in range(0, sourceImgShape[0]):
        for y in range(0, sourceImgShape[1]):
            colorMap[source_img_gray[x][y]] = source_img[x][y]
    
    for x in range(0, imgShape[0]):
        for y in range(0, imgShape[1]):
            if (img_gray[x][y] in colorMap.keys()):
                colored[x][y] = colorMap[img_gray[x][y]]
            else:
                colored[x][y] = [0, 0, 0]


    return np.float32(colored)

def calculateIntensity(image):
    shape = image.shape
    intensity = np.zeros((shape[0], shape[1]))
    for x in range(0, shape[0]):
        for y in range(0, shape[1]):
            i = (image[x][y][0] + image[x][y][1] + image[x][y][2]) / 3
            intensity[x][y] = i
    return intensity

def detect_edges(src, hsv = False):
    ddepth = -1
    kernel_size = 3
    src = cv2.GaussianBlur(src, (3, 3), 0)
    src_gray = src[:,:,2] if hsv else cv2.cvtColor(src, cv2.COLOR_RGB2GRAY)
    dst = cv2.Laplacian(src_gray, ddepth, ksize=kernel_size)
    return dst

if __name__ == '__main__':
    if not os.path.exists(OUTPUT_PATH):
        os.makedirs(OUTPUT_PATH)

    image = cv2.imread(INPUT_PATH + "1_source.png")
    lower_yellow = np.array([0, 90, 255])
    upper_yellow = np.array([19, 157, 255])
    image = detect_faces(image, lower_yellow, upper_yellow, number_of_faces=3, erod_iterations=3, dial_iterations=6)
    write_image(image, OUTPUT_PATH + '1_faces.png')

    image2 = cv2.imread(INPUT_PATH + "2_source.png")
    # define range of skin color in HSV
    lower_yellow = np.array([0, 70, 190])
    upper_yellow = np.array([13, 100, 230])
    image2 = detect_faces(image2, lower_yellow, upper_yellow, number_of_faces=5, erod_iterations=7, dial_iterations=7)
    write_image(image2, OUTPUT_PATH + '2_faces.png')

    image3 = cv2.imread(INPUT_PATH + "3_source.png")
    # define range of skin color in HSV
    lower_yellow = np.array([0, 70, 150])
    upper_yellow = np.array([30, 100, 230])
    image3 = detect_faces(image3, lower_yellow, upper_yellow, number_of_faces=1, erod_iterations=1, dial_iterations=1)
    write_image(image3, OUTPUT_PATH + '3_faces.png')

    source_img1 = cv2.imread(INPUT_PATH + '1_source.png')
    img1 = cv2.imread(INPUT_PATH + '1.png')
    colored1 = colorizeImage(source_img1, img1)
    colored1_R = colored1[:,:,2]
    colored1_G = colored1[:,:,1]
    colored1_B = colored1[:,:,0]
    colored1_HSV = cv2.cvtColor(colored1, cv2.COLOR_BGR2HSV)
    colored1_edge_HSI = detect_edges(colored1_HSV, True)
    colored1_edge_RGB = detect_edges(cv2.cvtColor(colored1, cv2.COLOR_BGR2RGB))
    colored1_H = colored1_HSV[:,:,0]
    colored1_S = colored1_HSV[:,:,1]
    colored1_I = calculateIntensity(colored1)
    cv2.imwrite(OUTPUT_PATH + '1_H.png', colored1_H)
    cv2.imwrite(OUTPUT_PATH + '1_S.png', colored1_S)
    cv2.imwrite(OUTPUT_PATH + '1_I.png', colored1_I)
    cv2.imwrite(OUTPUT_PATH + '1_R.png', colored1_R)
    cv2.imwrite(OUTPUT_PATH + '1_G.png', colored1_G)
    cv2.imwrite(OUTPUT_PATH + '1_B.png', colored1_B)
    cv2.imwrite(OUTPUT_PATH + '1_colored.png', colored1)
    cv2.imwrite(OUTPUT_PATH + '1_colored_edges_HSI.png', colored1_edge_HSI)
    cv2.imwrite(OUTPUT_PATH + '1_colored_edges_RGB.png', colored1_edge_RGB)

    source_img2 = cv2.imread(INPUT_PATH + '2_source.png')
    img2 = cv2.imread(INPUT_PATH + '2.png')
    colored2 = colorizeImage(source_img2, img2)
    colored2_R = colored2[:,:,2]
    colored2_G = colored2[:,:,1]
    colored2_B = colored2[:,:,0]
    colored2_HSV = cv2.cvtColor(colored2, cv2.COLOR_BGR2HSV)
    colored2_edge_HSI = detect_edges(colored2_HSV, True)
    colored2_edge_RGB = detect_edges(cv2.cvtColor(colored2, cv2.COLOR_BGR2RGB))
    colored2_H = colored2_HSV[:,:,0]
    colored2_S = colored2_HSV[:,:,1]
    colored2_I = calculateIntensity(colored2)
    cv2.imwrite(OUTPUT_PATH + '2_H.png', colored2_H)
    cv2.imwrite(OUTPUT_PATH + '2_S.png', colored2_S)
    cv2.imwrite(OUTPUT_PATH + '2_I.png', colored2_I)
    cv2.imwrite(OUTPUT_PATH + '2_R.png', colored2_R)
    cv2.imwrite(OUTPUT_PATH + '2_G.png', colored2_G)
    cv2.imwrite(OUTPUT_PATH + '2_B.png', colored2_B)
    cv2.imwrite(OUTPUT_PATH + '2_colored.png', colored2)
    cv2.imwrite(OUTPUT_PATH + '2_colored_edges_HSI.png', colored2_edge_HSI)
    cv2.imwrite(OUTPUT_PATH + '2_colored_edges_RGB.png', colored2_edge_RGB)

    source_img3 = cv2.imread(INPUT_PATH + '3_source.png')
    img3 = cv2.imread(INPUT_PATH + '3.png')
    colored3 = colorizeImage(source_img3, img3)
    colored3_R = colored3[:,:,2]
    colored3_G = colored3[:,:,1]
    colored3_B = colored3[:,:,0]
    colored3_HSV = cv2.cvtColor(colored3, cv2.COLOR_BGR2HSV)
    colored3_edge_HSI = detect_edges(colored3_HSV, True)
    colored3_edge_RGB = detect_edges(cv2.cvtColor(colored3, cv2.COLOR_BGR2RGB))
    colored3_H = colored3_HSV[:,:,0]
    colored3_S = colored3_HSV[:,:,1]
    colored3_I = calculateIntensity(colored3)
    cv2.imwrite(OUTPUT_PATH + '3_H.png', colored3_H)
    cv2.imwrite(OUTPUT_PATH + '3_S.png', colored3_S)
    cv2.imwrite(OUTPUT_PATH + '3_I.png', colored3_I)
    cv2.imwrite(OUTPUT_PATH + '3_R.png', colored3_R)
    cv2.imwrite(OUTPUT_PATH + '3_G.png', colored3_G)
    cv2.imwrite(OUTPUT_PATH + '3_B.png', colored3_B)
    cv2.imwrite(OUTPUT_PATH + '3_colored.png', colored3)
    cv2.imwrite(OUTPUT_PATH + '3_colored_edges_HSI.png', colored3_edge_HSI)
    cv2.imwrite(OUTPUT_PATH + '3_colored_edges_RGB.png', colored3_edge_RGB)

    source_img4 = cv2.imread(INPUT_PATH + '4_source.png')
    img4 = cv2.imread(INPUT_PATH + '4.png')
    colored4 = colorizeImage(source_img4, img4)
    colored4_R = colored4[:,:,2]
    colored4_G = colored4[:,:,1]
    colored4_B = colored4[:,:,0]
    colored4_HSV = cv2.cvtColor(colored4, cv2.COLOR_BGR2HSV)
    colored4_edge_HSI = detect_edges(colored4_HSV, True)
    colored4_edge_RGB = detect_edges(cv2.cvtColor(colored4, cv2.COLOR_BGR2RGB))
    colored4_H = colored4_HSV[:,:,0]
    colored4_S = colored4_HSV[:,:,1]
    colored4_I = calculateIntensity(colored4)
    cv2.imwrite(OUTPUT_PATH + '4_H.png', colored4_H)
    cv2.imwrite(OUTPUT_PATH + '4_S.png', colored4_S)
    cv2.imwrite(OUTPUT_PATH + '4_I.png', colored4_I)
    cv2.imwrite(OUTPUT_PATH + '4_R.png', colored4_R)
    cv2.imwrite(OUTPUT_PATH + '4_G.png', colored4_G)
    cv2.imwrite(OUTPUT_PATH + '4_B.png', colored4_B)
    cv2.imwrite(OUTPUT_PATH + '4_colored.png', colored4)
    cv2.imwrite(OUTPUT_PATH + '4_colored_edges_HSI.png', colored4_edge_HSI)
    cv2.imwrite(OUTPUT_PATH + '4_colored_edges_RGB.png', colored4_edge_RGB)

