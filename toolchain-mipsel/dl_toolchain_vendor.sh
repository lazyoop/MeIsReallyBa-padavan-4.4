#!/bin/sh

DIR="toolchain-4.4.x"

# DL_URL="https://github.com/hanwckf/padavan-toolchain/releases/download/linux-4.4-v1.0"
#gcc: 7.4.0
#uclibc-ng: 1.0.32
#build with crosstool-ng-1.24.0
#This release has SO_REUSEPORT backport patch

dl() {
	[ -z "$1" ] && return
	echo "Download toolchain v1.0 from location: $1"
	mkdir -p $DIR && \
	tar -xf "${1}" -C $DIR
}

if [ -d $DIR ]; then
	echo "$DIR exists!"
	exit
fi

ARCH="$(uname -m)"

case $ARCH in
	aarch64)
		dl "dl/aarch64_mipsel-linux-uclibc.tar.xz"
		;;
	x86_64)
		dl "dl/mipsel-linux-uclibc.tar.xz"
		;;
	*)
		echo "Unknown ARCH: $ARCH"
		exit 1
esac
