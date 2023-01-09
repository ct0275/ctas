-- CTAS문 생성
--select concat('CREATE TABLE ', b.table_schema, '.', b.table_name, ' AS SELECT * FROM ', b.table_schema, '.', b.table_name, ';') from INFORMATION_SCHEMA.TABLES b where table_schema = 'rbyouth';

-- << MariaDB에서 이관을 위한 ASIS정제 >>
-- MariaDB도 현재 12층 윈도우서버에 ASIS복제본이 있음
-- 추후 광주센터에 MS윈도우이관서버구축시 해당서버에서 아니면 DBLink로 Legacy 직접 붙어서 이관시 Legacy에서 실행요

-- Case 1.TBR-5111: NUMBER exceeds given precision. (n:37206540928684, p:11, s:0)
-- 추출쿼리 bigint형 20자리수로 강제업데이트
select concat('alter table ', table_schema, '.', table_name, ' modify ', column_name, ' bigint(20);')
from INFORMATION_SCHEMA.COLUMNS where data_type like 'bigint%' and table_schema = 'rbyouth' and column_type != 'bigint(20)';

-- Case 2. TBR-11048: "RBYOUTH"."BUSINESSASSIGN"."BaCareer" The value is too large for the column. (Actual value: 268, Maximum value: 200)
alter table RBYOUTH.BUSINESSASSIGN  modify BaCareer varchar(1000);
alter table RBYOUTH.BUSINESSPLAN    modify ProgramEvChk varchar(1000);
alter table RBYOUTH.LECTUREPLAN     modify LectureGoal varchar(1000);
alter table RBYOUTH.LECTUREPLANSUB  modify LpdContents varchar(1000);
alter table RBYOUTH.PUBLICIZEPLAN   modify PrMethod varchar(1000);
alter table RBYOUTH.BUSINESSPLAN    modify EduEvChk varchar(1000);
alter table RBYOUTH.LECTUREPLAN     modify CourseNm varchar(1000);
alter table RBYOUTH.LECTUREPLANSUB  modify Materials varchar(1000);
alter table RBYOUTH.BUSINESSPLAN    modify StudentManage varchar(1000);
alter table RBYOUTH.BUSINESSPLAN    modify TeacherManage varchar(1000);
alter table RBYOUTH.BUSINESSPLAN    modify BpPurpose varchar(1000);

alter table RBYOUTH.APPROVAL        modify ResCmmt varchar(4000);
alter table RBYOUTH.BUSINESSASSIGN  modify Charge varchar(1000);
alter table RBYOUTH.BUSINESSPLAN    modify BpCn varchar(1000);
alter table RBYOUTH.BUSINESSPLAN    modify EtcChgManage varchar(1000);

-- 오라클이 CLOB변형에 48시간 초과됨, 이관DB는 그냥 949로....
-- ASIS 문자열 크기 강제업데이트 (캐릭터셋)
--select concat('ALTER TABLE ', b.table_schema, '.', b.table_name, ' MODIFY COLUMN ', b.column_name, ' varchar(',  round(CHARACTER_MAXIMUM_LENGTH * 1.5, 0), ');')
--from INFORMATION_SCHEMA.TABLES A, INFORMATION_SCHEMA.COLUMNS B
--where A.TABLE_CATALOG = B.TABLE_CATALOG  AND A.TABLE_SCHEMA = B.TABLE_SCHEMA  AND A.TABLE_NAME = B.TABLE_NAME and A.TABLE_TYPE != 'VIEW' and B.data_type like '%char%' and a.table_schema = 'rbyouth';
