#!/usr/bin/env bash

PKGS=(sdk openlibm libcxx fast_float
      bzip2 zlib xz zstd
      openssl
      libpsl curl asio)

sudo pacman --noconfirm --remove ps4-payload-dev

for PKG in ${PKGS[*]} ; do
    pushd $PKG || exit 1
    rm -f *.pkg.tar.gz
    rm -rf src pkg
    makepkg -c -f || exit 1
    sudo pacman --noconfirm -U ./ps4-payload-*.pkg.tar.gz || exit 1
    popd
done
