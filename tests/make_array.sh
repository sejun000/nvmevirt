#!/bin/bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
ssd_count=4
ssd_index=0

cd "$SCRIPT_DIR"
for i in $(seq 0 $((ssd_count-1))); do
    cd ..
    cp Kbuild Kbuild.bak
    sed -i "s/nvmev/nvmev$i/g" Kbuild
    echo "ccflags-y += -DSSD_INDEX=$i" >> Kbuild
    make -C /mnt/modules M=$(pwd) modules -j
    cp Kbuild.bak Kbuild
    cd -
done
