//sudo yum install java-17-amazon-corretto -y
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.98/bin/apache-tomcat-9.0.98.tar.gz
tar -zxvf apache-tomcat-9.0.98.tar.gz
sed -i '56  a\<role rolename="manager-gui"/>' apache-tomcat-9.0.98/conf/tomcat-users.xml
sed -i '57  a\<role rolename="manager-script"/>' apache-tomcat-9.0.98/conf/tomcat-users.xml
sed -i '58  a\<user username="tomcat" password="raham123" roles="manager-gui, manager-script"/>' apache-tomcat-9.0.98/conf/tomcat-users.xml
sed -i '59  a\</tomcat-users>' apache-tomcat-9.0.98/conf/tomcat-users.xml
sed -i '56d' apache-tomcat-9.0.98/conf/tomcat-users.xml
sed -i '21d' apache-tomcat-9.0.98/webapps/manager/META-INF/context.xml
sed -i '22d'  apache-tomcat-9.0.98/webapps/manager/META-INF/context.xml
sh apache-tomcat-9.0.98/bin/startup.sh//


#latest working
#!/bin/bash

# Install Java (already installed is fine)
sudo yum install java-17-amazon-corretto -y

# Download Tomcat 9.0.85 (last known good version)
TOMCAT_VERSION="9.0.85"
wget https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Extract Tomcat
tar -zxvf apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Configure users
TOMCAT_DIR="apache-tomcat-${TOMCAT_VERSION}"
sed -i '56  a\<role rolename="manager-gui"/>' ${TOMCAT_DIR}/conf/tomcat-users.xml
sed -i '57  a\<role rolename="manager-script"/>' ${TOMCAT_DIR}/conf/tomcat-users.xml
sed -i '58  a\<user username="tomcat" password="raham123" roles="manager-gui,manager-script"/>' ${TOMCAT_DIR}/conf/tomcat-users.xml
sed -i '59  a\</tomcat-users>' ${TOMCAT_DIR}/conf/tomcat-users.xml
sed -i '56d' ${TOMCAT_DIR}/conf/tomcat-users.xml

# Disable restrictions in manager app context
sed -i '21d' ${TOMCAT_DIR}/webapps/manager/META-INF/context.xml
sed -i '22d' ${TOMCAT_DIR}/webapps/manager/META-INF/context.xml

# Start Tomcat
sh ${TOMCAT_DIR}/bin/startup.sh

