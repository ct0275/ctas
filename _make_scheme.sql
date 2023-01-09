-- 1. DBLink 테스트를 위한 스키마생성
-- 1-0. 템프확장
alter tablespace temp add tempfile 'E:\TmaxData\tibero6\database\tibero\temp_002.dbf' size 10G autoextend on;
alter tablespace temp add tempfile 'E:\TmaxData\tibero6\database\tibero\temp_003.dbf' size 32G autoextend on;
alter tablespace temp add tempfile 'E:\TmaxData\tibero6\database\tibero\temp_004.dbf' size 32G autoextend on;

-- 1-1. 오라클
create tablespace ts_counsel datafile 'E:\TmaxData\tibero6\database\tibero\counsel_01.dbf' size 10G;
alter tablespace ts_counsel add datafile 'E:\TmaxData\tibero6\database\tibero\counsel_02.dbf' size 10G;
alter tablespace ts_counsel add datafile 'E:\TmaxData\tibero6\database\tibero\counsel_03.dbf' size 10G;
alter tablespace ts_counsel add datafile 'E:\TmaxData\tibero6\database\tibero\counsel_04.dbf' size 10G;
alter tablespace ts_counsel add datafile 'E:\TmaxData\tibero6\database\tibero\counsel_05.dbf' size 10G;
alter tablespace ts_counsel add datafile 'E:\TmaxData\tibero6\database\tibero\counsel_06.dbf' size 10G;
alter tablespace ts_counsel add datafile 'E:\TmaxData\tibero6\database\tibero\counsel_07.dbf' size 10G;
alter tablespace ts_counsel add datafile 'E:\TmaxData\tibero6\database\tibero\counsel_08.dbf' size 10G;
alter tablespace ts_counsel add datafile 'E:\TmaxData\tibero6\database\tibero\counsel_09.dbf' size 10G;
alter tablespace ts_counsel add datafile 'E:\TmaxData\tibero6\database\tibero\counsel_10.dbf' size 10G;
alter tablespace ts_counsel add datafile 'E:\TmaxData\tibero6\database\tibero\counsel_11.dbf' size 10G;
alter tablespace ts_counsel add datafile 'E:\TmaxData\tibero6\database\tibero\counsel_12.dbf' size 10G;
alter tablespace ts_counsel add datafile 'E:\TmaxData\tibero6\database\tibero\counsel_13.dbf' size 10G;
create user counsel identified by counsel default tablespace ts_counsel temporary tablespace temp;
grant dba to counsel;

create tablespace ts_kdream datafile 'E:\TmaxData\tibero6\database\tibero\kdream_01.dbf' size 10G;
alter tablespace ts_kdream add datafile 'E:\TmaxData\tibero6\database\tibero\kdream_02.dbf' size 10G;
alter tablespace ts_kdream add datafile 'E:\TmaxData\tibero6\database\tibero\kdream_03.dbf' size 10G;
alter tablespace ts_kdream add datafile 'E:\TmaxData\tibero6\database\tibero\kdream_04.dbf' size 10G;
alter tablespace ts_kdream add datafile 'E:\TmaxData\tibero6\database\tibero\kdream_05.dbf' size 10G;
alter tablespace ts_kdream add datafile 'E:\TmaxData\tibero6\database\tibero\kdream_06.dbf' size 10G;
alter tablespace ts_kdream add datafile 'E:\TmaxData\tibero6\database\tibero\kdream_07.dbf' size 10G;
alter tablespace ts_kdream add datafile 'E:\TmaxData\tibero6\database\tibero\kdream_08.dbf' size 10G;
alter tablespace ts_kdream add datafile 'E:\TmaxData\tibero6\database\tibero\kdream_09.dbf' size 10G;
create user kdream identified by kdream default tablespace ts_kdream temporary tablespace temp;
grant dba to kdream;

create tablespace ts_ps01dba datafile 'D:\TmaxData\tibero6\database\tibero\ps01dba_01.dbf' size 3G;
create user ps01dba identified by ps01dba default tablespace ts_ps01dba temporary tablespace temp;
grant dba to ps01dba;

create tablespace ts_care datafile 'E:\TmaxData\tibero6\database\tibero\care_01.dbf' size 3G;
create user care identified by care default tablespace ts_care temporary tablespace temp;
grant dba to care;

create tablespace ts_dream datafile 'E:\TmaxData\tibero6\database\tibero\dream_01.dbf' size 3G;
create user dream identified by dream default tablespace ts_dream temporary tablespace temp;
grant dba to dream;

create tablespace ts_simter datafile 'E:\TmaxData\tibero6\database\tibero\simter_01.dbf' size 10G;
alter tablespace ts_simter add datafile 'E:\TmaxData\tibero6\database\tibero\simter_02.dbf' size 10G;
create user simter identified by simter default tablespace ts_simter temporary tablespace temp;
grant dba to simter;

