# Microsoft SQL Server on Centos 7 / Vagrant / VirtualBox

This project contains a vagrant file that set up a Centos7 (centos/7) box on vagrant VirtualBox
with MS SQL Server for linux. 

## Start the virtual machine

```
vagrant up 
```

## Test a sql query on the guest vm
```
export SA_PASSWORD=V@grant1
sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "use testdb; select * from inventory"
```

## Test a sql query from the host (MacOS X)

```
export SA_PASSWORD=V@grant1
mssql -s localhost -u SA -p $SA_PASSWORD -q "use testdb; select * from inventory"
```


### Reference https://docs.microsoft.com/sv-se/sql/linux/sql-server-linux-setup-red-hat

### https://arstechnica.com/information-technology/2016/12/how-an-old-drawbridge-helped-microsoft-bring-sql-server-to-linux/2/
### https://channel9.msdn.com/Shows/Data-Exposed/SQL-Server-on-Linux-The-HOW
