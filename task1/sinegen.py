#!/usr/bin/python3

import math

with open("sinerom.mem", "w") as outfile:
    for i in range(256):
        val = int(math.cos(2 * math.pi * i / 256) * 127.5 + 127.5)
        
        str = f"{val:2X}"
        if (i + 1) % 16 == 0:
            str += "\n"
        else:
            str += " "

        outfile.write(str)
