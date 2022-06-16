FROM debian:bullseye

MAINTAINER Dave Beckett <dave@dajobe.org>

COPY *.sh /build/

ENV BORINGSSL_SHA 36a41bf0bf2dd3176f8780e09c03585351f29963

RUN /build/prepare.sh && \
    /build/build.sh && \
    /build/cleanup.sh && \
    rm -rf /build
