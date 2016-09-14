FROM ubuntu:14.04
MAINTAINER Jon Lancelle <bassoman@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN apt-mark hold initscripts udev plymouth mountall
RUN dpkg-divert --local --rename --add /sbin/initctl && ln -sf /bin/true /sbin/initctl

RUN sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y --force-yes && apt-get dist-upgrade -y --force-yes \
    && apt-get install -y --force-yes --no-install-recommends supervisor \
        openssh-server sudo \
        net-tools \
        lxde-core lxde-icon-theme x11vnc xvfb screen openbox \
        nodejs wget \
        firefox \
	htop bmon nano \
	lxterminal \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*
    
RUN wget --no-cookies --no-check-certificate https://download.jetbrains.com/idea/ideaIC-2016.2.4.tar.gz \
    -O /opt/ideaIC-2016.2.4.tar.gz \
    && cd /opt \
    && tar -xzvf ideaIC-2016.2.4.tar.gz

RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        "http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jdk-8u77-linux-x64.tar.gz" \
        -O /opt/jdk-8-77-linux-x64.tar.gz \
        && cd /opt \
        && tar -xzvf jdk-8-77-linux-x64.tar.gz \
        && wget download.netbeans.org/netbeans/8.1/final/bundles/netbeans-8.1-linux.sh \
        && chmod +x netbeans-8.1-linux.sh

ENV JAVA_HOME /opt/jdk1.8.0_77
ENV PATH $JAVA_HOME/bin:$PATH


RUN chmod -R +r /opt/idea-IC-162.2032.8

COPY IDEA /usr/bin
COPY IDEA.desktop /usr/share/applications

RUN chmod 755 /usr/bin/IDEA


ADD startup.sh /
ADD supervisord.conf /
EXPOSE 5800
EXPOSE 5900
EXPOSE 22
WORKDIR /
ENTRYPOINT ["/startup.sh"]
