-- 1차이관에러

-- TBR-5114: Invalid fractional second value '-1178470736': must be an integer between 0 and 999999999.
create table newweb.RCT250TL as select * from newweb.RCT250TL@ms_newweb where 1=2;
alter table newweb.rct250tl modify RCT250_ISRT_DT date;
alter table newweb.RCT250TL modify "rct250IsEscape" varchar2(1000);
alter table newweb.RCT250TL modify "rct250IsMOrient" varchar2(1000);
alter table newweb.RCT250TL modify "rct250IsSingleP" varchar2(1000);
alter table newweb.RCT250TL modify "rct250IsLower" varchar2(1000);
insert into newweb.RCT250TL select * from newweb.RCT250TL@ms_newweb;
commit;

create table newweb.Copy_RCT250TL_20201007_10_00 as select * from newweb.Copy_RCT250TL_20201007_10_00@ms_newweb where 1=2;
alter table newweb.Copy_RCT250TL_20201007_10_00 modify RCT250_ISRT_DT date;
alter table newweb.Copy_RCT250TL_20201007_10_00 modify "RCT250_FILE_CD" varchar2(1000);
alter table newweb.Copy_RCT250TL_20201007_10_00 modify "RCT250_REQUEST_STATE" varchar2(1000);
alter table newweb.Copy_RCT250TL_20201007_10_00 modify "RCT250_RESULT_1" varchar2(1000);
alter table newweb.Copy_RCT250TL_20201007_10_00 modify "RCT250_RESULT_2" varchar2(1000);
alter table newweb.Copy_RCT250TL_20201007_10_00 modify "RCT250_RESULT_3" varchar2(1000);
alter table newweb.Copy_RCT250TL_20201007_10_00 modify "RCT250_DEGREE" varchar2(1000);
alter table newweb.Copy_RCT250TL_20201007_10_00 modify "RCT250_TERM_DT" varchar2(1000);
alter table newweb.Copy_RCT250TL_20201007_10_00 modify "RCT250_IS_LTP" varchar2(1000);
alter table newweb.Copy_RCT250TL_20201007_10_00 modify "RCT250_LC" varchar2(1000);
alter table newweb.Copy_RCT250TL_20201007_10_00 modify "RCT250_AGE_TERM" varchar2(1000);
alter table newweb.Copy_RCT250TL_20201007_10_00 modify "RCT250_APL_SEQ" varchar2(1000);
insert into newweb.Copy_RCT250TL_20201007_10_00 select * from newweb.Copy_RCT250TL_20201007_10_00@ms_newweb;
commit;

--괄호때문에 생성안됨
create table newweb_dbo."cyber1388_school(20030422)" as select * from dbo."CYBER1388_SCHOOL(20030422)"@ms_newweb;


--TBR-5079: Data type length is out of range.
-- 바이너리 강제생성
create table newweb_dbo.webpds35 (
	wp_id number,
	wp_b_id number,
	wp_tb varchar(100),
	wp_code varchar(100),
	wp_filename varchar(1000),
	wp_filesize number,
	wp_date date,
	wp_down number,
	wp_binaryYN varchar(10),
	wp_binaryData blob
);

insert into newweb_dbo.webpds35 select * from dbo.webpds35@ms_newweb;
commit;

create table newweb_dbo.admin
(
	idx number,
	mem_id varchar(100),
	mem_name varchar(100),
	nickname varchar(100),
	mem_pwd blob,
	mem_jumin1 blob,
	mem_jumin2 blob,
	mem_tel1 varchar(100),
	mem_tel2 varchar(100),
	mem_tel3 varchar(100),
	mem_hp1 varchar(100),
	mem_hp2 varchar(100),
	mem_hp3 varchar(100),
	mem_email varchar(1000),
	mem_role varchar(100),
	mem_menu varchar(100),
	mem_holi_use varchar(100),
	mem_holi_limit varchar(100),
	mem_useyn varchar(100),
	mem_regdate date,
	mem_party number,
	mem_major varchar(100),
	mem_certi varchar(1000),
	report_flag varchar(100),
	pw_chk number
);
insert into newweb_dbo.admin select * from dbo.admin@ms_newweb;
commit;

