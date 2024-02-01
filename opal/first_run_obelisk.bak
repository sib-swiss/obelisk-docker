#!/bin/bash

#opal user --opal https://localhost:8443 --user administrator --password $OPAL_ADMINISTRATOR_PASSWORD  --add --name guest --upassword guest123
opal project -o https://localhost:8443 -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD --add --name obelisk --database postgresdb
opal rest /datashield/package/dsBase/methods --opal https://localhost:8443 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT
#opal perm-datashield --opal https://localhost:8443 --user administrator --password $OPAL_ADMINISTRATOR_PASSWORD --type USER --subject guest --permission use --add
opal rest -o https://localhost:8443 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/service/r/packages?manager=gh&name=sib-swiss/dsSwissKnife&ref=master"
opal rest -o https://localhost:8443 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/service/r/packages?manager=gh&name=sib-swiss/resourcex&ref=master"
opal rest -o https://localhost:8443 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/service/r/packages?manager=gh&name=sib-swiss/dsQueryLibraryServer&ref=main"
#opal rest -o https://localhost:8443 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/service/r/packages?name=DSI"
opal rest /datashield/package/dsSwissKnife/methods --opal https://localhost:8443 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT
opal rest /datashield/package/resourcex/methods --opal https://localhost:8443 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT
opal rest /datashield/package/dsQueryLibraryServer/methods --opal https://localhost:8443 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT
sed s/@host@/$POSTGRESDATA_HOST/g /opt/opal/data/obelisk_resource | \
      sed s/@user@/$POSTGRESDATA_USER/g | \
      sed s/@password@/$POSTGRESDATA_PASSWORD/g | \
opal rest -o https://localhost:8443 -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD -m POST /project/obelisk/resources --content-type "application/json"
opal rest -o https://localhost:8443 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/project/obelisk/permissions/resources?type=GROUP&permission=RESOURCES_VIEW&principal=SOPHIA_WP2"

