# Use the Ubuntu base image
FROM ubuntu:20.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install OpenJDK 8 and other necessary tools
RUN apt-get update && apt-get install -y openjdk-8-jdk wget curl vim

# Define environment variables for Java and Tomcat
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV CATALINA_HOME=/opt/tomcat
ENV PATH=$PATH:$CATALINA_HOME/bin

# Install Tomcat
RUN mkdir -p $CATALINA_HOME && \
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.56/bin/apache-tomcat-9.0.56.tar.gz && \
    tar -xvzf apache-tomcat-9.0.56.tar.gz -C $CATALINA_HOME --strip-components=1 && \
    rm apache-tomcat-9.0.56.tar.gz

# Remove default web apps
RUN rm -rf $CATALINA_HOME/webapps/*

# Copy the locally built WAR file to Tomcat webapps directory
COPY ./target/EzLearn.war $CATALINA_HOME/webapps/ROOT.war

# Copy custom tomcat-users.xml to enable basic authentication
COPY ./config/tomcat-users.xml $CATALINA_HOME/conf/tomcat-users.xml

# Expose port 8080 for access
EXPOSE 8081

# Start Tomcat
CMD ["catalina.sh", "run"]
