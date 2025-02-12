#!/bin/bash

#for i in ${ROCK_HOSTS//,/ }
#do
# acc="$acc,{\"host\":\"http://$i\"}"
#done
#rhosts=`echo $acc | cut -c2-`

#echo {token:\"$ROCK_OPAL_TOKEN\", rockConfigs:[$rhosts]}| curl -v --user "administrator:$OPAL_ADMINISTRATOR_PASSWORD" -X PUT http://localhost:8080/ws/apps/config -H 'Content-Type: application/json' -d @-
#/opt/opal/bin/install_rock_libs.sh


opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/service/r/packages?manager=gh&name=sib-swiss/dsSwissKnife&ref=master"
opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/service/r/packages?manager=gh&name=sib-swiss/resourcex&ref=master"
opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method POST "/service/r/packages?manager=gh&name=sib-swiss/dsQueryLibraryServer&ref=main"
opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT "/datashield/packages/_publish?profile=default&name=dsQueryLibraryServer&name=dsSwissKnife&name=resourcex"
#opal rest /datashield/package/dsSwissKnife/methods --opal http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT
#opal rest /datashield/package/resourcex/methods --opal http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT
#opal rest /datashield/package/dsQueryLibraryServer/methods --opal http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT
