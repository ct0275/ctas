set lines 1000
set pages 1000
set heading off
set echo off
set feedback off

select 'CREATE TABLE ' || OWNER || '.' || table_name || ' AS SELECT * FROM ' || OWNER || '.' || case when table_name in ('CYS_SUMMARY_a', 'CYS_QNA_backup') then '"' || table_name || '"'  else table_name end || '@ora_cysnet;'
FROM dba_tables@bs_ora_cysnet
where owner IN ('COUNSEL')
and owner||'.'||table_name not in (
-- TBR-7092: LONG column type cannot be specified in this statement.
-- _excpt_counsel.sql에 insert문 생성함
'COUNSEL.SY_SECURE_KEY'
,'COUNSEL.PLAN_TABLE'
,'COUNSEL.TOAD_PLAN_TABLE'
)
-- 빅테이블만 b3
and owner||'.'||table_name in (
 'COUNSEL.CYS_SURA'
,'COUNSEL.CYS_COUNS_MST_TRI'
,'COUNSEL.CYS_COUNS_MST_20151106'
,'COUNSEL.CYS_COUNS_S07_SUB'
,'COUNSEL.CYS_COUNS_S07'
,'COUNSEL.BAK_CYS_BIZ_AREA'
,'COUNSEL.CYS_BIZ_AREA_TEST'
,'COUNSEL.PT_CYS_COUNS_MST'
,'COUNSEL.CYS_SURA_2009'
,'COUNSEL.CYS_BIZ_PERSON'
,'COUNSEL.CYS_BIZ_AREA_TRI'
)
;