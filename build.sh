#!/bin/bash -x

lib_dir=$(awk '/^\/usr\/lib/ { print; exit 0 }' /etc/ld.so.conf.d/*)
include_dir="/usr/include"

. /build/config.sh

# build
cd /build/boringssl

for lib in ssl crypto; do
  cmake --build "${cmake_build_dir}" --target "${lib}"
done

# install
cd /build/boringssl

# libs
for lib in ssl crypto; do
  # remove any OpenSSL shlibs (debian package libssl1.1)
  rm -v -f ${lib_dir}/lib${lib}*
  cp -v -p ${cmake_build_dir}/${lib}/lib${lib}.* ${lib_dir}/
done

ldconfig

# includes
for subdir in openssl; do
  mkdir -p "${include_dir}/${subdir}"
  cp -p include/${subdir}/*.h "${include_dir}/${subdir}/"
done