-- 티베로버그. (NUMBER형을 별도로 CTAS후 업뎃함)
create table newweb_dbo.UploadFile1_number as select "id", "filesize" from dbo.uploadfile1@ms_newweb;
--drop table newweb_dbo.UploadFile1;
create table newweb_dbo.UploadFile1
(
   id number,
   filename varchar(1000),
   filedata blob,
   filesize number,
   filedate date,
   filename1 varchar(65532),
   filename2 varchar(65532)
);
insert into newweb_dbo.uploadfile1
(
id,
filename,
filedata,
--filesize,
filedate,
filename1,
filename2
)
select
"id",
"filename",
"filedata",
--"filesize",
"filedate",
"filename1",
"filename2"
from dbo.uploadfile1@ms_newweb;
update newweb_dbo.uploadfile1 x
set
x.filesize = (select y."filesize" from newweb_dbo.uploadfile1_number y where y."id" = x.id and rownum = 1);
commit;
drop table newweb_dbo.UploadFile1_number;


-- Generic I/O Error
-- 티베로버그. (NUMBER형을 별도로 CTAS후 업뎃함)
create table newweb.TB_INFO_MANAGEMENT_NUMBER as select "info_key", "ord_seq" from newweb.TB_INFO_MANAGEMENT@ms_newweb;
--drop table newweb.TB_INFO_MANAGEMENT;
create table newweb.TB_INFO_MANAGEMENT
(
 info_key                                 VARCHAR(6)
,info_kind                                VARCHAR(45)
,info_div                                 VARCHAR(45)
,subject                                  VARCHAR(450)
,open_cycle                               VARCHAR(45)
,open_time                                VARCHAR(75)
,open_method                              VARCHAR(45)
,link_url                                 VARCHAR(8000)
,depart                                   VARCHAR(75)
,charge                                   VARCHAR(45)
,phone                                    VARCHAR(45)
,bookmark                                 VARCHAR(2)
,uflag                                    VARCHAR(2)
,contents                                 CLOB
,ord_seq                                  NUMBER(10)
);
insert into newweb.TB_INFO_MANAGEMENT (
 info_key
,info_kind
,info_div
,subject
,open_cycle
,open_time
,open_method
,link_url
,depart
,charge
,phone
,bookmark
,uflag
,contents
--,ord_seq
)
select "info_key"
,"info_kind"
,"info_div"
,"subject"
,"open_cycle"
,"open_time"
,"open_method"
,"link_url"
,"depart"
,"charge"
,"phone"
,"bookmark"
,"uflag"
,"contents"
--,"ord_seq"
from newweb.TB_INFO_MANAGEMENT@ms_newweb;
update newweb.TB_INFO_MANAGEMENT x
set
x.ord_seq = (select y."ord_seq" from newweb.TB_INFO_MANAGEMENT_NUMBER y where y."info_key" = x.info_key and rownum = 1);
commit;
drop table newweb.TB_INFO_MANAGEMENT_NUMBER;

