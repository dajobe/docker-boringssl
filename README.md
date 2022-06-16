Docker build of boringssl image based on debian
===============================================

This repository has the source to create a Docker image of
[boringssl](https://boringssl.googlesource.com/boringssl/)
from a particular GIT SHA (see Dockerfile) into an image suitable as
a build dependency for other docker images.

Intended to help with building HTTP/3 support with
[nghttp2](https://github.com/tatsuhiro-t/nghttp2) and
[ngtcp2](https://github.com/ngtcp2/ngtcp2) both by
[Tatsuhiro Tsujikawa](https://github.com/tatsuhiro-t)
