# Build as "g8keeperzuul/rpios-sdl2:bookworm"
# docker build --file rpios-sdl2.dockerfile --tag g8keeperzuul/rpios-sdl2:bookworm .

FROM debian:12.10
#FROM --platform linux/arm64 debian:12.10

# ----------------------------------------------------------------------------------
# Add the Raspberry Pi OS repo and public key

RUN apt update
RUN apt install -y gpg

RUN gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 82B129927FA3303E
RUN gpg --export 82B129927FA3303E | tee /etc/apt/trusted.gpg.d/raspi.gpg
RUN echo "deb http://archive.raspberrypi.com/debian/ bookworm main" > /etc/apt/sources.list.d/raspi.list

RUN apt update
RUN apt upgrade -y

# ----------------------------------------------------------------------------------
# Add Raspberry Pi OS specific support

RUN apt install -y libraspberrypi0 libraspberrypi-bin  


# ----------------------------------------------------------------------------------
# Add SDL2 core and image runtime

# Simple DirectMedia Layer
RUN apt install -y libsdl2-2.0-0

# drawing and graphical effects extension for SDL2
RUN apt install -y libsdl2-gfx-1.0-0

# Image loading library for Simple DirectMedia Layer 2, libraries
RUN apt install -y libsdl2-image-2.0-0

# Mixer library for Simple DirectMedia Layer 2, libraries
RUN apt install -y libsdl2-mixer-2.0-0

# Network library for Simple DirectMedia Layer 2, libraries
RUN apt install -y libsdl2-net-2.0-0

# TrueType Font library for Simple DirectMedia Layer 2, libraries
RUN apt install -y libsdl2-ttf-2.0-0

CMD ["echo","Raspberry Pi OS with SDL v2"]

