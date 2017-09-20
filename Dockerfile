FROM postgres:latest

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

COPY ./config /myconfig
COPY ./docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
COPY ./scripts /scripts
RUN chmod 755 /docker-entrypoint-initdb.d/
