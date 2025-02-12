#!/bin/sh
#To execute in the opal-obelisk container only once after the installation is completely finished:

opal rest -o http://localhost:8080 --user administrator --password  $OPAL_ADMINISTRATOR_PASSWORD --method PUT "/datashield/packages/_publish?profile=default&name=dsQueryLibraryServer&name=dsSwissKnife&name=resourcex"

