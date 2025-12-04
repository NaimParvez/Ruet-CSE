import cv2
import numpy as np

def _get_channel_labels(color_space, img):
    """Return appropriate channel labels based on selected color space."""
    color_space = color_space.upper()
    if len(img.shape) == 2 or color_space == 'GRAY':
        return ['Gray']

    if color_space == 'BGR':
        return ['B', 'G', 'R']
    elif color_space == 'RGB':
        return ['R', 'G', 'B']
    elif color_space == 'HSV':
        return ['H', 'S', 'V']
    elif color_space == 'LAB':
        return ['L', 'A', 'B']
    elif color_space == 'YCRCB':
        return ['Y', 'Cr', 'Cb']
    elif color_space == 'XYZ':
        return ['X', 'Y', 'Z']
    elif color_space == 'HLS':
        return ['H', 'L', 'S']
    elif color_space == 'RGBA':
        return ['R', 'G', 'B', 'A']
    else:
        return [f'C{i}' for i in range(img.shape[2])]

def _mouse_callback(event, x, y, flags, param):
    img, window_name, color_space = param['img'], param['window_name'], param['color_space']
    if event == cv2.EVENT_MOUSEMOVE:
        if y < img.shape[0] and x < img.shape[1]:
            img_copy = img.copy()
            pixel_value = img[y, x]

            if isinstance(pixel_value, (np.uint8, np.int32, np.float32, np.float64)):
                text = f'X: {x}, Y: {y}, Gray: {pixel_value}'
            else:
                labels = _get_channel_labels(color_space, img)
                values = [f'{lbl}: {val}' for lbl, val in zip(labels, pixel_value)]
                text = f'X: {x}, Y: {y}, ' + ', '.join(values)

            # Shadow
            cv2.putText(img_copy, text, (10, 20), cv2.FONT_HERSHEY_SIMPLEX,
                        0.4, (0, 0, 0), 2)
            # Foreground
            cv2.putText(img_copy, text, (10, 20), cv2.FONT_HERSHEY_SIMPLEX,
                        0.4, (255, 255, 255), 1)

            cv2.imshow(window_name, img_copy)

def imshow(window_name, img, color_space=None):
    """
    Enhanced imshow that displays pixel (x, y) and labeled channel values.
    
    Parameters:
        window_name (str): Name of the display window.
        img (np.ndarray): Image to be shown.
        color_space (str, optional): Color space name (e.g., 'BGR', 'HSV'). Not case sensitive.
    """
    if color_space is None:
        color_space = 'GRAY' if len(img.shape) == 2 else 'BGR'

    color_space = color_space.upper()

    cv2.namedWindow(window_name)
    cv2.setMouseCallback(window_name, _mouse_callback, {
        'img': img,
        'window_name': window_name,
        'color_space': color_space
    })
    cv2.imshow(window_name, img)
    
    
    
