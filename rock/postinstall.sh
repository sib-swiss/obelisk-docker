#!/bin/sh
Rscript -e "install.packages(c('dsSwissKnife', 'resourcex', 'dsQueryLibraryServer'), repos = c($R_REPOS), upgrade = FALSE, lib = '/var/lib/rock/R/library')"
chown -R rock /var/lib/rock/R/library
