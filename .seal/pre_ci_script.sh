#!/bin/bash
set -ex

apt update
apt install -y maven

curl https://maven.repository.redhat.com/ga/com/ibm/websphere/uow/6.0.2.17/uow-6.0.2.17.jar -o /tmp/uow-6.0.2.17.jar && \
mvn install:install-file -Dfile=/tmp/uow-6.0.2.17.jar -DgroupId=com.ibm.websphere -DartifactId=uow -Dversion=6.0.2.17 -Dpackaging=jar -Dhttps.protocols=TLSv1.2

wget https://repo.spring.io/artifactory/plugins-snapshot/io/spring/gradle/docbook-reference-plugin/0.3.1-SNAPSHOT/docbook-reference-plugin-0.3.1-20150326.194600-4.jar
mvn install:install-file -Dfile=docbook-reference-plugin-0.3.1-20150326.194600-4.jar -DgroupId=io.spring.gradle -DartifactId=docbook-reference-plugin -Dversion=0.3.1-SNAPSHOT -Dpackaging=jar