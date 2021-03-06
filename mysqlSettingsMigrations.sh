##################################################

# /etc/mysql/mariadb.conf.d/50-server.cnf
# bind-address    = 127.0.0.1
mysql -u root -p -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '********' WITH GRANT OPTION;"

##################################################

# /etc/mysql/mariadb.conf.d/50-server.cnf
# [mysqld]
# innodb_read_io_threads = 4
# innodb_write_io_threads = 4
# connect_timeout = 31536000
# interactive_timeout = 31536000
# tmp_table_size = 18446744073709551615
# max_heap_table_size = 18446744073709551615
# innodb_buffer_pool_size = 4294967295
# innodb_data_file_path = ibdata1:12M:autoextend
# join_buffer_size = 4294967295

##################################################

# SHOW VARIABLES like 'innodb_read_io_threads';
# SHOW VARIABLES like 'innodb_write_io_threads';
# SHOW VARIABLES like 'connect_timeout';
# SHOW VARIABLES like 'interactive_timeout';
# SHOW VARIABLES like 'tmp_table_size';
# SHOW VARIABLES like 'max_heap_table_size';
# SHOW VARIABLES like 'innodb_buffer_pool_size';
# SHOW VARIABLES like 'innodb_data_file_path';
# SHOW PROCESSLIST;

##################################################

mkdir /mnt/sd/b/mysql/
rsync -av /var/lib/mysql /mnt/sd/b

# /etc/mysql/mariadb.conf.d/50-server.cnf
# datadir   = /mnt/sd/b/mysql

systemctl restart mysql

##################################################

nohup mysql --user=root --database=cautolog --password=******** < /mnt/sd/b/tecdoc2017q2/tecdoc.sql &
ps aux

##################################################
# /etc/mysql/mariadb.conf.d/50-server.cnf
# [server]
# [mysqld]
# user		= mysql
# pid-file	= /var/run/mysqld/mysqld.pid
# socket		= /var/run/mysqld/mysqld.sock
# port		= 3306
# basedir		= /usr
# datadir   = /mnt/sd/b/mysql
# tmpdir		= /tmp
# lc-messages-dir	= /usr/share/mysql
# skip-external-locking
# bind-address    = 127.0.0.1
# innodb_read_io_threads = 4
# innodb_write_io_threads = 4
# connect_timeout = 31536000
# interactive_timeout = 31536000
# tmp_table_size = 18446744073709551615
# max_heap_table_size = 18446744073709551615
# innodb_buffer_pool_size = 4294967295
# innodb_data_file_path = ibdata1:12M:autoextend
# join_buffer_size = 4294967295
# key_buffer_size		= 16M
# max_allowed_packet	= 16M
# thread_stack		= 192K
# thread_cache_size       = 8
# myisam_recover_options  = BACKUP
# query_cache_limit	= 1M
# query_cache_size        = 16M
# log_error = /var/log/mysql/error.log
# expire_logs_days	= 10
# max_binlog_size   = 100M
# character-set-server  = utf8mb4
# collation-server      = utf8mb4_general_ci
# innodb_file_per_table = 1
# [embedded]
# [mariadb]
# [mariadb-10.1]

##################################################
