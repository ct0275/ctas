set lines 1000
set pages 1000
set heading off
set echo off
set feedback off

select 'CREATE TABLE ' || decode(table_schema, 'dbo', 'hrddb_dbo', table_schema) || '.' || table_name || ' AS SELECT * FROM ' || table_schema || '.' || table_name || '@ms_hrddb UNION SELECT * FROM ' || table_schema || '.' || table_name || '@ms_hrddb WHERE 1 = 2;'
from INFORMATION_SCHEMA.TABLES@ms_hrddb
where table_catalog = 'hrddb' and table_type = 'BASE TABLE'
and table_schema in ('dbo', 'hrddb')
and table_schema||'.'||table_name not in (
-- Data type length is out of range 문자열크기초과 (HTML코드 38만자 이상), _excpt_hrddb.sql에 수동생성
'dbo.DFT050TL'     
);
