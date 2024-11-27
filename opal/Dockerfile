FROM obiba/opal

COPY  obelisk_resource /opt/opal/data/
COPY first_run_obelisk.sh /opt/opal/bin/
COPY postinstall.sh /opt/opal/bin/
RUN chown opal /opt/opal/bin/first_run_obelisk.sh
RUN chown opal /opt/opal/bin/postinstall.sh
RUN chown -R opal /opt/opal/data
RUN chmod 755 /opt/opal/bin/first_run_obelisk.sh
RUN chmod 755 /opt/opal/bin/postinstall.sh
RUN echo  "/opt/opal/bin/first_run_obelisk.sh" >> /opt/opal/bin/first_run.sh
RUN echo  "mv /opt/opal/bin/first_run_obelisk.sh /opt/opal/bin/first_run_obelisk.sh.done"  >> /opt/opal/bin/first_run.sh
RUN echo  'set_property "org.obiba.opal.r.repos" "https://cloud.r-project.org,https://cran.obiba.org"'  >> /opt/opal/bin/start.sh





