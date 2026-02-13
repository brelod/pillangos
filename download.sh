#!/bin/bash

source "$(dirname $0)/config.sh"

urls=(
    https://mirrors.edge.kernel.org/pub/linux/kernel/v6.x/linux-$CONF_VERSION_LINUX.tar.xz
    https://mirrors.edge.kernel.org/pub/linux/kernel/v6.x/linux-$CONF_VERSION_LINUX.tar.sign

    #https://cdn.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.0/e2fsprogs-1.47.0.tar.gz
    #https://cdn.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.0/e2fsprogs-1.47.0.tar.sign
    #https://mirrors.edge.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.gz
    #https://mirrors.edge.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.sign
    #https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.1.tar.gz
    #https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.1.tar.sign
    #https://www.netfilter.org/pub/libmnl/libmnl-1.0.5.tar.bz2
    #https://www.netfilter.org/pub/libmnl/libmnl-1.0.5.tar.bz2.sig
    #https://www.netfilter.org/pub/libnftnl/libnftnl-1.2.6.tar.xz
    #https://www.netfilter.org/pub/libnftnl/libnftnl-1.2.6.tar.xz.sig
    #https://www.netfilter.org/pub/nftables/nftables-1.0.9.tar.xz
    #https://www.netfilter.org/pub/nftables/nftables-1.0.9.tar.xz.sig
)


echo "================================================================================"
echo "Download sources"
echo "================================================================================"
#mkdir -p "$CONF_CACHE_SOURCE_DIR"

for url in "${urls[@]}"; do
    wget \
        --continue \
        --no-clobber \
        --directory-prefix="cache/source/" \
        $url
done
