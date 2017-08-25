FROM admarc/java
MAINTAINER admarc

ENV INSTALL_DIR /opt
ENV WILDFLY_VERSION 10.1.0.Final
ENV WILDFLY_HOME ${INSTALL_DIR}/wildfly-${WILDFLY_VERSION}

RUN apt-get update \
    && apt-get install -y curl unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://download.jboss.org/wildfly/${WILDFLY_VERSION}/wildfly-${WILDFLY_VERSION}.zip \
    && unzip wildfly-${WILDFLY_VERSION}.zip -d ${INSTALL_DIR} \
    && rm wildfly-${WILDFLY_VERSION}.zip \
    && chmod a+x ${WILDFLY_HOME}/bin/standalone.sh
    
ENTRYPOINT ${WILDFLY_HOME}/bin/standalone.sh -b=0.0.0.0

EXPOSE 8080
