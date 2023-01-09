set lines 1000
set pages 1000
set heading off
set echo off
set feedback off

select 'CREATE TABLE ' || OWNER || '.' || table_name || ' AS SELECT * FROM ' || OWNER || '.' || table_name || '@ora_orcl;'
FROM dba_tables@ora_orcl
where owner IN ('SIMTER')
and owner||'.'||table_name not in (
-- LONG column type cannot be specified in this statement.  
 'SIMTER.PLAN_TABLE'
,'SIMTER.CYS_RECOVER_STATUS_SURVEY_ERR'
)
;