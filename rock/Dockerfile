FROM datashield/rock-base:6.3.1
RUN  DEBIAN_FRONTEND=noninteractive apt-get install -y libpq-dev build-essential
COPY postinstall.sh /opt/bin/postinstall.sh
RUN chmod +x /opt/bin/postinstall.sh
RUN echo "/opt/bin/postinstall.sh" >> /opt/obiba/bin/first_run.sh





