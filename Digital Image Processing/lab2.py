import cv2

img_path='cat2.jpg'

img=cv2.imread(img_path)
img = cv2.resize(img,(500,500))

img_gray=cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)

cv2.imshow('original',img)
row,col=img.shape[0],img.shape[1]
for i in range(row):
    for j in range(col):
        img[i][j] = 256-1-img[i][j]

cv2.imshow('Gray',img_gray)
cv2.imshow('negative',img)


cv2.waitKey(0)
cv2.destroyAllWindows()


