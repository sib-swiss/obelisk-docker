FROM postgres:latest
ENV PGDATA /obelisk/data
RUN mkdir -p "$PGDATA" && chown -R postgres:postgres "$PGDATA" && chmod 777 "$PGDATA"
RUN mkdir -p /obelisk/conf/conf.d && chown -R postgres:postgres /obelisk/conf && chmod 777 /obelisk/conf
COPY pg_hba.conf /obelisk/conf/
RUN chown postgres:postgres /obelisk/conf/pg_hba.conf
RUN chmod 600 /obelisk/conf/pg_hba.conf
VOLUME "$PGDATA"
RUN mkdir /scripts
COPY *.sh /docker-entrypoint-initdb.d/
RUN chmod 777 /docker-entrypoint-initdb.d/*
COPY *.sql /scripts/
RUN chown -R postgres /scripts
