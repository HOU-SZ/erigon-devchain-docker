FROM golang:1.19.5-bullseye

RUN apt update -y
RUN apt install curl wget unzip -y

RUN git clone --recurse-submodules -j8 https://github.com/ledgerwatch/erigon.git \
    && cd erigon \
    && go build ./cmd/erigon && go build ./cmd/rpcdaemon \
    && mkdir /erigon \
    && chmod +x erigon && chmod +x rpcdaemon \
    && mv erigon /erigon && mv rpcdaemon /erigon

WORKDIR /erigon