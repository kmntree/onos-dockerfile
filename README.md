onos-dockerfile
===============

Dockerfile for [ONOS - a new carrier-grade SDN network operating system](http://onosproject.org/)


### Base Docker Image

* [ywang1007/onos-buildenv](http://registry.hub.docker.com/u/ywang1007/onos-buildenv/)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Clone thisrepository from github: `git clone https://github.com/kmntree/onos-dockerfile.git`

3. Build an image from Dockerfile: `docker build -t="kmntree/onos" onos-dockerfile/`


### Usage

#### Run `ONOS`

    docker run -d -p 6633:6633 -p 8181:8181 --name onos kmntree/onos


#### WebUI URL of ONOS

    http://<ip-address>:8181/onos/ui/index.html


### Reference

* [ONOS from Scratch](https://wiki.onosproject.org/display/ONOS/ONOS+from+Scratch)

* [Docker容器部署ONOS控制器教程](http://www.sdnlab.com/4963)


### If you need to use proxy in your environment

* [Configuring a proxy in Maven](http://maven.apache.org/guides/mini/guide-proxies.html)

* [How to setup a proxy for Apache Karaf](http://stackoverflow.com/questions/9922467/how-to-setup-a-proxy-for-apache-karaf)
