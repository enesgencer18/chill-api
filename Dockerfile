ARG R_VERSION=latest

FROM rocker/r-ver:${R_VERSION}

# install the linux libraries needed for plumber
RUN apt-get update -qq && apt-get install -y \
  libssl-dev \
  libcurl4-gnutls-dev

COPY / /

# Making home & test folders 
RUN Rscript required-packages/required-packages.R

# Giving permission to tests to run
RUN chmod +x tests/run_tests.sh

# Run Tests  
RUN tests/run_tests.sh

# open port 80 to traffic
EXPOSE 80

# when the container starts, start the main.R script
ENTRYPOINT ["Rscript", "./main.R"]    
