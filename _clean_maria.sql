-- CTAS�� ����
--select concat('CREATE TABLE ', b.table_schema, '.', b.table_name, ' AS SELECT * FROM ', b.table_schema, '.', b.table_name, ';') from INFORMATION_SCHEMA.TABLES b where table_schema = 'rbyouth';

-- << MariaDB���� �̰��� ���� ASIS���� >>
-- MariaDB�� ���� 12�� �����켭���� ASIS�������� ����
-- ���� ���ּ��Ϳ� MS�������̰���������� �ش缭������ �ƴϸ� DBLink�� Legacy ���� �پ �̰��� Legacy���� �����

-- Case 1.TBR-5111: NUMBER exceeds given precision. (n:37206540928684, p:11, s:0)
-- �������� bigint�� 20�ڸ����� ����������Ʈ
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

-- ����Ŭ�� CLOB������ 48�ð� �ʰ���, �̰�DB�� �׳� 949��....
-- ASIS ���ڿ� ũ�� ����������Ʈ (ĳ���ͼ�)
--select concat('ALTER TABLE ', b.table_schema, '.', b.table_name, ' MODIFY COLUMN ', b.column_name, ' varchar(',  round(CHARACTER_MAXIMUM_LENGTH * 1.5, 0), ');')
--from INFORMATION_SCHEMA.TABLES A, INFORMATION_SCHEMA.COLUMNS B
--where A.TABLE_CATALOG = B.TABLE_CATALOG  AND A.TABLE_SCHEMA = B.TABLE_SCHEMA  AND A.TABLE_NAME = B.TABLE_NAME and A.TABLE_TYPE != 'VIEW' and B.data_type like '%char%' and a.table_schema = 'rbyouth';
