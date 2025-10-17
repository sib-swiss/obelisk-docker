FROM obiba/opal:5.1.2

COPY  obelisk_resource /opt/opal/data/
COPY first_run_obelisk.sh /opt/opal/bin/
RUN chown opal /opt/opal/bin/first_run_obelisk.sh
RUN chown -R opal /opt/opal/data
RUN chmod 755 /opt/opal/bin/first_run_obelisk.sh
RUN echo  "/opt/opal/bin/first_run_obelisk.sh" >> /opt/opal/bin/first_run.sh
RUN echo  "mv /opt/opal/bin/first_run_obelisk.sh /opt/opal/bin/first_run_obelisk.sh.done"  >> /opt/opal/bin/first_run.sh
# RUN echo "#!/bin/bash" > /tmp/fr  && echo "sleep 120" >> /tmp/fr && tail -n +2 /opt/opal/bin/first_run.sh >> /tmp/fr && cat /tmp/fr > /opt/opal/bin/first_run.sh && rm /tmp/fr
RUN sed -i 's/set_property "org.obiba.realm.url" "$AGATE_URL" "$OPAL_HOME\/conf\/opal-config.properties"/ set_property "org.obiba.realm.url" "$AGATE_URL" "$OPAL_HOME\/conf\/opal-config.properties"\n\tset_property "org.obiba.realm.service.key" "$AGATE_AUTH_KEY" "$OPAL_HOME\/conf\/opal-config.properties"/g' /opt/opal/bin/start.sh





