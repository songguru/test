FROM ubuntu:22.04
 
ARG DEBIAN_FRONTEND=noninteractive
 
ENV TZ=Asia/Seoul

RUN sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
 
RUN apt-get update \
  && apt-get install -y procps \
  && apt-get install -qq -y init systemd \
  && apt-get install -qq -y build-essential \
  && apt-get install -qq -y tzdata \
  && apt-get install -qq -y vim curl \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf /var/lib/{apt,dpkg,cache,log}
 
CMD ["/sbin/init"]
