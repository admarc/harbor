#!/bin/bash
if [[ -n $DATABASE_NAME ]] && [[ -n $DATABASE_USER ]] && [[ -n $DATABASE_PASSWORD ]]; then
    /usr/lib/postgresql/9.5/bin/pg_ctl -D ${INSTALL_DIR} start -w &&\
    /usr/lib/postgresql/9.5/bin/psql --command "DO \$body\$ BEGIN IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE  usename = '${DATABASE_USER}') THEN CREATE USER ${DATABASE_USER} WITH SUPERUSER PASSWORD '${DATABASE_PASSWORD}'; END IF; END \$body\$;"
    if [[ "$( psql -tAc "SELECT 1 FROM pg_database WHERE datname='${DATABASE_NAME}'" )" != '1' ]]
    then
        createdb -O ${DATABASE_USER} ${DATABASE_NAME}
    fi
    /usr/lib/postgresql/9.5/bin/pg_ctl -D ${INSTALL_DIR} stop
fi

/usr/lib/postgresql/9.5/bin/postgres -D ${INSTALL_DIR} -c config_file=${INSTALL_DIR}/postgresql.conf
