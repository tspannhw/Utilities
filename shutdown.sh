# See  https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.4.2/bk_HDP_Reference_Guide/content/stopping_hdp_services.html
# Run as root
sudo service nifi stop
sudo service ranger-admin stop
sudo service ranger-usersync stop
su -l knox -c "/usr/hdp/current/knox-server/bin/gateway.sh stop"
su -l oozie -c "/usr/hdp/current/oozie-server/bin/oozied.sh stop"
su -l hcat -c "/usr/hdp/current/hive-webhcat/sbin/webhcat_server.sh stop"
ps aux | awk '{print $1,$2}' | grep hive | awk '{print $2}' | xargs kill >/dev/null 2>&1
su -l hbase -c "/usr/hdp/current/hbase-regionserver/bin/hbase-daemon.sh stop regionserver"
su -l hbase -c "/usr/hdp/current/hbase-master/bin/hbase-daemon.sh stop master"
su -l yarn -c "/usr/hdp/current/hadoop-yarn-nodemanager/sbin/yarn-daemon.sh stop nodemanager"
su -l yarn -c "/usr/hdp/current/hadoop-mapreduce-historyserver/sbin/mr-jobhistory-daemon.sh stop historyserver"
su -l yarn -c "/usr/hdp/current/hadoop-yarn-resourcemanager/sbin/yarn-daemon.sh stop resourcemanager"
su -l hdfs -c "/usr/hdp/current/hadoop-hdfs-datanode/../hadoop/sbin/hadoop-daemon.sh stop datanode"
su -l hdfs -c "/usr/hdp/current/hadoop-hdfs-namenode/../hadoop/sbin/hadoop-daemon.sh stop secondarynamenode"
su -l hdfs -c "/usr/hdp/current/hadoop-hdfs-namenode/../hadoop/sbin/hadoop-daemon.sh stop namenode"
su -l hdfs -c "/usr/hdp/current/hadoop-hdfs-namenode/../hadoop/sbin/hadoop-daemon.sh stop zkfc"
su - zookeeper -c "export ZOOCFGDIR=/usr/hdp/current/zookeeper-server/conf ; export ZOOCFG=zoo.cfg; source /usr/hdp/current/zookeeper-server/conf/zookeeper-env.sh ; /usr/hdp/current/zookeeper-server/bin/zkServer.sh stop"
/etc/init.d/hue stop
/usr/hdp/current/kafka-broker/bin/kafka stop
shutdown 0
halt
