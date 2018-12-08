FROM continuumio/miniconda3

LABEL user.name="Don Jacob"

ADD environment.yml /tmp/
ADD ampl.linux64.tgz /tmp/

RUN chmod 755 /tmp/ampl.linux64.tgz
##RUN conda install -n root -f /tmp/environment.yml
RUN tar -xvzf /tmp/ampl.linux64.tgz -C /opt
##tar -xvzf compressed_file.tgz -C /destination_directory
