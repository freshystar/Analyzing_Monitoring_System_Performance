FROM ubuntu:latest
RUN apt-get update && apt-get install -y stress
RUN apt-get install -y sysstat 
RUN apt-get install -y cron
RUN apt-get install -y net-tools

COPY ./source.sh /home/ubuntu/source.sh
COPY ./resource_consumption_output.sh /home/ubuntu/resource_consumption_output.sh
COPY ./resource_consumption.sh /home/ubuntu/resource_consumption.sh
COPY ./resource_consumption_output_report.sh /home/ubuntu/resource_consumption_output_report.sh

RUN mkdir -p /etc/cron.d
RUN echo "* * * 1 1 ./source.sh " > /etc/cron.d/cronfile
RUN chmod 0644 /etc/cron.d/cronfile
RUN crontab   /etc/cron.d/cronfile
CMD ["stress", "--cpu", "2", "--io", "2", "--vm", "2", "--vm-bytes", "128M", "--timeout", "180s"]
