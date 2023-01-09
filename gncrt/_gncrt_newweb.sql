set lines 1000
set pages 1000
set heading off
set echo off
set feedback off

select 'CREATE TABLE ' || decode(table_schema, 'dbo', 'newweb_dbo', table_schema) || '.' || table_name || ' AS SELECT * FROM ' || table_schema || '.' || table_name || '@ms_newweb UNION SELECT * FROM ' || table_schema || '.' || table_name || '@ms_newweb WHERE 1 = 2;'
from INFORMATION_SCHEMA.TABLES@ms_newweb
where table_catalog = 'newweb' and table_type = 'BASE TABLE'
and table_schema in ('dbo', 'newweb')
and table_schema||'.'||table_name not in (
-- Generic I/O error, _excpt_newweb.sql에 insert문 생성함
 'dbo.TB_Board'
,'dbo.TB_KNOWLEDGE_INFORMATION'
,'dbo.admin'
,'dbo.uploadfile1'
,'dbo.webpds35'
-- TBR-5114: Invalid fractional second, _excpt_newweb.sql에 insert문 생성함
,'newweb.USD100TL'
,'newweb.RCT250TL'
,'newweb.Copy_RCT250TL_20201007_10_00'
,'newweb.TB_Info_Management'
,'dbo.CYS_MENU_MASTER'
,'dbo.SHELTER_MENU_MASTER'
,'dbo.SHELTER_MENU_MASTER_B'
,'newweb.TBL_OUTREACH'
-- Data type length is out of range, 데이터없어 제외
,'newweb.TB_Board_TEMP2'
,'newweb.ahcmd'
,'newweb.cmd'
,'newweb.TestTable'
,'dbo.dtproperties'
,'dbo.heige'
,'dbo.jm_tmp'
,'dbo.UploadFile'
-- 백업테이블제외
,'newweb.TBL_OPENCHATTING_20211217'
,'newweb.webpds35_20211122'
,'newweb.USD100TL_20211209'
,'newweb.TB_Board_20171205'
,'dbo.TB_Board_Gapjil'
,'dbo.TB_KNOWLEDGE_INFORMATION_20211208'
,'dbo.TB_Board_20161209'
,'dbo.tb_board_2151207'
,'dbo.tb_board20151207'
,'dbo.TB_Board_Copy'
,'dbo.Copy_TB_Board'
,'dbo.TB_Board_20141103'
,'dbo.CYBER1388_SCHOOL(20030422)'
);
