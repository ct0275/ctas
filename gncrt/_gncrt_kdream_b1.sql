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
 'KDREAM.DEL_SURA'
,'KDREAM.BAK_CYS_SURA'
,'KDREAM.CYS_COUNS_S07_SUB'
,'KDREAM.CYS_COUNS_S07_SER_CD'
,'KDREAM.BAK_CYS_BIZ_AREA'
,'KDREAM.CYS_COUNS_MST_20111219'
,'KDREAM.CYS_LOGIN_LOG_KJY'
,'KDREAM.CYS_COUNS_S07'
,'KDREAM.PT_CYS_COUNS_MST'
,'KDREAM.CYS_STOP_REPORT'
,'KDREAM.CYS_STOP_REPORT_20210216'
,'KDREAM.CYS_MULTI_DATA_20210216'
,'KDREAM.CYS_MULTI_DATA'
,'KDREAM.CYS_COUNS_MST_20151110'
,'KDREAM.BAK_CYS_COUNS_MST'
,'KDREAM.CYS_COUNS_S07'
,'KDREAM.PT_CYS_COUNS_MST'
,'KDREAM.CYS_STOP_REPORT'
,'KDREAM.CYS_STOP_REPORT_20210216'
,'KDREAM.CYS_MULTI_DATA_20210216'
,'KDREAM.CYS_BIZ_AREA_TRI'
,'KDREAM.CYS_COUNS_MST_TRI'
,'KDREAM.CYS_PERSON_CRISIS'
,'KDREAM.CYS_COUNS_MST_20150813'
)
;
