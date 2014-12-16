# Pull base image.
FROM ywang1007/onos-buildenv
MAINTAINER kmntree <kmntree@gmail.com>

# Change dash to bash in ubuntu to solve "source: command not found"
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Init ONOS document
sed -i "/^featuresRepositories=/ s/\$/,mvn:org.onosproject\/onos-features\/1.0.0\/xml\/features/" /home/onos/Applications/apache-karaf-3.0.2/etc/org.apache.karaf.features.cfg
sed -i "/^featuresBoot=/ s/\$/,onos-api,onos-core-trivial,onos-cli,onos-openflow,onos-app-fwd,onos-app-mobility,onos-gui/" /home/onos/Applications/apache-karaf-3.0.2/etc/org.apache.karaf.features.cfg

# Set environment
RUN echo "export ONOS_ROOT=/home/onos/onos" >> /etc/profile && \
echo "export KARAF_ROOT=/home/onos/Applications/apache-karaf-3.0.2" >> /etc/profile && \
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/profile && \
echo "export M2_HOME=/home/onos/Applications/apache-maven-3.2.2" >> /etc/profile && \
echo "export PATH=$PATH:/home/onos/Applications/apache-maven-3.2.2/bin:/home/onos/Applications/apache-karaf-3.0.2/bin" >> /etc/profile && \
echo ". /home/onos/onos/tools/dev/bash_profile" >> /etc/profile

# Construct ONOS
RUN . /etc/profile && cd /home/onos/onos && mvn clean install

# Define default command.
CMD . /etc/profile && karaf clean

# Expose ports.
EXPOSE 6633
EXPOSE 8181
