set lines 1000
set pages 1000
set heading off
set echo off
set feedback off

select 'CREATE TABLE U_' || OWNER || '.' || case when table_name in ('zipcode') then '"' || table_name || '"'  else table_name end || ' AS SELECT * FROM ' || OWNER || '.' || case when table_name in ('zipcode') then '"' || table_name || '"'  else table_name end || '@ora_orcl;'
FROM dba_tables@ora_orcl
where owner IN ('COUNSEL');