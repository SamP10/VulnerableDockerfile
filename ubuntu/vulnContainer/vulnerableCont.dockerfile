FROM ubuntu:latest
RUN apt-get update && apt-get upgrade -y
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get install -y curl