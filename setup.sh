#!/bin/sh

curl https://packages.microsoft.com/config/rhel/7/mssql-server.repo > /etc/yum.repos.d/mssql-server.repo
yum install -y mssql-server

export SA_PASSWORD=V@grant1

/opt/mssql/bin/sqlservr-setup --accept-eula --set-sa-password --start-service --enable-service
systemctl status mssql-server

export ACCEPT_EULA=Y
curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/msprod.repo
yum install -y mssql-tools

cat << EOF > demo.sql
SELECT Name from sys.Databases;
GO
CREATE DATABASE testdb;
GO
USE testdb;
GO
CREATE TABLE inventory (id INT, name NVARCHAR(50), quantity INT);
GO
INSERT INTO inventory VALUES (1, 'banana', 150);
INSERT INTO inventory VALUES (2, 'orange', 154);
GO
SELECT * FROM inventory WHERE quantity > 152;
GO
EOF

sqlcmd -S localhost -U SA -P $SA_PASSWORD -i demo.sql


