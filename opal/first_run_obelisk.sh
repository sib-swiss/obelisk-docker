#!/bin/bash
echo '{"name": "Opal","languages": ["en"],"defaultCharSet": "ISO-8859-1","enforced2FA": false,"allowRPackageManagement": true}' | opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT "/system/conf/general" --content-type="application/json"

/opt/opal/bin/postinstall.sh
opal project -o http://localhost:8080 -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD --add --name obelisk 
#opal rest /datashield/package/dsBase/methods --opal http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT
sed s/@host@/$POSTGRESDATA_HOST/g /opt/opal/data/obelisk_resource | \
      sed s/@user@/$POSTGRESDATA_USER/g | \
      sed s/@password@/$POSTGRESDATA_PASSWORD/g | \
      sed s/@port@/$POSTGRESDATA_PORT/g | \
opal rest -o http://localhost:8080 -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD -m POST /project/obelisk/resources --content-type "application/json"
opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/project/obelisk/permissions/resources?type=GROUP&permission=RESOURCES_VIEW&principal=$OPAL_PRIVILEGED_GROUP"
opal perm-datashield --opal http://localhost:8080 --user administrator --password $OPAL_ADMINISTRATOR_PASSWORD --type GROUP --subject $OPAL_PRIVILEGED_GROUP --permission use --add
#opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD  --method POST "/permissions/datashield?type=GROUP&permission=DATASHIELD_USEW&principal=OBELISK_WP2"
