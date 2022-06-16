# This file intended to be sourced

# . /build/config.sh

# Prevent initramfs updates from trying to run grub and lilo.
export INITRD=no
export DEBIAN_FRONTEND=noninteractive

minimal_apt_get_args='-y --no-install-recommends'


# File containing original installed packages
PACKAGES_INSTALLED_LOG="/tmp/packages.lst"


## Build time dependencies ##

# git and ca-certificates is needed for git clone
BORINGSSL_BUILD_PACKAGES="git ca-certificates"

# Core list from docs
# - cmake and dependencies (make)
# - (perl is in debian base)
# - g++ for C++ source
# - golang for Go source
BORINGSSL_BUILD_PACKAGES="$BORINGSSL_BUILD_PACKAGES make cmake g++ golang"


# Optional:

# pkgconfig ( unwind tests)
BORINGSSL_BUILD_PACKAGES="$BORINGSSL_BUILD_PACKAGES"


## Run time dependencies ##
BORINGSSL_RUN_PACKAGES=""

# apt-get remove --allow-remove-essential enters an infinite loop of
# pam errors with this package
#  login: because it depends on libpam*
PACKAGES_REMOVE_SKIP_REGEX='(libpam|login)'

cmake_build_dir="build"