create table newweb.USD100TL_NUMBER as select USD100_SEQ, USD100_HITS from newweb.USD100TL@ms_newweb;
--drop table newweb.USD100TL;
create table newweb.USD100TL
(
 USD100_SEQ                               NUMBER(10)
,USD100_SUBJECT                           VARCHAR(1500)
,USD100_CONTENT                           CLOB
,USD100_SOURCE                            VARCHAR(8000)
,USD100_SERVICE_DIV                       VARCHAR(1500)
,USD100_SUPPORT_DIV                       VARCHAR(1000)
,USD100_LOCATION_DIV                      VARCHAR(1500)
,USD100_KEYWORD                           VARCHAR(3000)
,USD100_USER_ID                           VARCHAR(1000)
,USD100_USER_NAME                         VARCHAR(1000)
,USD100_ISRT_DT                           DATE
,USD100_UPDT_DT                           DATE
,USD100_HITS                              NUMBER(5)
,USD100_SERVICE_GP_DIV                    VARCHAR(1000)
,USD100_OPEN                              VARCHAR(1000)
,USD100_MEMO                              VARCHAR(3000)
);
insert into newweb.USD100TL
(
 USD100_SEQ
,USD100_SUBJECT
,USD100_CONTENT
,USD100_SOURCE
,USD100_SERVICE_DIV
,USD100_SUPPORT_DIV
,USD100_LOCATION_DIV
,USD100_KEYWORD
,USD100_USER_ID
,USD100_USER_NAME
,USD100_ISRT_DT
,USD100_UPDT_DT
--,USD100_HITS
,USD100_SERVICE_GP_DIV
,USD100_OPEN
,USD100_MEMO
)
select  USD100_SEQ
,USD100_SUBJECT
,USD100_CONTENT
,USD100_SOURCE
,USD100_SERVICE_DIV
,USD100_SUPPORT_DIV
,USD100_LOCATION_DIV
,USD100_KEYWORD
,USD100_USER_ID
,USD100_USER_NAME
,USD100_ISRT_DT
,USD100_UPDT_DT
--,USD100_HITS
,USD100_SERVICE_GP_DIV
,USD100_OPEN
,USD100_MEMO
from newweb.USD100TL@ms_newweb;
commit;
update newweb.USD100TL x
set
x.USD100_HITS = (select y.USD100_HITS from newweb.USD100TL_NUMBER y where y.USD100_SEQ = x.USD100_SEQ and rownum = 1);
commit;
drop table newweb.USD100TL_NUMBER;

create table newweb_dbo.TB_BOARD_NUMBER as select "boIdx","boIdxMax","boReadNumber","boRef","boReStep","boReLevel","boTotalFileSize","boNoticeIsUse","boOpenClose","boResourcesUseNumber","boApproval","boIsDelete","boReplyEmailIsReceive","boIsSecret","boSoIdx","boJob" from dbo.TB_BOARD@ms_newweb;
--drop table newweb_dbo.TB_BOARD;
create table newweb_dbo.TB_BOARD
(
 boIdx                                    NUMBER(10)
,boIdxMax                                 NUMBER(10)
,boOneCode                                VARCHAR(1000)
,boTwoCode                                VARCHAR(1000)
,boThreeCode                              VARCHAR(1000)
,boName                                   VARCHAR(1000)
,boToName                                 VARCHAR(8000)
,boId                                     VARCHAR(1000)
,boReplyId                                VARCHAR(1000)
,boTitle                                  VARCHAR(1000)
,boPassword                               VARCHAR(1000)
,boCreateDate                             DATE
,boReadNumber                             NUMBER(10)
,boRef                                    NUMBER(10)
,boReStep                                 NUMBER(10)
,boReLevel                                NUMBER(10)
,boContents                               CLOB
,boFileName                               VARCHAR(8000)
,boFileName2                              VARCHAR(1000)
,boFileSize                               VARCHAR(1000)
,boFileSize2                              VARCHAR(1000)
,boFileMemo                               VARCHAR(1000)
,boTotalFileSize                          NUMBER(10)
,boAbcBoardCode                           VARCHAR(1000)
,boNoticeIsUse                            NUMBER(1)
,boOpenClose                              NUMBER(5)
,boResources                              VARCHAR(1000)
,boResourcesUseNumber                     NUMBER(5)
,boStartReserveDate                       DATE
,boLastReserveDate                        DATE
,boStartReserveTime                       VARCHAR(1000)
,boLastReserveTime                        VARCHAR(1000)
,boApproval                               NUMBER(1)
,boIsDelete                               NUMBER(5)
,boRefortCode                             VARCHAR(1000)
,boEmail                                  VARCHAR(1000)
,boReplyEmailIsReceive                    NUMBER(1)
,boIsSecret                               NUMBER(1)
,boSoIdx                                  NUMBER(10)
,boNoticeStartDate                        DATE
,boNoticeEndDate                          DATE
,boJob                                    NUMBER(10)
,boProgramCode                            VARCHAR(1000)
,boTeamName                               VARCHAR(1000)
);
insert into newweb_dbo.TB_BOARD
(
 boIdx
,boIdxMax
,boOneCode
,boTwoCode
,boThreeCode
,boName
,boToName
,boId
,boReplyId
,boTitle
,boPassword
,boCreateDate
--,boReadNumber
--,boRef
--,boReStep
--,boReLevel
,boContents
,boFileName
,boFileName2
,boFileSize
,boFileSize2
,boFileMemo
--,boTotalFileSize
,boAbcBoardCode
--,boNoticeIsUse
--,boOpenClose
,boResources
--,boResourcesUseNumber
,boStartReserveDate
,boLastReserveDate
,boStartReserveTime
,boLastReserveTime
--,boApproval
--,boIsDelete
,boRefortCode
,boEmail
--,boReplyEmailIsReceive
--,boIsSecret
--,boSoIdx
,boNoticeStartDate
,boNoticeEndDate
--,boJob
,boProgramCode
,boTeamName
)
select  "boIdx"
,"boIdxMax"
,"boOneCode"
,"boTwoCode"
,"boThreeCode"
,"boName"
,"boToName"
,"boId"
,"boReplyId"
,"boTitle"
,"boPassword"
,"boCreateDate"
--,"boReadNumber"
--,"boRef"
--,"boReStep"
--,"boReLevel"
,"boContents"
,"boFileName"
,"boFileName2"
,"boFileSize"
,"boFileSize2"
,"boFileMemo"
--,"boTotalFileSize"
,"boAbcBoardCode"
--,"boNoticeIsUse"
--,"boOpenClose"
,"boResources"
--,"boResourcesUseNumber"
,"boStartReserveDate"
,"boLastReserveDate"
,"boStartReserveTime"
,"boLastReserveTime"
--,"boApproval"
--,"boIsDelete"
,"boRefortCode"
,"boEmail"
--,"boReplyEmailIsReceive"
--,"boIsSecret"
--,"boSoIdx"
,"boNoticeStartDate"
,"boNoticeEndDate"
--,"boJob"
,"boProgramCode"
,"boTeamName"
from dbo.TB_BOARD@ms_newweb;
update newweb_dbo.TB_BOARD x
set
 x.boReadNumber          = (select y."boReadNumber"           from newweb_dbo.TB_BOARD_NUMBER y where y."boIdx" = x.boIdx and rownum = 1)
