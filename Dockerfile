FROM debian:bullseye

MAINTAINER Dave Beckett <dave@dajobe.org>

COPY *.sh /build/

# https://github.com/nghttp2/nghttp2/
# for http/3 needs
#   "BoringSSL (commit 36a41bf0bf2dd3176f8780e09c03585351f29963)"
# Sun Jan 16 13:26:49 2022 -0500
#
# https://github.com/ngtcp2/ngtcp2
# for http/3 needs
#   "BoringSSL (commit 27ffcc6e19bbafddf1b59ec0bc6df2904de7eb2c)"
# Fri Apr 1 05:34:52 2022 -0700
#
# So pick newest

ENV BORINGSSL_SHA 27ffcc6e19bbafddf1b59ec0bc6df2904de7eb2c

RUN /build/prepare.sh && \
    /build/build.sh && \
    /build/cleanup.sh && \
    rm -rf /build
