-- CTAS문 생성
--select 'CREATE TABLE ' + IIF(table_schema = 'dbo', 'newweb_dbo', table_schema) + '.' + table_name + ' AS SELECT * FROM ' + table_schema + '.' + table_name + ';'
--from INFORMATION_SCHEMA.TABLES where table_catalog = 'newweb' and table_schema in ('dbo', 'newweb') and TABLE_TYPE = 'BASE TABLE';
--select 'CREATE TABLE ' + IIF(table_schema = 'dbo', 'chatting_dbo', table_schema) + '.' + table_name + ' AS SELECT * FROM ' + table_schema + '.' + table_name + ';'
--from INFORMATION_SCHEMA.TABLES where table_catalog = 'chatting' and table_schema in ('dbo', 'chatting') and TABLE_TYPE = 'BASE TABLE';
--select 'CREATE TABLE ' + IIF(table_schema = 'dbo', 'hrddb_dbo', table_schema) + '.' + table_name + ' AS SELECT * FROM ' + table_schema + '.' + table_name + ';'
--from INFORMATION_SCHEMA.TABLES where table_catalog = 'hrdDb' and table_schema in ('dbo', 'hrdDb') and TABLE_TYPE = 'BASE TABLE';

-- << MSSQL에서 이관을 위한 ASIS정제 >>
-- MSSQL은 현재 12층 윈도우서버에 ASIS복제본이 있음
-- 중간 MS윈도우이관서버구축시 해당서버에서, DBLink로 Legacy 직접 붙어서 이관시 Legacy에서 실행요

-- Case 1. Generic I/O error

-- Case 2. TBR-10005: NOT NULL constraint violation ('NEWWEB'.'DBO_H_TAIL'.'userid').
-- newweb, chatting, hrdDb 스키마에서 각각 추출해서 이관DB에서 실행

-- 2.0 PK,FK,DEFAULT 제약조건삭제 (자료형강제업데이트 선행작업)
--select 'ALTER TABLE ' + B.TABLE_SCHEMA + '.' + B.TABLE_NAME + ' DROP CONSTRAINT ' + CONSTRAINT_NAME + ';'
--from INFORMATION_SCHEMA.TABLE_CONSTRAINTS B where constraint_type in ('PRIMARY KEY', 'FOREIGN KEY')
--union all
--select 'ALTER TABLE ' + schema_name(t.schema_id) + '.' + t.name + ' DROP CONSTRAINT "' + con.name + '";'
--from sys.default_constraints con
--left outer join sys.objects t
--on con.parent_object_id = t.object_id;

-- 2.1 ASIS 빈문자열 강제업데이트 (newweb, chatting, hrdDb)
-- CTAS할때 UNION ALL로 NOT NULL 제약조건 빼고 실행하도록 수정해서 주석처리함(4/14)
--select 'UPDATE ' + B.TABLE_SCHEMA + '.' + B.TABLE_NAME + ' SET ' + B.COLUMN_NAME + ' = convert(varchar(2), ' + char(39) + ' ' + char(39) + ') WHERE convert(varchar(2), ' + B.COLUMN_NAME + ') = ' + char(39) + char(39) + ';'
--from INFORMATION_SCHEMA.TABLES A, INFORMATION_SCHEMA.COLUMNS B
--where A.TABLE_CATALOG = B.TABLE_CATALOG  AND A.TABLE_SCHEMA = B.TABLE_SCHEMA  AND A.TABLE_NAME = B.TABLE_NAME  AND B.IS_NULLABLE = 'NO' and A.TABLE_TYPE != 'VIEW' and B.data_type like '%text'
--union all
--select 'UPDATE ' + B.TABLE_SCHEMA + '.' + B.TABLE_NAME + ' SET ' + B.COLUMN_NAME + ' = ' + char(39) + ' ' + char(39) + ' WHERE ' + B.COLUMN_NAME + ' = ' + char(39) + char(39) + ';'
--from INFORMATION_SCHEMA.TABLES A, INFORMATION_SCHEMA.COLUMNS B
--where A.TABLE_CATALOG = B.TABLE_CATALOG  AND A.TABLE_SCHEMA = B.TABLE_SCHEMA  AND A.TABLE_NAME = B.TABLE_NAME  AND B.IS_NULLABLE = 'NO' and A.TABLE_TYPE != 'VIEW' and B.data_type like '%char%';