,x.boRef                 = (select y."boRef"                  from newweb_dbo.TB_BOARD_NUMBER y where y."boIdx" = x.boIdx and rownum = 1)
,x.boReStep              = (select y."boReStep"               from newweb_dbo.TB_BOARD_NUMBER y where y."boIdx" = x.boIdx and rownum = 1)
,x.boReLevel             = (select y."boReLevel"              from newweb_dbo.TB_BOARD_NUMBER y where y."boIdx" = x.boIdx and rownum = 1)
,x.boTotalFileSize       = (select y."boTotalFileSize"        from newweb_dbo.TB_BOARD_NUMBER y where y."boIdx" = x.boIdx and rownum = 1)
,x.boNoticeIsUse         = (select y."boNoticeIsUse"          from newweb_dbo.TB_BOARD_NUMBER y where y."boIdx" = x.boIdx and rownum = 1)
,x.boOpenClose           = (select y."boOpenClose"            from newweb_dbo.TB_BOARD_NUMBER y where y."boIdx" = x.boIdx and rownum = 1)
,x.boResourcesUseNumber  = (select y."boResourcesUseNumber"   from newweb_dbo.TB_BOARD_NUMBER y where y."boIdx" = x.boIdx and rownum = 1)
,x.boApproval            = (select y."boApproval"             from newweb_dbo.TB_BOARD_NUMBER y where y."boIdx" = x.boIdx and rownum = 1)
,x.boIsDelete            = (select y."boIsDelete"             from newweb_dbo.TB_BOARD_NUMBER y where y."boIdx" = x.boIdx and rownum = 1)
,x.boReplyEmailIsReceive = (select y."boReplyEmailIsReceive"  from newweb_dbo.TB_BOARD_NUMBER y where y."boIdx" = x.boIdx and rownum = 1)
,x.boIsSecret            = (select y."boIsSecret"             from newweb_dbo.TB_BOARD_NUMBER y where y."boIdx" = x.boIdx and rownum = 1)
,x.boSoIdx               = (select y."boSoIdx"                from newweb_dbo.TB_BOARD_NUMBER y where y."boIdx" = x.boIdx and rownum = 1)
,x.boJob                 = (select y."boJob"                  from newweb_dbo.TB_BOARD_NUMBER y where y."boIdx" = x.boIdx and rownum = 1);
commit;
drop table newweb_dbo.TB_BOARD_NUMBER;

