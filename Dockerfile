FROM java:8

WORKDIR /code

# Prepare by downloading dependencies
ENV MAVEN_HOME=/root/.m2/
ARG MAVEN_VERSION=3.3.9
ARG USER_HOME_DIR="/root"

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    | tar -xzC /usr/share/maven --strip-components=1 \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

VOLUME "$USER_HOME_DIR/.m2"

ADD pom.xml /code/pom.xml

# Adding source, compile and package into a fat jar
ADD src /code/src
RUN ["mvn", "clean", "package", "-Dmaven.test.skip=true"]

EXPOSE 8080
CMD ["mvn", "spring-boot:run", "-Dspring.profiles.active=docker"]
