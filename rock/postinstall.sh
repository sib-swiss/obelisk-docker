#!/bin/sh
for mylib in dsSwissKnife resourcex dsQueryLibraryServer dsMOprimal dsMOdual; do
	[ -d "/var/lib/rock/R/library/$mylib" ] || Rscript -e "install.packages('$mylib', repos = c($R_REPOS), upgrade = FALSE, lib = '/var/lib/rock/R/library')"
done
chown -R rock /var/lib/rock/R/library
