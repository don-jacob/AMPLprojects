FROM continuumio/miniconda3

LABEL user.name="Don Jacob"

ADD environment.yml /tmp
COPY ampl.linux64.tgz /tmp

###RUN ls -lrt /tmp
###RUN ls -lrt /tmp/environment.yml
###RUN chmod 755 /tmp/ampl.linux64.tgz
###RUN conda update -n base -c defaults conda
RUN conda env update -n root --file /tmp/environment.yml
###RUN conda install -n root -f /tmp/environment.yml
RUN tar -xvzf /tmp/ampl.linux64.tgz -C /opt
##tar -xvzf compressed_file.tgz -C /destination_directory
