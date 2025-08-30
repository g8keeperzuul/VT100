#!/bin/bash

# Usage:
#  <this-file> "~/vt100"
#  where dest_dir is where to copy the binary to

dest_dir=$1
mkdir -p "$dest_dir/common"

image_name="g8keeperzuul/vt100:latest"
docker build --file vt100.dockerfile --tag $image_name .

echo "Extract binary and shaders from image..."

# After the program is built, extract it from the image:
container_id=`docker create $image_name`
docker cp "$container_id:/VT100/terminal-simulator/vt100/vt100" "$dest_dir"

# The binary requires 2 shader files located ../common/ relative to itself
docker cp "$container_id:/VT100/terminal-simulator/common/crt.shader" "$dest_dir/common"
docker cp "$container_id:/VT100/terminal-simulator/common/vertex.shader" "$dest_dir/common"

docker rm "$container_id"

echo "VT100 binary located here: $1"
