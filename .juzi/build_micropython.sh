#!/bin/bash
#
pushd ..
make -C mpy-cross/
git submodule update --init -- lib/pico-sdk
cp ./.juzi/wiznet_w5500_evb_pico2.h ./lib/pico-sdk/src/boards/include/boards
git submodule update --init -- lib/tinyusb
git submodule update --init -- lib/micropython-lib
git submodule update --init -- lib/wiznet5k
cd ./ports/rp2
make BOARD=W5500_EVB_PICO2 submodules
make BOARD=W5500_EVB_PICO2
./build-W5500_EVB_PICO2/_deps/picotool/picotool info -a ./build-W5500_EVB_PICO2/firmware.uf2
popd
