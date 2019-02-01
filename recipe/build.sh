#!/usr/bin/env bash

export CPPFLAGS="-I${PREFIX}/include -I${BUILD_PREFIX}/${HOST}/sysroot/usr/include ${CPPFLAGS}"
export CXXFLAGS="-I${PREFIX}/include -I${BUILD_PREFIX}/${HOST}/sysroot/usr/include ${CXXFLAGS}"
export LDFLAGS="-L${PREFIX}/lib -Wl,-rpath,${PREFIX}/lib ${LDFLAGS}"

chmod +x configure
chmod +x build-aux/mk-opts.pl

./configure --help
./configure --prefix=$PREFIX \
    --disable-docs \
    --enable-readline \
    --enable-shared \
    --with-lapack="-lopenblas" \
    --enable-dl \
    --without-qrupdate \
    --with-qt=5 \
    --with-magick=GraphicsMagick \
    --without-opengl \
    --without-framework-opengl \
    --without-framework-carbon \
    --with-hdf5-includedir=${PREFIX}/include \
    --with-hdf5-libdir=${PREFIX}/lib

make -j${CPU_COUNT}
make install

