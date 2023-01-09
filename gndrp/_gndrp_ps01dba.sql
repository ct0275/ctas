set lines 1000
set pages 1000
set heading off
set echo off
set feedback off

select 'DROP TABLE ' || OWNER || '.' || table_name || ';'
FROM dba_tables@ora_cysnet where owner IN ('PS01DBA');
