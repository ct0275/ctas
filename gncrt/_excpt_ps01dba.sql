create table ps01dba.expl(
EXPLID NUMBER,
CAT3ID NUMBER,
EXPLSSANG varchar2(100),
EXPLCONT LONG raw
);

insert into ps01dba.expl select * from ps01dba.expl@ora_cysnet
commit;

create table ps01dba.CONRINFO(
CRIID NUMBER,
BKID NUMBER,
CRIMID varchar2(100),
CRIPATTERN varchar2(2000),
CRICONTENT LONG
);

insert into ps01dba.CONRINFO select * from ps01dba.CONRINFO@ora_cysnet
commit;


create table ps01dba.PROGUIDE(
PROGUIDEID NUMBER,
PROGUIDEINTRO long
);

insert into ps01dba.PROGUIDE select * from ps01dba.PROGUIDE@ora_cysnet
commit;

create table ps01dba.TEXPL(
EXPLID NUMBER,
CAT3ID NUMBER,
EXPLSSANG varchar2(60),
EXPLCONT long
);

insert into ps01dba.TEXPL select * from ps01dba.TEXPL@ora_cysnet
commit;














--나중에확인할것 select * from ps01dba.FORUM@ora_cysnet 만 해도 JDBC-130108:Invalid LONG column position. 에러남
--create table ps01dba.FORUM(
--NUM NUMBER,
--W_NAME varchar2(100),
--EMAIL varchar2(200),
--TITLE varchar2(300),
--W_DATE varchar2(150),
--VISITED NUMBER,
--PASSWD varchar2(100),
--CONTENTS LONG,
--REF NUMBER,
--STEP NUMBER,
--RE_LEVAL NUMBER,
--HOMEPAGE varchar2(100),
--FORUM_GUBUN varchar2(8),
--FORUM_ID varchar2(80)
--);
--
--insert into ps01dba.FORUM select * from ps01dba.FORUM@ora_cysnet
--commit;

--create table ps01dba.SITE(
--SITEID NUMBER,
--SRCAT varchar2(500),
--SITEMASTER varchar2(100),
--SITENAME varchar2(200),
--SITEURL varchar2(200),
--SRPATTERN varchar2(300),
--SITEMCONTENT varchar2(300),
--SITEDCONTENT LONG,
--SITEREGFLG varchar2(10),
--SITEFREE varchar2(10),
--SITERNAME varchar2(30),
--SITERPHONE varchar2(30),
--SITEREMAIL varchar2(50),
--SITEETC varchar2(5000),
--SITERDATE varchar2(50),
--SITEEDATE varchar2(50),
--CONFIRM_OAA varchar2(5)
--);
--
--insert into ps01dba.SITE select * from ps01dba.SITE@ora_cysnet
--commit;

--create table ps01dba.SUBANS(
--SUBANSID NUMBER,
--CHOID NUMBER,
--SUBANSEXMNO varchar2(10),
--SUBANSANS LONG,
--SUBANSPOINT number
--);
--
--insert into ps01dba.SUBANS select * from ps01dba.SUBANS@ora_cysnet
--commit;