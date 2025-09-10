#!/bin/bash

# Step 1: Install Java 17 (Amazon Corretto)
yum install java-17-amazon-corretto -y

# Step 2: Download and extract Apache Tomcat 9
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.109/bin/apache-tomcat-9.0.109.tar.gz
tar -xzf apache-tomcat-9.0.109.tar.gz
cd apache-tomcat-9.0.109

# Step 3: Configure Tomcat users for Manager access
cat <<EOF > conf/tomcat-users.xml
<tomcat-users>
  <role rolename="manager-gui"/>
  <role rolename="manager-script"/>
  <user username="tomcat" password="admin@123" roles="manager-gui,manager-script"/>
</tomcat-users>
EOF

# Step 4: Remove access restrictions from Manager app
cat <<EOF > webapps/manager/META-INF/context.xml
<Context privileged="true" antiResourceLocking="false" />
EOF

# Step 5: Start Tomcat
sh bin/startup.sh
