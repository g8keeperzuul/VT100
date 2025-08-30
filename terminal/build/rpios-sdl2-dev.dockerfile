# Build as "g8keeperzuul/rpios-sdl2-dev:bookworm"
# docker build --file rpios-sdl2-dev.dockerfile --tag g8keeperzuul/rpios-sdl2-dev:bookworm .

FROM g8keeperzuul/rpios-sdl2:bookworm

# ----------------------------------------------------------------------------------
# Add development tools

RUN apt install -y libudev-dev libasound2-dev libdbus-1-dev 
RUN apt install -y gcc make autoconf automake libtool 
RUN apt install -y cmake pkg-config libbrotli-dev 
RUN apt install -y clang 
RUN apt install -y libxext-dev 
RUN apt install -y git

# Raspberry Pi OS
RUN apt install -y libraspberrypi-dev

#export CC=clang CXX=clang++ 
ENV CC=clang CXX=clang++

# ----------------------------------------------------------------------------------
# Add SDL (core and image) v2 development support files
# Complete set is included (except for documentation)

# Simple DirectMedia Layer development files
RUN apt install -y libsdl2-dev

# drawing and graphical effects extension for SDL2
RUN apt install -y libsdl2-gfx-dev

# Image loading library for Simple DirectMedia Layer 2, development files
RUN apt install -y libsdl2-image-dev

# Mixer library for Simple DirectMedia Layer 2, development files
RUN apt install -y libsdl2-mixer-dev

# Network library for Simple DirectMedia Layer 2, development files
RUN apt install -y libsdl2-net-dev

# TrueType Font library for Simple DirectMedia Layer 2, development files
RUN apt install -y libsdl2-ttf-dev


# ----------------------------------------------------------------------------------
# SDL v2 branch build from source
#WORKDIR /VT100
#RUN git clone https://github.com/libsdl-org/SDL.git -b SDL2 
##ADD --keep-git-dir=false https://github.com/libsdl-org/SDL.git#SDL2 SDL
#WORKDIR SDL
#RUN ./configure 
#RUN make 
#RUN make install

# ----------------------------------------------------------------------------------
# SDL Image v2 branch build from source
#WORKDIR /VT100
#RUN git clone https://github.com/libsdl-org/SDL_image.git -b SDL2 
##ADD --keep-git-dir=false https://github.com/libsdl-org/SDL_image.git#SDL2 SDL2_image
#WORKDIR SDL_image/build 
#RUN ../configure 
#RUN make  
#RUN make install

CMD ["echo","Raspberry Pi OS with SDL v2 Development"]

