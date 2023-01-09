set lines 1000
set pages 1000
set heading off
set echo off
set feedback off

select 'CREATE TABLE ' || OWNER || '.' || table_name || ' AS SELECT * FROM ' || OWNER || '.' || case when table_name in ('CYS_SUMMARY_a', 'CYS_QNA_backup') then '"' || table_name || '"'  else table_name end || '@ora_cysnet;'
FROM dba_tables@ora_cysnet
where owner IN ('KDREAM')
and owner||'.'||table_name not in (
-- LONG column type cannot be specified in this statement.  
 'KDREAM.TOAD_PLAN_TABLE'
,'KDREAM.PLAN_TABLE'
,'KDREAM.SDB_CYS_USER'
)
-- ºòÅ×ÀÌºí¸¸ b1
and owner||'.'||table_name in (
 'KDREAM.CYS_BIZ_AREA_TRI'
,'KDREAM.CYS_COUNS_MST_TRI'
,'KDREAM.CYS_PERSON_CRISIS'
,'KDREAM.CYS_COUNS_MST_20150813'
)
;
