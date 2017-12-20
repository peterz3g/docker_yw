#!/bin/bash
today=`date +"%Y%m%d"`

printenv | sed 's/^\(.*\)$/export \1/g' | grep 'MYSQL_' > /code/project_env.sh
cat /code/project_env.sh
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
service cron restart

alien -i ./ora11_python/oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm
alien -i ./ora11_python/oracle-instantclient11.2-devel-11.2.0.4.0-1.x86_64.rpm
alien -i ./ora11_python/oracle-instantclient11.2-sqlplus-11.2.0.4.0-1.x86_64.rpm

echo "#add by zhangyang32"  >> /etc/profile
echo "export ORACLE_BASE=/usr/lib/oracle/11.2"  >> /etc/profile
echo "export ORACLE_HOME=/usr/lib/oracle/11.2/client64"  >> /etc/profile
echo "export LD_LIBRARY_PATH=/usr/lib/oracle/11.2/client64/lib:$LD_LIBRARY_PATH"  >> /etc/profile
echo "export PATH=/usr/lib/oracle/11.2/client64/bin:$PATH"  >> /etc/profile
#echo "export PYTHONPATH=$PYTHONPATH:/usr/lib/python2.7/site-packages"  >> /etc/profile

echo "/usr/lib/oracle/11.2/client64/lib/"  >> /etc/ld.so.conf
/sbin/ldconfig




python /code/demo/manage.py runserver 0.0.0.0:8000
