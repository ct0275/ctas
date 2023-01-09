set lines 1000
set pages 1000
set heading off
set echo off
set feedback off

select 'CREATE TABLE ' || decode(table_schema, 'dbo', 'chatting_dbo', table_schema) || '.' || table_name || ' AS SELECT * FROM ' || table_schema || '.' || table_name || '@ms_chatting UNION SELECT * FROM ' || table_schema || '.' || table_name || '@ms_chatting WHERE 1 = 2;'
from INFORMATION_SCHEMA.TABLES@ms_chatting
where table_catalog = 'chatting' and table_type = 'BASE TABLE'
and table_schema in ('dbo', 'chatting')
and table_schema||'.'||table_name not in (
-- Generic I/O, excpt_newweb.sql에 수동생성
'chatting.j7'          
-- Data type length is out of range, 데이터없어서 제외
,'dbo.dtproperties'
,'dbo.simple_log_feer'
);