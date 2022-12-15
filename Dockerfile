# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

FROM ubuntu:18.04

RUN apt-get update -y
RUN apt-get install -y build-essential
RUN apt-get install -y libssl-dev
RUN apt-get install -y wget
RUN wget https://github.com/krisbock/live555rtsp/raw/main/live555-latest.tar.gz
RUN tar -xzf live555-latest.tar.gz

WORKDIR /live
RUN  ./genMakefiles linux
RUN make 

WORKDIR /live/mediaServer

ADD ./HSMSlabIDTestVideo.mkv /live/mediaServer/media/

EXPOSE 554

ENTRYPOINT [ "./live555MediaServer" ]