-- 미사용법적보관용
create tablespace ts_u_counsel datafile 'E:\TmaxData\tibero6\database\tibero\u_counsel_01.dbf' size 10G;
create user u_counsel identified by u_counsel default tablespace ts_u_counsel temporary tablespace temp;
grant dba to u_counsel;

create tablespace ts_u_sim datafile 'E:\TmaxData\tibero6\database\tibero\u_sim_01.dbf' size 2G;
create user u_sim identified by u_sim default tablespace ts_u_sim temporary tablespace temp;
grant dba to u_sim;

create tablespace ts_u_jikimi datafile 'E:\TmaxData\tibero6\database\tibero\u_jikimi_01.dbf' size 3G;
create user u_jikimi identified by u_jikimi default tablespace ts_u_jikimi temporary tablespace temp;
grant dba to u_jikimi;

create tablespace ts_u_counsel2 datafile 'E:\TmaxData\tibero6\database\tibero\u_counsel2_01.dbf' size 1G;
create user u_counsel2 identified by u_counsel2 default tablespace ts_u_counsel2 temporary tablespace temp;
grant dba to u_counsel2;

create tablespace ts_u_sim01 datafile 'E:\TmaxData\tibero6\database\tibero\u_sim01_01.dbf' size 5G;
create user u_sim01 identified by u_sim01 default tablespace ts_u_sim01 temporary tablespace temp;
grant dba to u_sim01;

create tablespace ts_u_sim02 datafile 'E:\TmaxData\tibero6\database\tibero\u_sim02_01.dbf' size 1G;
create user u_sim02 identified by u_sim02 default tablespace ts_u_sim02 temporary tablespace temp;
grant dba to u_sim02;


-- 1-2. MSSQL
create tablespace ts_newweb datafile 'E:\TmaxData\tibero6\database\tibero\newweb_01.dbf' size 10G;
create user newweb identified by newweb default tablespace ts_newweb temporary tablespace temp;
create user newweb_dbo identified by newweb_dbo default tablespace ts_newweb temporary tablespace temp;
grant dba to newweb;

create tablespace ts_chatting datafile 'E:\TmaxData\tibero6\database\tibero\chatting_01.dbf' size 10G;
alter tablespace ts_chatting add datafile 'E:\TmaxData\tibero6\database\tibero\chatting_02.dbf' size 10G;
alter tablespace ts_chatting add datafile 'E:\TmaxData\tibero6\database\tibero\chatting_03.dbf' size 10G;
create user chatting identified by chatting default tablespace ts_chatting temporary tablespace temp;
create user chatting_dbo identified by chatting_dbo default tablespace ts_chatting temporary tablespace temp;
grant dba to chatting;

create tablespace ts_hrddb datafile 'E:\TmaxData\tibero6\database\tibero\hrdDb_01.dbf' size 100M;
create user hrddb_dbo identified by hrddb_dbo default tablespace ts_hrddb temporary tablespace temp;
grant dba to hrddb_dbo;

create tablespace ts_education datafile 'D:\TmaxData\tibero6\database\tibero\education_01.dbf' size 100M;
create user education_dbo identified by education_dbo default tablespace ts_education temporary tablespace temp;
grant dba to education_dbo;

-- 1-3. Maria
create tablespace ts_rbyouth datafile 'E:\TmaxData\tibero6\database\tibero\rbyouth_01.dbf' size 200M;
create user rbyouth identified by rbyouth default tablespace ts_rbyouth temporary tablespace temp;
grant dba to rbyouth;


-- 2. DBLink 생성
drop database link ms_newweb;
create database link ms_newweb connect to sa identified by 'P@ssw0rd' using 'ms_newweb';

drop database link ms_chatting;
create database link ms_chatting connect to sa identified by 'P@ssw0rd' using 'ms_chatting';

drop database link ms_hrdDb;
create database link ms_hrdDb connect to sa identified by 'P@ssw0rd' using 'ms_hrdDb';

drop database link ms_education;
create database link ms_education connect to sa identified by 'P@ssw0rd' using 'ms_education';

drop database link ora_cysnet;
create database link ora_cysnet connect to system identified by 's' using 'ora_cysnet';

drop database link ora_orcl;
create database link ora_orcl connect to system identified by 's' using 'ora_orcl';

drop database link my_maria;
create database link my_maria connect to 'root' identified by 'P@ssw0rd' using 'my_maria';

-- asis직접접속 DBLink
drop database link bs_ms_newweb;
create database link bs_ms_newweb connect to metabuild identified by 'apxkqlfem1@' using 'bs_ms_newweb';

