FROM r-base
ADD install_packages.R /tmp/install_packages.R
RUN Rscript /tmp/install_packages.R 
RUN mkdir /standalone \
    mkdir /standalone/out
ADD *.R /standalone/
ADD ../data/iris.csv /standalone/
ADD ../data/test/* /standalone/test/
