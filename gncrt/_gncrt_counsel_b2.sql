set lines 1000
set pages 1000
set heading off
set echo off
set feedback off

select 'CREATE TABLE ' || OWNER || '.' || table_name || ' AS SELECT * FROM ' || OWNER || '.' || case when table_name in ('CYS_SUMMARY_a', 'CYS_QNA_backup') then '"' || table_name || '"'  else table_name end || '@ora_cysnet;'
FROM dba_tables@ora_cysnet
where owner IN ('COUNSEL')
and owner||'.'||table_name not in (
-- TBR-7092: LONG column type cannot be specified in this statement.
-- _excpt_counsel.sql에 insert문 생성함
 'COUNSEL.SY_SECURE_KEY'
,'COUNSEL.PLAN_TABLE'
,'COUNSEL.TOAD_PLAN_TABLE'
)
-- 빅테이블만 b2
and owner||'.'||table_name in (
 'COUNSEL.CYS_PERSON_CRISIS'
,'COUNSEL.CYS_COUNS_MST20160111'
,'COUNSEL.CYS_COUNS_MST20150423'
,'COUNSEL.BAK_CYS_SURA'
,'COUNSEL.CYS_SURAMST'
,'COUNSEL.CYS_COUNS_S01'
,'COUNSEL.DEL_BIZ_AREA'
,'COUNSEL.CYS_SURA_2009_1'
,'COUNSEL.CYS_MESSAGE_TGT'
,'COUNSEL.CYS_COUNS_S07_SER_CD'
,'COUNSEL.DEL_SURA'
,'COUNSEL.CYS_COUNS_MST_20111219'
,'COUNSEL.BAK_CYS_COUNS_MST'
)
;