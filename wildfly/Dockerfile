FROM admarc/java
MAINTAINER admarc

ENV INSTALL_DIR /opt
ENV WILDFLY_VERSION 10.1.0.Final
ENV WILDFLY_HOME ${INSTALL_DIR}/wildfly-${WILDFLY_VERSION}

ARG ADMIN_USERNAME
ARG ADMIN_PASSWORD

RUN apt-get update && apt-get install -y curl unzip

RUN curl -O https://download.jboss.org/wildfly/${WILDFLY_VERSION}/wildfly-${WILDFLY_VERSION}.zip \
    && unzip wildfly-${WILDFLY_VERSION}.zip -d ${INSTALL_DIR} \
    && rm wildfly-${WILDFLY_VERSION}.zip \
    && chmod a+x ${WILDFLY_HOME}/bin/standalone.sh
    
ADD add_user.sh /tmp/add_user.sh
RUN chmod +x /tmp/add_user.sh
RUN /tmp/add_user.sh
    
ENTRYPOINT ${WILDFLY_HOME}/bin/standalone.sh -b=0.0.0.0

EXPOSE 8080
