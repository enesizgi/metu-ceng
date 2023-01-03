import cv2 as cv
import numpy as np
import os

INPUT_PATH = "./THE4_Images/"
OUTPUT_PATH = "./Outputs/"


def main():
    if not os.path.exists(OUTPUT_PATH):
        os.makedirs(OUTPUT_PATH)

    image = cv.imread(INPUT_PATH + "A3.png")
    # cv.imwrite(OUTPUT_PATH + 'A1.png', image)

    # Convert the image to grayscale
    gray = cv.cvtColor(image, cv.COLOR_BGR2GRAY)

    # Apply Otsu's thresholding to create a binary image
    ret, thresh = cv.threshold(gray, 0, 255, cv.THRESH_BINARY_INV + cv.THRESH_OTSU)

    # Use morphological transformations to remove small holes and noise from the image
    kernel = np.ones((5, 5), np.uint8)
    opening = cv.morphologyEx(thresh, cv.MORPH_OPEN, kernel, iterations=2)

    # Create a mask to separate the flowers from the background
    # mask = cv.dilate(opening, kernel, iterations=1)
    mask = cv.dilate(opening, kernel, iterations=45)
    mask = cv.erode(mask, kernel, iterations=45)

    # Use the mask to separate the flowers from the background in the input image
    # result = cv.bitwise_and(image, image, mask=mask)
    # result_gray = cv.cvtColor(result, cv.COLOR_BGR2GRAY)
    # ret, thresh = cv.threshold(result, 0, 10, 0)
    cv.imwrite('result2.png', mask)
    labeled_image = np.zeros(mask.shape)
    x = cv.connectedComponentsWithAlgorithm(mask, connectivity=4, ccltype=cv.CCL_WU, ltype=cv.CV_32S)
    # result = cv.bitwise_not(result)

    # cv.imwrite('result3_result.jpg', result)
    # contours, hierarchy = cv.findContours(result_gray, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE)
    # contours = sorted(contours, key=cv.contourArea, reverse=True)
    # for contour in contours:
    #     (x, y), radius = cv.minEnclosingCircle(contour)
    #     center = (int(x), int(y))
    #     radius = int(radius)
    #     cv.circle(image, center, radius, (0, 255, 0), 2)
        # x, y, w, h = cv.boundingRect(contour)
        # cv.rectangle(image, (x, y), (x + w, y + h), (255, 0, 0), image.shape[0] // 200)
    # Save the result
    cv.imwrite('result3.jpg', image)


if __name__ == '__main__':
    main()
