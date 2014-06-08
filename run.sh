#!/bin/sh
set -e
cd $HOME

info 'Installing libtiff4-dev'
sudo add-apt-repository ppa:lyrasis/precise-backports -y
sudo apt-get update -y
sudo apt-get install libtiff4-dev -y
success 'Installed libtiff4-dev'

info 'Installing build tools'
sudo apt-get install automake build-essential git gobject-introspection gtk-doc-tools libfftw3-dev libglib2.0-dev libjpeg-turbo8-dev libpng12-dev libwebp-dev libexif-dev libxml2-dev swig -y
success 'Installed build tools'

info 'Cloning libvips'
git clone https://github.com/jcupitt/libvips.git
cd libvips
git checkout 7.38
success 'Cloned libvips'

info 'Installing libvips'
./bootstrap.sh
./configure --enable-debug=no --enable-cxx=no --without-python --without-orc
make -j8
sudo make install
sudo ldconfig
success 'Installed libvips'