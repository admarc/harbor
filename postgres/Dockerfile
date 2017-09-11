FROM admarc/linux
MAINTAINER admarc

ENV INSTALL_DIR /data

RUN mkdir -m a=rwx ${INSTALL_DIR}

RUN apt-get update \
    && apt-get install -y postgresql-9.5 \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/entrypoint.sh

RUN chown postgres ${INSTALL_DIR}
USER postgres

RUN /usr/lib/postgresql/9.5/bin/initdb -D ${INSTALL_DIR}

RUN echo "listen_addresses='*'" >> ${INSTALL_DIR}/postgresql.conf
RUN echo "host all  all  0.0.0.0/0  md5" >> ${INSTALL_DIR}/pg_hba.conf

EXPOSE 5432

ENTRYPOINT /usr/local/bin/entrypoint.sh