create table newweb_dbo.tb_knowledge_information_number as select "kiIdx","kiDivision" from dbo.tb_knowledge_information@ms_newweb;
--drop table newweb_dbo.tb_knowledge_information;
create table newweb_dbo.tb_knowledge_information
(
 kiIdx                                    NUMBER(10)
,kiId                                     VARCHAR(1000)
,kiName                                   VARCHAR(1000)
,kiSubject                                VARCHAR(1500)
,kiContent                                CLOB
,kiFileCode                               VARCHAR(1500)
,kiCreateDate                             DATE
,kiDivision                               NUMBER(5)
,kiMenuType                               VARCHAR(1000)
);
insert into newweb_dbo.tb_knowledge_information
(
 kiIdx
,kiId
,kiName
,kiSubject
,kiContent
,kiFileCode
,kiCreateDate
--,kiDivision
,kiMenuType
)
select
 "kiIdx"
,"kiId"
,"kiName"
,"kiSubject"
,"kiContent"
,"kiFileCode"
,"kiCreateDate"
--,"kiDivision"
,"kiMenuType"
from dbo.tb_knowledge_information@ms_newweb;
update newweb_dbo.tb_knowledge_information x
set
x.kiDivision = (select y."kiDivision" from newweb_dbo.tb_knowledge_information_number y where y."kiIdx" = x.kiIdx and rownum = 1);
commit;
drop table newweb_dbo.tb_knowledge_information_number;

create table newweb.TBL_OUTREACH as select * from newweb.TBL_OUTREACH@ms_newweb where 1=2 union select * from newweb.TBL_OUTREACH@ms_newweb where 1=2;
alter table NEWWEB.TBL_OUTREACH modify "kiOutMethod"  varchar(1000);
alter table NEWWEB.TBL_OUTREACH modify "kiSns"  varchar(1000);
alter table NEWWEB.TBL_OUTREACH modify "kiProblemArea"  varchar(1000);
alter table NEWWEB.TBL_OUTREACH modify "kiWorkingTime"  varchar(1000);
alter table NEWWEB.TBL_OUTREACH modify "ListDel"  varchar(1000);
alter table NEWWEB.TBL_OUTREACH modify "kiFileCode"  varchar(1000);
alter table NEWWEB.TBL_OUTREACH modify "kiProblemArea"  varchar(1000);
insert into newweb.TBL_OUTREACH select * from newweb.TBL_OUTREACH@ms_newweb;
commit;

-- 2차이관 에러
create table newweb_dbo.CYS_MENU_MASTER as select * from dbo.CYS_MENU_MASTER@ms_newweb where 1=2;
alter table newweb_dbo."CYS_MENU_MASTER" modify "Edit_ID" varchar2(1000);
insert into newweb_dbo."CYS_MENU_MASTER" select * from dbo.CYS_MENU_MASTER@ms_newweb;
commit;

create table newweb_dbo.SHELTER_MENU_MASTER as select * from dbo.SHELTER_MENU_MASTER@ms_newweb where 1=2;
alter table newweb_dbo."SHELTER_MENU_MASTER" modify "Edit_ID" varchar2(1000);
insert into newweb_dbo."SHELTER_MENU_MASTER" select * from dbo.SHELTER_MENU_MASTER@ms_newweb;
commit;

create table newweb_dbo.SHELTER_MENU_MASTER_B as select * from dbo.SHELTER_MENU_MASTER_B@ms_newweb where 1=2;
alter table newweb_dbo."SHELTER_MENU_MASTER_B" modify "Edit_ID" varchar2(1000);
insert into newweb_dbo."SHELTER_MENU_MASTER_B" select * from dbo.SHELTER_MENU_MASTER_B@ms_newweb;
commit;

