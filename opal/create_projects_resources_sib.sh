opal project -o https://obelisk-fdb.sib.swiss/sib -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD --add --name tops
opal project -o https://obelisk-fdb.sib.swiss/sib -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD --add --name nfbc1986

sed s/@host@/$POSTGRESDATA_HOST/g ./tops_resource | \
      sed s/@user@/$POSTGRESDATA_USER/g | \
      sed s/@password@/$POSTGRESDATA_PASSWORD/g | \
      sed s/@port@/$POSTGRESDATA_PORT/g | \
opal rest -o https://obelisk-fdb.sib.swiss/sib -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD -m POST /project/tops/resources --content-type "application/json"

sed s/@host@/$POSTGRESDATA_HOST/g ./nfbc1986_resource | \
      sed s/@user@/$POSTGRESDATA_USER/g | \
      sed s/@password@/$POSTGRESDATA_PASSWORD/g | \
      sed s/@port@/$POSTGRESDATA_PORT/g | \
opal rest -o https://obelisk-fdb.sib.swiss/sib -u administrator -p $OPAL_ADMINISTRATOR_PASSWORD -m POST /project/nfbc1986/resources --content-type "application/json"
opal rest -o https://obelisk-fdb.sib.swiss/sib --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/project/tops/permissions/resources?type=GROUP&permission=RESOURCES_VIEW&principal=obelisk-wp1"
opal rest -o https://obelisk-fdb.sib.swiss/sib --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/project/nfbc1986/permissions/resources?type=GROUP&permission=RESOURCES_VIEW&principal=obelisk-wp1"
