#
# OpenJDK Java 7 JRE Dockerfile
#
# https://github.com/dockerfile/java
# https://github.com/dockerfile/java/tree/master/openjdk-7-jre
#

# Pull base image.
FROM eu.gcr.io/publicismedia-cortex-216901/test-base-image

# Install Java.
RUN apt-get update 

