1,
rpm -ivh  basic level-sdk sqlplus
if rpm error, can modified the macro file

current os only can install oracle clinet 11


2,
/etc/profile
#add by zhangyang32
export ORACLE_HOME=/usr/lib/oracle/11.2/client64
export LD_LIBRARY_PATH=/usr/lib/oracle/11.2/client64/lib:$LD_LIBRARY_PATH
export PATH=/usr/lib/oracle/11.2/client64/bin:$PATH

export PYTHONPATH=$PYTHONPATH:/usr/lib/python2.7/site-packages

3,
# sqlplus cmdbquery/cmdbquery@197.3.135.222:1521/ITOMS
test

4,
>>> import cx_Oracle
ImportError: /usr/lib/python2.7/site-packages/cx_Oracle.so: undefined symbol: PyUnicodeUCS4_DecodeUTF16
ImportError: libpython2.7.so.1.0: cannot open shared object file: No such file or directory

re install python
MSGKAPSD:/home/dvp/soft/ywdv_devenv_setup/Python-2.7.12 #
 1037  2017-03-23 15:24:31 ./configure --with-threads --enable-shared --enable-unicode=ucs4
 1038  2017-03-23 15:25:05 make
 1039  2017-03-23 15:27:29 make install altinstall

ln -s /usr/local/lib/libpython2.7.so /usr/lib
ln -s /usr/local/lib/libpython2.7.so.1.0 /usr/lib

# ldd /usr/local/bin/python
/sbin/ldconfig -v



