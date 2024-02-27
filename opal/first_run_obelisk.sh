#!/bin/bash
for i in ${ROCK_HOSTS//,/ }
do
 acc="$acc,{\"host\":\"http://$i\"}"
done
rhosts=`echo $acc | cut -c2-`

echo {token:\"$ROCK_OPAL_TOKEN\", rockConfigs:[$rhosts]}| curl -v --user "administrator:$OPAL_ADMINISTRATOR_PASSWORD" -X PUT http://localhost:8080/ws/apps/config -H 'Content-Type: application/json' -d @-
/opt/opal/bin/install_rock_libs.sh
opal project -o http://localhost:8080 -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD --add --name obelisk 
#opal rest /datashield/package/dsBase/methods --opal http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT
sed s/@host@/$POSTGRESDATA_HOST/g /opt/opal/data/obelisk_resource | \
      sed s/@user@/$POSTGRESDATA_USER/g | \
      sed s/@password@/$POSTGRESDATA_PASSWORD/g | \
      sed s/@port@/$POSTGRESDATA_PORT/g | \
opal rest -o http://localhost:8080 -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD -m POST /project/obelisk/resources --content-type "application/json"
opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/project/obelisk/permissions/resources?type=GROUP&permission=RESOURCES_VIEW&principal=OBELISK_WP2"
opal perm-datashield --opal http://localhost:8080 --user administrator --password $OPAL_ADMINISTRATOR_PASSWORD --type GROUP --subject OBELISK_WP2 --permission use --add
#opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD  --method POST "/permissions/datashield?type=GROUP&permission=DATASHIELD_USEW&principal=OBELISK_WP2"
