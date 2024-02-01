FROM postgres:latest
ENV PGDATA /obelisk/data
RUN mkdir -p "$PGDATA" && chown -R postgres:postgres "$PGDATA" && chmod 777 "$PGDATA"
COPY pg_hba.conf /obelisk/data/
RUN chown postgres:postgres /obelisk/data/pg_hba.conf
RUN chmod 600 /obelisk/data/pg_hba.conf
RUN mkdir -p /obelisk/conf/ && chown -R postgres:postgres /obelisk/conf && chmod 777 /obelisk/conf
VOLUME "$PGDATA"
RUN mkdir /scripts
COPY *.sh /docker-entrypoint-initdb.d/
RUN chmod 777 /docker-entrypoint-initdb.d/*
COPY *.sql /scripts/
RUN chown -R postgres /scripts
