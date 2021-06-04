FROM debian:buster-slim

RUN apt-get update && apt-get install -y \
apt-transport-https \
ca-certificates \
curl

ENV VERSION=0.20.0
RUN mkdir /octant 
RUN cd /octant 
RUN curl -o octant.deb -L https://github.com/vmware-tanzu/octant/releases/download/v${VERSION}/octant_${VERSION}_Linux-64bit.deb
RUN dpkg -i octant.deb

ENV OCTANT_LISTENER_ADDR=0.0.0.0:8080
ENV OCTANT_DISABLE_OPEN_BROWSER=true

VOLUME ["/root/.kube"]
ENTRYPOINT ["octant"]
