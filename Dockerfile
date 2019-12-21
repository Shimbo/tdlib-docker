FROM alpine:3.10 as builder

RUN apk add --no-cache \
  alpine-sdk \
  linux-headers \
  gperf \
  openssl-dev \
  git \
  cmake \
  zlib-dev \
  php7 \
  php7-ctype

RUN git clone https://github.com/tdlib/td.git /td
RUN mkdir -p /td/build
WORKDIR /td/build/
RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN cmake --build . --target prepare_cross_compiling
RUN (cd .. && php SplitSource.php)
RUN cmake --build . && make install && ls -l /usr/local/lib

RUN ls -la /usr/local/include

FROM alpine:3.10
# Use this two copy from tdlib.alpine in your container
COPY --from=builder /usr/local/lib /usr/local/lib
COPY --from=builder /usr/local/include /usr/local/include
