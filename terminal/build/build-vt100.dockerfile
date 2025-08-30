# Build as "g8keeperzuul/vt100:latest"
# docker build --file vt100.dockerfile --tag g8keeperzuul/vt100:latest .
# see test results
# docker run --name vt100 g8keeperzuul/vt100:latest

# After the program is built, extract it from the image:
#container_id=$(docker create "g8keeperzuul/vt100:latest")
#docker cp "$container_id:/VT100/terminal-simulator/vt100" "/tmp"

# The binary requires 2 shader files located ../common/ relative to itself
#docker cp "$container_id:/VT100/terminal-simulator/common/*.shader" "/tmp"

#docker rm "$container_id"

# Program still requires SDL2 runtime
# sudo apt install -y libsdl2-2.0-0 libsdl2-image-2.0-0 [...maybe more?]

FROM g8keeperzuul/rpios-sdl2-dev:bookworm


# ----------------------------------------------------------------------------------
# VT100 terminal simulator build from source
WORKDIR /VT100
RUN git clone https://github.com/larsbrinkhoff/terminal-simulator.git -b master
#ADD --keep-git-dir=false https://github.com/larsbrinkhoff/terminal-simulator.git#master terminal-simulator
WORKDIR terminal-simulator/vt100
RUN make

WORKDIR /VT100/terminal-simulator
RUN chmod +x test/test.sh
CMD test/test.sh

