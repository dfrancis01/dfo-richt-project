# Developer: Dorlan.Francis02@gmail.com
# Script Source: https://www.statworx.com/en/content-hub/blog/how-to-dockerize-shinyapps/
# Base image https://hub.docker.com/u/rocker/
FROM rocker/shiny:4.1.2

# system libraries of general use
## install debian packages
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    libxml2-dev \
    libcairo2-dev \
    libsqlite3-dev \
    libmariadbd-dev \
    libpq-dev \
    libssh2-1-dev \
    unixodbc-dev \
    libcurl4-openssl-dev \
    libssl-dev

## update system libraries
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean

# copy necessary files
## app folder
COPY . ./richt
## renv.lock file
COPY ./renv.lock ./renv.lock

# install renv & restore packages
RUN Rscript -e 'install.packages(c("renv", "remotes"))'
RUN Rscript -e 'renv::consent(provided = TRUE)'
RUN Rscript -e 'renv::restore()'

# build rtich app
#RUN Rscript -e 'install.packages("remotes")'
RUN Rscript -e 'remotes::install_local("./richt")'

# expose port
EXPOSE 3838

# run app on container start
CMD ["R", "-e", "RiCHT::runApp(host = '0.0.0.0', port = 3838)"]
