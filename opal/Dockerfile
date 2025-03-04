FROM obiba/opal:4.7.4

COPY  obelisk_resource /opt/opal/data/
COPY first_run_obelisk.sh /opt/opal/bin/
RUN chown opal /opt/opal/bin/first_run_obelisk.sh
RUN chown -R opal /opt/opal/data
RUN chmod 755 /opt/opal/bin/first_run_obelisk.sh
RUN echo  "/opt/opal/bin/first_run_obelisk.sh" >> /opt/opal/bin/first_run.sh
RUN echo  "mv /opt/opal/bin/first_run_obelisk.sh /opt/opal/bin/first_run_obelisk.sh.done"  >> /opt/opal/bin/first_run.sh
RUN echo "#!/bin/bash" > /tmp/fr  && echo "sleep 120" >> /tmp/fr && tail -n +2 /opt/opal/bin/first_run.sh >> /tmp/fr && cat /tmp/fr > /opt/opal/bin/first_run.sh && rm /tmp/fr
#RUN echo  'set_property "org.obiba.opal.r.repos" "https://sophia-fdb.vital-it.ch:8443/SIB-R','https://sophia-fdb.vital-it.ch:8443/CRAN"'  >> /opt/opal/bin/start.sh





