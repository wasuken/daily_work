import os
from PIL import Image, ImageFilter


if __name__ == '__main__':
    im = Image.open('./test.png')
    output_dir = "./output"
    if not os.path.isdir(output_dir):
        os.mkdir(output_dir)
    for i in range(1, 5):
        side = 64 * i
        img_resize = im.resize((side, side))
        output_file = f"{output_dir}/test_{side}.png"
        img_resize.save(output_file)
