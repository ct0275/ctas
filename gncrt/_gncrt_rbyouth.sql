set lines 1000
set pages 1000
set heading off
set echo off
set feedback off

select 'CREATE TABLE ' || table_schema || '.' || table_name || ' AS SELECT * FROM ' || table_schema || '.' || table_name || '@my_maria;'
from INFORMATION_SCHEMA.TABLES@my_maria where table_schema in ('rbyouth');