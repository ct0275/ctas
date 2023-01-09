set lines 1000
set pages 1000
set heading off
set echo off
set feedback off

select 'DROP TABLE ' + decode(table_schema, 'dbo', 'newweb_dbo', table_schema) + '.' + decode(table_name, 'cyber1388_school(20030422)', '"'+table_name+'"', table_name) + ';'
from INFORMATION_SCHEMA.TABLES@ms_newweb where table_catalog = 'newweb'  and table_type = 'BASE TABLE'
and table_schema in ('dbo', 'newweb');

