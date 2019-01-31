FROM admarc/java:alpine
MAINTAINER admarc

ENV INSTALL_DIR /usr/share/maven
ENV VERSION 3.6.0
RUN curl -O http://www-eu.apache.org/dist/maven/maven-3/${VERSION}/binaries/apache-maven-${VERSION}-bin.zip
RUN unzip apache-maven-${VERSION}-bin.zip -d ${INSTALL_DIR}
RUN ln -s ${INSTALL_DIR}/apache-maven-${VERSION}/bin/mvn /usr/bin/mvn
CMD ["/usr/bin/mvn"]

