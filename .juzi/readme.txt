Development environment
-----------------------
MobaXterm
Host: PI4-SMARTHOME ([JUZI])
Dir: /home/juzi/micropython

Development environment installieren
------------------------------------
sudo apt-get install cmake
sudo apt-get install build-essential libffi-dev git pkg-config
sudo apt-get install gcc-arm-none-eabi libnewlib-arm-none-eabi


Build micropython
git clone https://github.com/JuergenZimmer/micropython-W5500-EVB-Pico2.git
cd micropython-W5500-EVB-Pico2
make -C mpy-cross/
git submodule update --init -- lib/pico-sdk
cp ./.juzi/wiznet_w5500_evb_pico2.h /home/juzi/micropython-W5500-EVB-Pico2/lib/pico-sdk/src/boards/include/boards
git submodule update --init -- lib/tinyusb
git submodule update --init -- lib/micropython-lib
git submodule update --init -- lib/wiznet5k
cd ./ports/rp2
make BOARD=W5500_EVB_PICO2 submodules
make BOARD=W5500_EVB_PICO2

./build-W5500_EVB_PICO2/_deps/picotool/picotool info -a ./build-W5500_EVB_PICO2/firmware.uf2
