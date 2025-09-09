#!/bin/bash

# Install Java
yum install java-17-amazon-corretto -y

# Download and extract Tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.109/bin/apache-tomcat-9.0.109.tar.gz
tar -xzf apache-tomcat-9.0.109.tar.gz

# Add user and roles
echo '<role rolename="manager-gui"/>' >> apache-tomcat-9.0.109/conf/tomcat-users.xml
echo '<role rolename="manager-script"/>' >> apache-tomcat-9.0.109/conf/tomcat-users.xml
echo '<user username="tomcat" password="admin@123" roles="manager-gui,manager-script"/>' >> apache-tomcat-9.0.109/conf/tomcat-users.xml

# Remove access restrictions
sed -i '/<Valve/d' apache-tomcat-9.0.109/webapps/manager/META-INF/context.xml

# Start Tomcat
sh apache-tomcat-9.0.109/bin/startup.sh
