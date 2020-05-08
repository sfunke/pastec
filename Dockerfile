FROM jonstonchan/opencv4:18.04-4.1.0

RUN apt update \
  && apt upgrade -y --force-yes \
  && apt install -y curl build-essential g++ libcurl4-openssl-dev libmicrohttpd-dev libjsoncpp-dev cmake git \
  && git clone --single-branch --branch opencv4_compatibility https://github.com/sfunke/pastec.git \
  && mkdir -p /pastec/data \
  && mkdir -p /pastec/build \
  && cd /pastec/build \
  && cmake ../ && make

WORKDIR /pastec/build

EXPOSE 4212
VOLUME /pastec/data

CMD ./pastec -p 4212 /pastec/visualWordsORB.dat