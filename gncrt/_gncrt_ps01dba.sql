set lines 1000
set pages 1000
set heading off
set echo off
set feedback off

select 'CREATE TABLE ' || OWNER || '.' || table_name || ' AS SELECT * FROM ' || OWNER || '.' || table_name || '@ora_cysnet;'
FROM dba_tables@ora_cysnet
where owner IN ('PS01DBA')
and owner||'.'||table_name not in (
'PS01DBA.PLAN_TABLE'
)
;