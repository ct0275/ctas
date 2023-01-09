set lines 1000
set pages 1000
set heading off
set echo off
set feedback off

select 'DROP TABLE ' + decode(table_schema, 'dbo', 'education_dbo', table_schema) + '.' + table_name + ';'
from INFORMATION_SCHEMA.TABLES@ms_education where table_catalog = 'education' and table_type = 'BASE TABLE'
and table_schema in ('dbo', 'education');
