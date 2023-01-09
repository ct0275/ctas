set lines 1000
set pages 1000
set heading off
set echo off
set feedback off

select 'CREATE TABLE ' || OWNER || '.' || table_name || ' AS SELECT * FROM ' || OWNER || '.' || table_name || '@ora_orcl;'
FROM dba_tables@ora_orcl
where owner IN ('CARE')
--and table_name not like '%BACKUP1' and NOT REGEXP_LIKE(table_name, '_[0-9]{4,10}+$')
;