# HOW TO CREATE MULTIPLE ADDITIONAL POSTGRES CLUSTERS

sudo su

mkdir -p /dbpostgres/clus1 \n
mkdir -p /dbpostgres/clus2 \n
mkdir -p /dbpostgres/clus3 \n

chown postgres /dbpostgres/clus1 \n
chown .postgres /dbpostgres/clus1 \n
chown postgres /dbpostgres/clus2 \n
chown .postgres /dbpostgres/clus2 \n
chown postgres /dbpostgres/clus3 \n
chown .postgres /dbpostgres/clus3 \n



sudo su postgres

/usr/lib/postgresql/12/bin/initdb -D /dbpostgres/clus1 -U postgres -W \n
/usr/lib/postgresql/12/bin/pg_ctl -D /dbpostgres/clus1 start \n

/usr/lib/postgresql/12/bin/initdb -D /dbpostgres/clus2 -U postgres -W \n
/usr/lib/postgresql/12/bin/pg_ctl -D /dbpostgres/clus2 start \n

/usr/lib/postgresql/12/bin/initdb -D /dbpostgres/clus3 -U postgres -W \n
/usr/lib/postgresql/12/bin/pg_ctl -D /dbpostgres/clus2 start \n

#NOTE: BEFORE STARTING THE CLUSTER USING 'pg_ctl', The default port number '#port=5432'  to be changed to desired port number in the 'postgresql.conf' file  \n

