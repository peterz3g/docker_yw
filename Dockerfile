FROM daocloud.io/library/python:2.7.13
MAINTAINER peterz3g <peterz3g@163.com>

RUN mkdir -p /code
WORKDIR /code

COPY . /code/
ADD cron_jobs.txt /var/spool/cron/crontabs/root


# install nginx  E: dpkg was interrupted, you must manually run 'dpkg --configure -a' to correct the problem. 
# pip install --no-cache-dir -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com

RUN apt-get update && \
apt-get -y upgrade gcc && \
apt-get install -y cron && \
apt-get install -y default-jre && \
apt-get install -y vim && \
apt-get install -y alien && \
apt-get install -y libaio1 && \
apt-get install -y telnet && \
apt-get install -y libxml2-dev libxslt-dev python-dev && \
apt-get install -y python3-dev python-lxml  && \
apt-get install -y apt-utils && \
apt-get install -y supervisor && \
touch /code/jobs.log && \
chmod +x /code/entrypoint.sh && \
chmod 0600 /var/spool/cron/crontabs/root && \
pip install --upgrade pip && \
pip install --upgrade setuptools && \
pip install -r /code/requirements.txt && \
apt-get clean && \
apt-get autoclean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
ls


EXPOSE 8000
ENTRYPOINT ["/bin/bash", "/code/entrypoint.sh"]
