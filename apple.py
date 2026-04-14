from PIL import Image
FRAME_COUNT = 6572
WIDTH = 48
HEIGHT = 36

out = open("apple.dat", "wb")
for frame in range(1, 6572+1):
    print(frame)
    img = Image.open(f"apples/{frame}.png")
    pixels = img.load()
    assert img.width == WIDTH
    assert img.height == HEIGHT
    for y in range(HEIGHT):
        for x in range(WIDTH):
            (r, g, b) = pixels[x, y]
            if r > 128:
                out.write(b"\x01")
            else:
                out.write(b"\x00")
