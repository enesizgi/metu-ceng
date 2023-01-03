import cv2 as cv
import numpy as np
import os

INPUT_PATH = "./THE4_Images/"
OUTPUT_PATH = "./Outputs/"


def count_flowers(image, threshold, erode_iterations=1, dilate_iterations=1):
    image = cv.GaussianBlur(image, (5, 5), 0)

    gray = cv.cvtColor(image, cv.COLOR_BGR2GRAY)

    ret, thresh = cv.threshold(gray, threshold, 255, cv.THRESH_BINARY_INV)

    kernel = np.ones((5, 5), np.uint8)
    opening = cv.morphologyEx(thresh, cv.MORPH_OPEN, kernel, iterations=2)

    mask = cv.erode(opening, kernel, iterations=erode_iterations)
    mask = cv.dilate(mask, kernel, iterations=dilate_iterations)

    mask_white = cv.bitwise_not(mask)

    contours, hierarchy = cv.findContours(mask_white, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE)
    contours = sorted(contours, key=cv.contourArea, reverse=True)
    avg_area = 0
    for contour in contours:
        area = cv.contourArea(contour)
        avg_area += area
    avg_area /= len(contours)
    filtered_contours = []
    for contour in contours:
        area = cv.contourArea(contour)
        if area > avg_area * 0.4:
            filtered_contours.append(contour)
    print(len(filtered_contours))

    return mask_white


def main():
    if not os.path.exists(OUTPUT_PATH):
        os.makedirs(OUTPUT_PATH)

    a1 = cv.imread(INPUT_PATH + "A1.png")
    a1 = count_flowers(a1, erode_iterations=2, dilate_iterations=2, threshold=80)
    cv.imwrite(OUTPUT_PATH + "A1.png", a1)

    a2 = cv.imread(INPUT_PATH + "A2.png")
    a2 = count_flowers(a2, erode_iterations=25, dilate_iterations=25, threshold=110)
    cv.imwrite(OUTPUT_PATH + "A2.png", a2)

    a3 = cv.imread(INPUT_PATH + "A3.png")
    a3 = count_flowers(a3, erode_iterations=10, dilate_iterations=10, threshold=130)
    cv.imwrite(OUTPUT_PATH + "A3.png", a3)


if __name__ == '__main__':
    main()