drop database link bs_ms_chatting;
create database link bs_ms_chatting connect to metabuild identified by 'apxkqlfem1@' using 'bs_ms_chatting';

drop database link bs_ms_hrdDb;
create database link bs_ms_hrdDb connect to metabuild identified by 'metabuild' using 'bs_ms_hrdDb';

drop database link bs_ms_education;
create database link bs_ms_education connect to metabuild identified by 'metabuild' using 'bs_ms_education';

drop database link bs_ora_cysnet;
create database link bs_ora_cysnet connect to metabuild identified by 'metabuild' using 'bs_ora_cysnet';

drop database link bs_ora_orcl;
create database link bs_ora_orcl connect to metabuild identified by 'metabuild' using 'bs_ora_orcl';

drop database link bs_my_maria;
create database link bs_my_maria connect to metabuild identified by 'metabuild' using 'bs_my_maria';

-- tobe 운영 DBLink 생성
drop database link tb_idbs;
create database link tb_idbs connect to sys identified by 'mogef123!sys' using 'tb_idbs';

drop database link tb_oldb;
create database link tb_oldb connect to sys identified by 'mogef123!sys' using 'tb_oldb';

drop database link tb_edbs;
create database link tb_edbs connect to sys identified by 'mogef123!sys' using 'tb_edbs';


-- DBLink 접속테스트
select * from dual@ora_cysnet;
select * from dual@ora_orcl;
select * from newweb.b1@ms_newweb;
select * from chatting.a4@ms_chatting;
select * from dbo.DFT011TL@ms_hrdDb;
select * from rbyouth.menu@my_maria;

-- CTAS결과확인
select count(1) from dba_tables where owner = 'COUNSEL';
select count(1) from dba_tables where owner = 'KDREAM';
select count(1) from dba_tables where owner = 'CARE';
select count(1) from dba_tables where owner = 'DREAM';
select count(1) from dba_tables where owner = 'SIMTER';
select count(1) from dba_tables where owner = 'U_COUNSEL';
select count(1) from dba_tables where owner = 'U_SIM';
select count(1) from dba_tables where owner = 'U_JIKIMI';
select count(1) from dba_tables where owner = 'U_COUNSEL2';
select count(1) from dba_tables where owner = 'U_SIM01';
select count(1) from dba_tables where owner = 'U_SIM02';
select count(1) from dba_tables where owner = 'NEWWEB_DBO';
select count(1) from dba_tables where owner = 'NEWWEB';
select count(1) from dba_tables where owner = 'CHATTING_DBO';
select count(1) from dba_tables where owner = 'CHATTING';
select count(1) from dba_tables where owner = 'HRDDB_DBO';
select count(1) from dba_tables where owner = 'RBYOUTH';

select * from rbyouth.APPROVAL;

create table COUNSEL.CYS_COUNS_MST_STAT                   as select * from COUNSEL.CYS_COUNS_MST_STAT@ora_cysnet;
create table COUNSEL.CYS_COUNS_MST_R                      as select * from COUNSEL.CYS_COUNS_MST_R@ora_cysnet;;

SELECT * FROM DBA_USERS WHERE USERNAME IN ('CARE','DREAM','SIMTER','U_COUNSEL','U_SIM','U_JIKIMI','U_COUNSEL2','U_SIM01','U_SIM02','NEWWEB_DBO','NEWWEB','CHATTING_DBO','CHATTING','HRDDB_DBO')



-- 마리아서비스 안죽을때 taskkill /F /FI "SERVICES eq TBGatewayMaria"

-- 컨버전 공간
create tablespace ts_mig datafile 'D:\TmaxData\tibero6\database\tibero\mig_01.dbf' size 10G;
alter tablespace ts_mig add datafile 'D:\TmaxData\tibero6\database\tibero\mig_02.dbf' size 10G;
alter tablespace ts_mig add datafile 'D:\TmaxData\tibero6\database\tibero\mig_03.dbf' size 10G;
alter tablespace ts_mig add datafile 'D:\TmaxData\tibero6\database\tibero\mig_04.dbf' size 10G;
alter tablespace ts_mig add datafile 'D:\TmaxData\tibero6\database\tibero\mig_05.dbf' size 10G;
alter tablespace ts_mig add datafile 'D:\TmaxData\tibero6\database\tibero\mig_06.dbf' size 10G;
alter tablespace ts_mig add datafile 'D:\TmaxData\tibero6\database\tibero\mig_07.dbf' size 10G;
alter tablespace ts_mig add datafile 'D:\TmaxData\tibero6\database\tibero\mig_08.dbf' size 10G;
alter tablespace ts_mig add datafile 'D:\TmaxData\tibero6\database\tibero\mig_09.dbf' size 10G;
create user mig identified by mig default tablespace ts_mig temporary tablespace temp;
grant dba to mig;