import cv2 as cv
import numpy as np
import os
from sklearn.cluster import MeanShift
from sklearn.cluster import estimate_bandwidth
from skimage import segmentation, color
from skimage.future import graph
from matplotlib import pyplot as plt
import networkx as nx

INPUT_PATH = "./THE4_Images/"
OUTPUT_PATH = "./Outputs/"

ncut_parameters = [
    {'compactness': 30, 'n_segments': 700, 'max_num_iter': 100},
    {'compactness': 20, 'n_segments': 600, 'max_num_iter': 150},
    {'compactness': 10, 'n_segments': 500, 'max_num_iter': 200},
]

meanShift_parameters = [
    {'quantile': 0.35, 'n_samples': 300, 'max_iter': 200},
    {'quantile': 0.3, 'n_samples': 200, 'max_iter': 100},
    {'quantile': 0.2, 'n_samples': 100, 'max_iter': 300},
]


def count_flowers(image, image_name, threshold, erode_iterations=1, dilate_iterations=1):
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
    print("The number of flowers in image {} is {}".format(image_name, str(len(filtered_contours))))

    return mask_white


def meanShift(image, parameterSet):
    shape = image.shape
    flatImage = np.reshape(image, [-1, 3])
    bandwidth = estimate_bandwidth(flatImage, quantile=parameterSet['quantile'], n_samples=parameterSet['n_samples'])
    clustering = MeanShift(bandwidth=bandwidth, bin_seeding=True, max_iter=parameterSet['max_iter']).fit(flatImage)
    labels = clustering.labels_
    centers = clustering.cluster_centers_
    segmentedImg = centers[np.reshape(labels, shape[:2])]
    return segmentedImg.astype(np.uint8)


def ncut(image, parameterSet):
    labels1 = segmentation.slic(
        image,
        compactness=parameterSet['compactness'],
        n_segments=parameterSet['n_segments'],
        start_label=1,
        max_num_iter=parameterSet['max_num_iter']
    )
    g = graph.rag_mean_color(image, labels1, mode='similarity')
    labels2 = graph.cut_normalized(labels1, g)
    out2 = color.label2rgb(labels2, image, kind='avg', bg_label=0)
    return out2


def display(g, title):
    pos = nx.circular_layout(g)
    plt.figure()
    plt.title(title)
    nx.draw(g, pos)
    nx.draw_networkx_labels(g, pos)
    nx.draw_networkx_edge_labels(g, pos, font_size=20)
    plt.savefig('rag.png', dpi=300)
    plt.clf()


def regionAdjacency(hierarchy):
    g = graph.rag.RAG()
    for x in range(0, len(hierarchy)):
        if hierarchy[x][0] != -1:
            g.add_edge(x, hierarchy[x][0])
        if hierarchy[x][1] != -1:
            g.add_edge(x, hierarchy[x][1])
    display(g, "RAG")


def createTree(hierarchy):
    g = nx.Graph()
    g.add_node("Root")
    for x in range(0, len(hierarchy)):
        g.add_node(x)
    for x in range(0, len(hierarchy)):
        if hierarchy[x][3] != -1:  # If has a parent
            g.add_edge(hierarchy[x][3], x)
        else:  # First level
            g.add_edge("Root", x)
    nx.draw(g, with_labels=True)
    plt.savefig('tree.png', dpi=300)
    plt.clf()


