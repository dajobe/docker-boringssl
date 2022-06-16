#!/bin/bash -x

. /build/config.sh

apt-get update -y

dpkg --get-selections | awk '{print $1}' | sort > "$PACKAGES_INSTALLED_LOG"
echo "Installed packages at start"
cat "$PACKAGES_INSTALLED_LOG"

apt-get install $minimal_apt_get_args $BORINGSSL_BUILD_PACKAGES


cd /build || exit

#git clone https://boringssl.googlesource.com/boringssl
git clone https://github.com/google/boringssl.git

cd boringssl || exit

git checkout --detach "${BORINGSSL_SHA}"

cmake "-DCMAKE_BUILD_TYPE=release" \
      "-DBUILD_SHARED_LIBS=1" \
      -S . \
      -B "${cmake_build_dir}"
      
