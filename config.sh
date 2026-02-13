# ==============================================================================
# Directories
# ==============================================================================
set -o ignoreeof
export CONF_GIT_DIR="/git"

export CONF_CACHE_DIR="/git/cache"
export CONF_CACHE_LOG_DIR="$CONF_CACHE_DIR/log"
export CONF_CACHE_SRC_DIR="$CONF_CACHE_DIR/src"
export CONF_CACHE_SHA_DIR="$CONF_CACHE_DIR/sha"

export CONF_CACHE_ISO_DIR="$CONF_CACHE_DIR/iso"
export CONF_CACHE_STAGE_1_DIR="$CONF_CACHE_DIR/stage-1"
export CONF_CACHE_SOURCE_DIR="$CONF_CACHE_DIR/source"
export CONF_CACHE_TARGET_DIR="$CONF_CACHE_DIR/target"
export CONF_CACHE_MOUNT_DIR="$CONF_CACHE_DIR/mount"

export CONF_SOURCE_ISO_DIR="$CONF_GIT_DIR/src/iso"
export CONF_SOURCE_PATCH_DIR="$CONF_GIT_DIR/src/patch"
export CONF_SOURCE_SYSTEM_DIR="$CONF_GIT_DIR/src/system"
export CONF_SOURCE_CONFIG_DIR="$CONF_GIT_DIR/src/config"

export CONF_SHARE_DIR="$CONF_GIT_DIR/share"


# ==============================================================================
# Docker
# ==============================================================================
export CONF_DOCKER_IMAGE_STAGE_0_NAME=pillangos-stage-0
export CONF_DOCKER_IMAGE_STAGE_0_VERSION=latest
export CONF_DOCKER_IMAGE_STAGE_1_NAME=pillangos-stage-1
export CONF_DOCKER_IMAGE_STAGE_1_VERSION=latest
export CONF_DOCKER_IMAGE_STAGE_2_NAME=pillangos-stage-2
export CONF_DOCKER_IMAGE_STAGE_2_VERSION=latest
export CONF_DOCKER_IMAGE_STAGE_3_NAME=pillangos-stage-3
export CONF_DOCKER_IMAGE_STAGE_3_VERSION=latest
export CONF_DOCKER_IMAGE_REPO=my-repository
export CONF_DOCKER_IMAGE_HOST=my-artifactory.my-domain.com

export CONF_DOCKER_IMAGE_TAG_STAGE_0="$CONF_DOCKER_IMAGE_REPO.$CONF_DOCKER_IMAGE_HOST/$CONF_DOCKER_IMAGE_STAGE_0_NAME:$CONF_DOCKER_IMAGE_STAGE_0_VERSION"
export CONF_DOCKER_IMAGE_TAG_STAGE_1="$CONF_DOCKER_IMAGE_REPO.$CONF_DOCKER_IMAGE_HOST/$CONF_DOCKER_IMAGE_STAGE_1_NAME:$CONF_DOCKER_IMAGE_STAGE_1_VERSION"
export CONF_DOCKER_IMAGE_TAG_STAGE_2="$CONF_DOCKER_IMAGE_REPO.$CONF_DOCKER_IMAGE_HOST/$CONF_DOCKER_IMAGE_STAGE_2_NAME:$CONF_DOCKER_IMAGE_STAGE_2_VERSION"

# Toolchain
export CONF_VERSION_BINUTILS="2.42"
export CONF_VERSION_GCC="14.1.0"
export CONF_VERSION_GMP="6.3.0"
export CONF_VERSION_MPC="1.3.1"
export CONF_VERSION_MPFR="4.2.1"
export CONF_VERSION_LINUX="6.9"
export CONF_VERSION_MUSL="1.2.5"

# Tools
export CONF_VERSION_M4="1.4.19"
export CONF_VERSION_NCURSES="6.5"
export CONF_VERSION_BASH="5.2"
export CONF_VERSION_BUSYBOX="1.36.1"
export CONF_VERSION_MAKE="4.4.1"
export CONF_VERSION_BISON="3.8"
export CONF_VERSION_TEXINFO="7.1"
export CONF_VERSION_WGET="1.24.5"
export CONF_VERSION_OPENSSL="3.3.0"
export CONF_VERSION_PERL="5.38.2"
export CONF_VERSION_PKGCONF="1.1.0"
export CONF_VERSION_ZLIB="1.3.1"
export CONF_VERSION_BC="6.7.5"
export CONF_VERSION_FLEX="2.6.4"
export CONF_VERSION_ELFUTILS="0.191"
export CONF_VERSION_ARGP="1.5.0"
export CONF_VERSION_AUTOMAKE="1.16"
export CONF_VERSION_AUTOCONF="2.72"
export CONF_VERSION_MUSL_FTS="1.2.7"
export CONF_VERSION_LIBTOOL="2.4"
export CONF_VERSION_MUSL_OBSTACK="1.2.3"
export CONF_VERSION_=""



export MAKEFLAGS=-j15
export CONF_COMPILATION_TARGET=x86_64-lfs-linux-musl
export CONF_COMPILATION_BUILD=x86_64-pc-linux-musl

