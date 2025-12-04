# import sys
# import os
# sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from pixel import imshow
import cv2
import matplotlib.pyplot as plt


img=cv2.imread('rgb.png')

img = cv2.resize(img,(500,500))
img2 = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)



imshow('frame',img)
# imshow('frame2', img2)
cv2.waitKey(0)
cv2.destroyAllWindows()
    