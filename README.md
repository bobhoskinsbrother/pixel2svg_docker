Pixel2SVG Docker
================

This is a utility docker image that you can use in order to generate a pixelated svg from a small image file.  
Useful if you want to scale pixel art up.

This also avoids you having to install lots of crap on your host system to do the conversion

pixel2svg is from http://florian-berger.de/en/software/pixel2svg/

Usage:
```bash
./ctl.sh build && ./ctl.sh run wave.png
```

This then produces wav.svg in the same folder where the png file is