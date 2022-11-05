import math
import cv2
import numpy as np
import matplotlib.pyplot as plt
import os

debug = False
INPUT_PATH = "/Users/enesizgi/projects/image-the1/THE1-Images/" if debug else "./THE1-Images/"
OUTPUT_PATH = "/Users/enesizgi/projects/image-the1/Outputs/" if debug else "./Outputs/"


def read_image(img_path, rgb=True):
    img = cv2.imread(img_path)
    if not rgb:
        return cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    return img


def write_image(img, output_path, rgb=True):
    img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY) if not rgb else img
    cv2.imwrite(output_path, img)


def extract_save_histogram(img, path):
    # extract the histogram of the image using cv2 library and save as a png file
    # img: input image
    # path: path to save the histogram
    hist, bins = np.histogram(img, 256, [0, 256])
    plt.hist(img.flatten(), 256, [0, 256], color='r')
    plt.xlim([0, 256])
    plt.savefig(path)
    plt.close()


def rotate_image(img, degree=0, interpolation_type="linear"):
    flag = cv2.INTER_LINEAR if interpolation_type == "linear" else cv2.INTER_CUBIC
    (y, x) = img.shape[:2]
    M = cv2.getRotationMatrix2D(center=(x / 2, y / 2), angle=degree, scale=1)
    r = np.deg2rad(degree)
    newX, newY = (abs(np.sin(r) * y) + abs(np.cos(r) * x), abs(np.sin(r) * x) + abs(np.cos(r) * y))

    (tx, ty) = ((newX - x) / 2, (newY - y) / 2)
    M[0, 2] += tx
    M[1, 2] += ty

    rotatedImg = cv2.warpAffine(img, M, dsize=(int(newX), int(newY)), flags=flag)
    return rotatedImg


def histogram_equalization(img):
    img_hist_eq = cv2.equalizeHist(img)
    return img_hist_eq


def adaptive_histogram_equalization(img):
    clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(8, 8))
    return clahe.apply(img)



if __name__ == '__main__':
    if not os.path.exists(OUTPUT_PATH):
        os.makedirs(OUTPUT_PATH)
    # PART1
    img = read_image(INPUT_PATH + "a1.png")
    output = rotate_image(img, 45, "linear")
    write_image(output, OUTPUT_PATH + "a1_45_linear.png")
    #
    img = read_image(INPUT_PATH + "a1.png")
    output = rotate_image(img, 45, "cubic")
    write_image(output, OUTPUT_PATH + "a1_45_cubic.png")

    img = read_image(INPUT_PATH + "a1.png")
    output = rotate_image(img, 90, "linear")
    write_image(output, OUTPUT_PATH + "a1_90_linear.png")

    img = read_image(INPUT_PATH + "a1.png")
    output = rotate_image(img, 90, "cubic")
    write_image(output, OUTPUT_PATH + "a1_90_cubic.png")

    img = read_image(INPUT_PATH + "a2.png")
    output = rotate_image(img, 45, "linear")
    write_image(output, OUTPUT_PATH + "a2_45_linear.png")

    img = read_image(INPUT_PATH + "a2.png")
    output = rotate_image(img, 45, "cubic")
    write_image(output, OUTPUT_PATH + "a2_45_cubic.png")

    # PART2
    img = read_image(INPUT_PATH + "b1.png", rgb=False)
    extract_save_histogram(img, OUTPUT_PATH + "original_histogram.png")
    equalized = histogram_equalization(img)
    extract_save_histogram(equalized, OUTPUT_PATH + "equalized_histogram.png")
    write_image(equalized, OUTPUT_PATH + "enhanced_image.png")

    # BONUS
    # Define the following function
    img = read_image(INPUT_PATH + "b1.png", rgb=False)
    equalized = adaptive_histogram_equalization(img)
    extract_save_histogram(equalized, OUTPUT_PATH + "adaptive_equalized_histogram.png")
    write_image(equalized, OUTPUT_PATH + "adaptive_enhanced_image.png")
