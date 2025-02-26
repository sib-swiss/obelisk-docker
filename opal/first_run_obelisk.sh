#!/bin/bash
set_property () {
  field=$1
  value=$2
  file=$3
  tmpfile=/tmp/`basename ${file}`
  if grep -q ${field} ${file}
  then
    sed -r "s#${field}\s*=.*#${field}=${value}#g" ${file} | \
      sed -r "s/^#${field}=/${field}=/g" > ${tmpfile}
  else
    cat ${file} > ${tmpfile}
    echo "${field} = ${value}" >> ${tmpfile}
  fi
  mv ${tmpfile} ${file}
}
#start with a pause in order to allow rock to finish:
sleep 120
#set_property "org.obiba.opal.r.repos" "https://sophia-fdb.vital-it.ch:8443/SIB-R','https://sophia-fdb.vital-it.ch:8443/CRAN" /srv/conf/opal-config.properties
#set_property "org.obiba.realm.url" "$AGATE_URL" /srv/conf/opal-config.properties
set_property "org.obiba.realm.service.key" "$AGATE_AUTH_KEY" /srv/conf/opal-config.properties
#set_property "crsf.allowed" "obelisk-app.vital-it.ch:8080" /srv/conf/opal-config.properties
echo '{"name": "Opal","languages": ["en"],"defaultCharSet": "ISO-8859-1","enforced2FA": false,"allowRPackageManagement": true}' | opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT "/system/conf/general" --content-type="application/json"
opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT "/datashield/packages/_publish?profile=default&name=dsQueryLibraryServer&name=dsSwissKnife&name=resourcex"
opal project -o http://localhost:8080 -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD --add --name obelisk 
#opal rest /datashield/package/dsBase/methods --opal http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT
sed s/@host@/$POSTGRESDATA_HOST/g /opt/opal/data/obelisk_resource | \
      sed s/@user@/$POSTGRESDATA_USER/g | \
      sed s/@password@/$POSTGRESDATA_PASSWORD/g | \
      sed s/@port@/$POSTGRESDATA_PORT/g | \
opal rest -o http://localhost:8080 -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD -m POST /project/obelisk/resources --content-type "application/json"
opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/project/obelisk/permissions/resources?type=GROUP&permission=RESOURCES_VIEW&principal=$OPAL_PRIVILEGED_GROUP"
opal perm-datashield --opal http://localhost:8080 --user administrator --password $OPAL_ADMINISTRATOR_PASSWORD --type GROUP --subject $OPAL_PRIVILEGED_GROUP --permission use --add
