# README

The goal of these scripts is to build the vt100 binary from
https://github.com/larsbrinkhoff/terminal-simulator/tree/master

This will not cross-compile to ARM, so you will need to execute all steps on the Raspberry Pi.

There is a 3 stage docker build

1. Recreates the Raspberry Pi OS (based on Debian bookworm) adding in SDL2 (core and image runtimes) in a docker image.

build-rpios-sdl2.sh (uses rpios-sdl2.dockerfile)

2. Using the previously built image, add in development support files and tools for C/C++.

build-rpios-sdl2-dev.sh (uses rpios-sdl2-dev.dockerfile)

3. Using the RPi OS development image, add in the terminal-simulator source and compile terminal-simulator/vt100.

build-vt100.sh <dest-dir> (uses build-vt100.dockerfile)

This shell script will extract three files needed for the VT100 runtime (from the docker image to the host filesystem):
<dest-dir>/vt100
<dest-dir>/common/crt.shader
<dest-dir>/common/vertex.shader

To run on the host (not inside the docker container), you may need to install the SDL2 runtime:

sudo apt install -y libsdl2-2.0-0 libsdl2-image-2.0-0 [...maybe more?]

cd <dest-dir>
./vt100 -h

Question: If NOT running a GUI desktop (just terminal), does the vt100 still work in fullscreen mode (-f) since it uses OpenGL?


