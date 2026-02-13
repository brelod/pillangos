#!/bin/bash
set -e
set -u
set -o pipefail

source "$(dirname $0)/../config.sh"
exec &> >(tee "$CONF_CACHE_LOG_DIR/stage-2")


cd "$CONF_GIT_DIR/repository"
echo "================================================================================"
echo "Build packages"
echo "================================================================================"
./install.sh  perl          main
./install.sh  openssl       main
./install.sh  pkgconf       main
./install.sh  wget          main
./install.sh  musl          main
./install.sh  autoconf      main
./install.sh  automake      main
./install.sh  libtool       main
./install.sh  file          main
./install.sh  bison         main
./install.sh  flex          main
./install.sh  bc            main
./install.sh  gmp           main
./install.sh  mpfr          main
./install.sh  mpc           main
./install.sh  zlib          main
./install.sh  gcc           main
./install.sh  musl-fts      main
./install.sh  musl-obstack  main
./install.sh  m4            main
./install.sh  ncurses       main
./install.sh  bash          main
./install.sh  make          main
./install.sh  busybox       main
./install.sh  binutils      main
./install.sh  argp          main
./install.sh  elfutils      main
./install.sh  cert          main
./install.sh  rust          main

echo "================================================================================"
echo "Cleanup"
echo "================================================================================"
rm -rf /usr/share/{info,man,doc}/*

#paths="
#/usr/bin/bash
#/usr/bin/strip
#/usr/lib/libc.so
#/usr/lib/libbfd-2.42.so
#/usr/lib/libsframe.so.1.0.0
#/usr/lib/libncursesw.so.6.5
#"
#
#for path in $paths; do
#    dir="$(dirname $path)"
#    name="$(basename $path)"
#
#    cp -vf "$path" "/tmp/$name"
#    strip --strip-unneeded "/tmp/$name"
#    install -vm755 "/tmp/$name" "$dir"
#    rm "/tmp/$name"
#done
#
#for path in $(find /usr/lib -type f -name \*.so*) \
#        $(find /usr/lib -type f -name \*.a) \
#        $(find /usr/{bin,sbin,libexec} -type f); do
#    case "$paths" in
#        *$(basename $path)* ) ;;
#        * ) strip --strip-all "$path" || echo "'$path' can not be stripped";;
#    esac
#done

echo "================================================================================"
echo "Create archive"
echo "================================================================================"
cd /
tar czvf "$CONF_CACHE_DIR/stage-2.tar.gz" \
    --exclude ./git \
    --exclude ./sys \
    --exclude ./dev \
    --exclude ./run \
    --exclude ./proc \
    .
