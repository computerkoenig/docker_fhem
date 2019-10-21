#To backup the data of FHEM, alexa-module config, collectord config
FROM debian:stable

#We need an cron or something like this

#Needed Volumes: fhem data, alexa data, collectord data (should be moved to an folder)

RUN apt-get update && apt-get -y upgrade \
&& apt-get -y install ca-certificates apt-transport-https ssh ccrypt

RUN mkdir /opt/backup /opt/backup_data /backup
COPY ./etc/backup.sh /opt/backup/backup.sh
RUN chmod a+x /opt/backup/backup.sh

CMD ["/bin/bash"]
