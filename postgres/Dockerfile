FROM admarc/linux
MAINTAINER admarc

ENV INSTALL_DIR /data
ARG DATABASE_USER=development
ARG DATABASE_PASSWORD=development
ARG DATABASE_NAME=development

RUN mkdir -m a=rwx ${INSTALL_DIR}

RUN apt-get update \
    && apt-get install -y postgresql-9.5 \
    && rm -rf /var/lib/apt/lists/*

RUN chown postgres ${INSTALL_DIR}
USER postgres

RUN /usr/lib/postgresql/9.5/bin/initdb -D ${INSTALL_DIR}

RUN echo "listen_addresses='*'" >> ${INSTALL_DIR}/postgresql.conf
RUN echo "host all  all  0.0.0.0/0  md5" >> ${INSTALL_DIR}/pg_hba.conf

RUN /usr/lib/postgresql/9.5/bin/pg_ctl -D ${INSTALL_DIR} start -w &&\
/usr/lib/postgresql/9.5/bin/psql --command "CREATE USER ${DATABASE_USER} WITH SUPERUSER PASSWORD '${DATABASE_PASSWORD}';" &&\
createdb -O ${DATABASE_USER} ${DATABASE_NAME}

EXPOSE 5432
CMD /usr/lib/postgresql/9.5/bin/postgres -D ${INSTALL_DIR} -c config_file=${INSTALL_DIR}/postgresql.conf
