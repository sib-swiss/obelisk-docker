FROM datashield/rock-base:6.3.1
RUN  DEBIAN_FRONTEND=noninteractive apt-get install -y libpq-dev build-essential
RUN for mylib in dsSwissKnife resourcex dsQueryLibraryServer dsMOprimal dsMOdual; do \
        [ -d "/var/lib/rock/R/library/$mylib" ] || Rscript -e "install.packages('$mylib', repos = c('https://obelisk-fdb-auth.sib.swiss/SIB','https://obelisk-fdb-auth.sib.swiss/CRAN','https://obelisk-fdb-auth.sib.swiss.sib.swiss/CRAN-DS'), upgrade = FALSE, lib = '/var/lib/rock/R/library')"; \
done
RUN echo "chown -R rock /var/lib/rock/R/library" >> /opt/obiba/bin/first_run.sh





