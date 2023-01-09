# ctas
Create tibero tables as select from heterogeneous databases

## What does it?
I don't want to make something that already exists, remaking what already exists is stupid like create tables with coding ddl, even from another world.

This ctas script make all tibero tables came from another worlds, using awsome private schema option.

## Prerequisites
ctas is a tiny batch file on windows, so it needs some install before use.

### 1. Java development tookit
> <span style='color: #9061ff'> JDK 1.8 </spqn>
>
> Java SE Development Kit 8u202
>
> https://www.oracle.com/kr/java/technologies/javase/javase8-archive-downloads.html
>
### 2. Tibero database & java gateway
>
> <span style='color: #9061ff'> Timaxsoft tibero java gateway </spqn>
>
> tbjavagw 6.0
>
> https://technet.tmaxsoft.com/ko/front/download/viewDownload.do?cmProductCode=0301&version_seq=PVER-20150504-000001&doc_type_cd=DN
### 3. Source heterogeneous databases like Mssql, Maria, Oracle, Sybase and so on
>
> <span style='color: #9061ff'> JDBC library </spqn>
>
1. Oracle
   Ddriver [oracle.jdbc.driver.OracleDriver]
   URL     [jdbc:oracle:thin:@localhost:1521:DBNAME]

2. Sybase
   Ddriver [com.sybase.jdbc2.jdbc.SybDriver]
   URL     [jdbc:sybase:Tds:localhost:5001/DBNAME]
   * jTDS2.jar

3. MS-SQL
   Driver [com.microsoft.sqlserver.jdbc.SQLServerDriver]
   URL   [jdbc:sqlserver://localhost:1433;DatabaseName=DBNAME]
   sqljdbc.jar or sqljdbc4.jar

   Driver [com.microsoft.jdbc.sqlserver.SQLServerDriver]
   URL   [jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=DBNAME]
   msbase.jar, mssqlserver.jar, msutil.jar

   Driver [core.log.jdbc.driver.Mssql2005Driver]
   URL   [jdbc:sqlserver://localhost:1433;database=DBNAME]
   log4sql.jar

   Driver [net.sourceforge.jtds.jdbc.Driver]
   Driver [net.sourceforge.jtds.jdbcx.JtdsDataSource]
   URL   [jdbc:jtds:sqlserver://localhost:1433/DBNAME;tds=8.0;lastupdatecount=true]
   jtds-1.2.jar

4. DB2
   Driver [com.ibm.db2.jcc.DB2Driver]
   URL   [jdbc:db2://localhost:50000/DBNAME]
   db2jcc.jar, db2jcc_javax.jar, db2jcc_license_cu.jar

5. UniSQL
   Driver [unisql.jdbc.driver.UniSQLDriver]
   URL   [jdbc:unisql:localhost:43300:DBNAME:::]

6. MySQL, MariaDB
   Driver [com.mysql.jdbc.Driver]
   Driver [org.gjt.mm.mysql.Driver]
   URL   [jdbc:mysql://localhost:3306/DBNAME]
   mysql-connector-java-5.1.23-bin.jar

7. Altibase
   Driver [Altibase.jdbc.driver.AltibaseDriver]
   URL   [jdbc:Altibase://localhost:20300/DBNAME]
   Altibase.jar

8. hsqldb
   Driver [org.hsqldb.jdbcDriver]
   URL   [jdbc:hsqldb:hsql://localhost:9001/DBNAME]
>

```bash
# ctas.cmd 

C:\Users\imuser\migration>ctas.cmd -d rbyouth
table abcd drop.
...
C:\Users\imuser\migration>ctas.cmd -c rbyouth
table abcd created.
...
```
## Usage
And use like this
```bash
ctas.cmd -d [schema name] => drop all tables in specified schema
ctas.cmd -c [schema name] => create all tables in specified schema
ex> ctas.cmd -d rbyouth
    ctas.cmd -c rbyouth