def segmentationFn(image, parameterSet, segmentationMethod):
    shape = image.shape

    blurredImage = cv.blur(image, (3, 3))
    # Segmented Image
    segmentedImg = segmentationMethod(blurredImage, parameterSet)

    segmentedBlurred = cv.blur(segmentedImg, (2, 2))
    edges = cv.Canny(segmentedBlurred, 200, 250)

    blur = cv.GaussianBlur(edges, (3, 3), sigmaX=10, sigmaY=10)
    divide = cv.divide(edges, blur, scale=255)

    # otsu threshold
    thresh = cv.threshold(divide, 0, 255, cv.THRESH_BINARY + cv.THRESH_OTSU)[1]

    # apply morphology
    kernel = cv.getStructuringElement(cv.MORPH_RECT, (3, 3))
    morph = cv.morphologyEx(thresh, cv.MORPH_CLOSE, kernel)

    contours, hierarchy = cv.findContours(morph, cv.RETR_TREE, cv.CHAIN_APPROX_SIMPLE)  # [next, prev, child, parent]
    contours2, hierarchy2 = cv.findContours(morph, cv.RETR_LIST, cv.CHAIN_APPROX_SIMPLE)

    createTree(hierarchy[0])
    regionAdjacency(hierarchy2[0])

    # Boundary overlay
    boundaryOverlay = np.zeros(shape)
    for i in range(0, shape[0]):
        for j in range(0, shape[1]):
            if edges[i][j] == 255:
                boundaryOverlay[i, j, 0] = 0
                boundaryOverlay[i, j, 1] = 255
                boundaryOverlay[i, j, 2] = 0
            else:
                boundaryOverlay[i, j, :] = image[i, j, :]

    tree = cv.imread('tree.png')
    rag = cv.imread('rag.png')

    tree = cv.resize(tree, (shape[1], shape[0]), interpolation=cv.INTER_AREA)
    rag = cv.resize(rag, (shape[1], shape[0]), interpolation=cv.INTER_AREA)

    images = (image, segmentedImg, boundaryOverlay, tree, rag)
    return np.concatenate(images, axis=1)


def makeSegmentation():
    images = ['B1', 'B2', 'B3', 'B4']
    for x in images:
        image = cv.imread(INPUT_PATH + x + '.jpg')
        result = segmentationFn(image, meanShift_parameters[0], meanShift)
        cv.imwrite(OUTPUT_PATH + '{}_algorithm_meanshift_parameterset_1.png'.format(x), result)
        result = segmentationFn(image, meanShift_parameters[1], meanShift)
        cv.imwrite(OUTPUT_PATH + '{}_algorithm_meanshift_parameterset_2.png'.format(x), result)
        result = segmentationFn(image, meanShift_parameters[2], meanShift)
        cv.imwrite(OUTPUT_PATH + '{}_algorithm_meanshift_parameterset_3.png'.format(x), result)
        result = segmentationFn(image, ncut_parameters[0], ncut)
        cv.imwrite(OUTPUT_PATH + '{}_algorithm_ncut_parameterset_1.png'.format(x), result)
        result = segmentationFn(image, ncut_parameters[1], ncut)
        cv.imwrite(OUTPUT_PATH + '{}_algorithm_ncut_parameterset_2.png'.format(x), result)
        result = segmentationFn(image, ncut_parameters[2], ncut)
        cv.imwrite(OUTPUT_PATH + '{}_algorithm_ncut_parameterset_3.png'.format(x), result)


def main():
    if not os.path.exists(OUTPUT_PATH):
        os.makedirs(OUTPUT_PATH)

    a1 = cv.imread(INPUT_PATH + "A1.png")
    a1 = count_flowers(a1, image_name="A1", erode_iterations=2, dilate_iterations=2, threshold=80)
    cv.imwrite(OUTPUT_PATH + "A1.png", a1)

    a2 = cv.imread(INPUT_PATH + "A2.png")
    a2 = count_flowers(a2, image_name="A2", erode_iterations=25, dilate_iterations=25, threshold=110)
    cv.imwrite(OUTPUT_PATH + "A2.png", a2)

    a3 = cv.imread(INPUT_PATH + "A3.png")
    a3 = count_flowers(a3, image_name="A3",erode_iterations=10, dilate_iterations=10, threshold=130)
    cv.imwrite(OUTPUT_PATH + "A3.png", a3)

    makeSegmentation()


if __name__ == '__main__':
    main()
