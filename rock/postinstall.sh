#!/bin/sh
Rscript -e "install.packages(c('dsSwissKnife', 'resourcex', 'dsQueryLibraryServer'), repos = c($R_REPOS), upgrade = FALSE, Lib = '/var/lib/rsock/R/library')"
chown -R rock /var/lib/rock/R/library
