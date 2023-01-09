set lines 1000
set pages 1000
set heading off
set echo off
set feedback off

select 'CREATE TABLE U_' || OWNER || '.' || table_name || ' AS SELECT * FROM ' || OWNER || '.' || table_name || '@ora_orcl;'
FROM dba_tables@ora_orcl where owner IN ('JIKIMI');