--alter table NEWWEB.USD100TL alter column USD100_USER_NAME varchar(1000);
--alter table NEWWEB.TBL_OUTREACH alter column kiOutMethod varchar(1000);
--alter table NEWWEB.TBL_OUTREACH alter column kiSns varchar(1000);
--alter table NEWWEB.TBL_OUTREACH alter column kiProblemArea varchar(1000);
--alter table NEWWEB.TBL_OUTREACH alter column kiWorkingTime varchar(1000);
--alter table NEWWEB.TBL_OUTREACH alter column ListDel varchar(1000);
--alter table NEWWEB.TBL_OUTREACH alter column kiFileCode varchar(1000);
--alter table NEWWEB.TBL_OUTREACH alter column kiProblemArea varchar(1000);

-- 오라클이 CLOB변형에 48시간 초과됨, 이관DB는 949외에 방안없음
---- 2.2 ASIS 문자열 크기 강제업데이트 (캐릭터셋)
--select 'ALTER TABLE ' + B.TABLE_SCHEMA + '.' + B.TABLE_NAME + ' ALTER COLUMN "' + B.COLUMN_NAME + '" VARCHAR(' + IIF(CHARACTER_MAXIMUM_LENGTH < 0, '8000', str(round(CHARACTER_MAXIMUM_LENGTH * 1.5, 0))) + ');'
--from INFORMATION_SCHEMA.TABLES A, INFORMATION_SCHEMA.COLUMNS B
--where A.TABLE_CATALOG = B.TABLE_CATALOG  AND A.TABLE_SCHEMA = B.TABLE_SCHEMA  AND A.TABLE_NAME = B.TABLE_NAME and A.TABLE_TYPE != 'VIEW' and B.data_type like '%char%';
--
---- 2.2 ASIS TEXT자료형 NTEXT로 전환 (캐릭터셋)
--select 'ALTER TABLE ' + B.TABLE_SCHEMA + '.' + B.TABLE_NAME + ' ADD ' + B.COLUMN_NAME + '_ntext ntext;' + char(13) + char(10) +
--       'UPDATE ' + B.TABLE_SCHEMA + '.' + B.TABLE_NAME + ' SET ' + B.COLUMN_NAME + '_ntext = ' + B.COLUMN_NAME + ' WHERE '  + B.COLUMN_NAME + ' IS NOT NULL;' + char(13) + char(10) +
--       'ALTER TABLE ' + B.TABLE_SCHEMA + '.' + B.TABLE_NAME + ' DROP COLUMN ' + B.COLUMN_NAME + ';' + char(13) + char(10) +
--       'EXEC SP_RENAME ''' + B.TABLE_SCHEMA + '.' + B.TABLE_NAME + '.' +  B.COLUMN_NAME + '_ntext'', ''' + B.COLUMN_NAME + ''', ''COLUMN'';'
--from INFORMATION_SCHEMA.TABLES A, INFORMATION_SCHEMA.COLUMNS B
--where A.TABLE_CATALOG = B.TABLE_CATALOG  AND A.TABLE_SCHEMA = B.TABLE_SCHEMA  AND A.TABLE_NAME = B.TABLE_NAME and A.TABLE_TYPE != 'VIEW' and B.data_type = 'text';

-- Case 3. TBR-5114: Invalid fractional second value '-1178470736': must be an integer between 0 and 999999999.

-- Case 4. TBR-12126: Database link client API error "SecureDB"이나 사용자 정의 함수 또는 집계 "SecureDB.dbsec.DO_AUDIT"을(를) 찾을 수 없거나 이름이 불확실합니다.
-- ASIS에서 복호화 저장된 테이블을 별도로 제공하고, 이관하는 것으로 남용수팀장과 협의함.


