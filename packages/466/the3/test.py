import cv2
import numpy as np
import matplotlib as plt

image1=cv2.imread('/Users/emreberkkaya/Desktop/ceng/466/466-the3/THE3_Images/2_source.png')
gray_image=cv2.cvtColor(image1, cv2.COLOR_BGR2GRAY)

output=image1.copy()
circles = cv2.HoughCircles(gray_image, cv2.HOUGH_GRADIENT, 1.3, 100, param1=80, param2=140, minRadius=30, maxRadius=100)
if circles is not None:
     circles = np.round(circles[0, :]).astype("int")
     for (x, y, r) in circles:
    
         cv2.circle(output, (x, y), r, (0, 255, 0), 2)
         print(x,y,r)
plt.imshow(output)