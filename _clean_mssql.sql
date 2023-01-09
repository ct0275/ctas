-- CTAS�� ����
--select 'CREATE TABLE ' + IIF(table_schema = 'dbo', 'newweb_dbo', table_schema) + '.' + table_name + ' AS SELECT * FROM ' + table_schema + '.' + table_name + ';'
--from INFORMATION_SCHEMA.TABLES where table_catalog = 'newweb' and table_schema in ('dbo', 'newweb') and TABLE_TYPE = 'BASE TABLE';
--select 'CREATE TABLE ' + IIF(table_schema = 'dbo', 'chatting_dbo', table_schema) + '.' + table_name + ' AS SELECT * FROM ' + table_schema + '.' + table_name + ';'
--from INFORMATION_SCHEMA.TABLES where table_catalog = 'chatting' and table_schema in ('dbo', 'chatting') and TABLE_TYPE = 'BASE TABLE';
--select 'CREATE TABLE ' + IIF(table_schema = 'dbo', 'hrddb_dbo', table_schema) + '.' + table_name + ' AS SELECT * FROM ' + table_schema + '.' + table_name + ';'
--from INFORMATION_SCHEMA.TABLES where table_catalog = 'hrdDb' and table_schema in ('dbo', 'hrdDb') and TABLE_TYPE = 'BASE TABLE';

-- << MSSQL���� �̰��� ���� ASIS���� >>
-- MSSQL�� ���� 12�� �����켭���� ASIS�������� ����
-- �߰� MS�������̰���������� �ش缭������, DBLink�� Legacy ���� �پ �̰��� Legacy���� �����

-- Case 1. Generic I/O error

-- Case 2. TBR-10005: NOT NULL constraint violation ('NEWWEB'.'DBO_H_TAIL'.'userid').
-- newweb, chatting, hrdDb ��Ű������ ���� �����ؼ� �̰�DB���� ����

-- 2.0 PK,FK,DEFAULT �������ǻ��� (�ڷ�������������Ʈ �����۾�)
--select 'ALTER TABLE ' + B.TABLE_SCHEMA + '.' + B.TABLE_NAME + ' DROP CONSTRAINT ' + CONSTRAINT_NAME + ';'
--from INFORMATION_SCHEMA.TABLE_CONSTRAINTS B where constraint_type in ('PRIMARY KEY', 'FOREIGN KEY')
--union all
--select 'ALTER TABLE ' + schema_name(t.schema_id) + '.' + t.name + ' DROP CONSTRAINT "' + con.name + '";'
--from sys.default_constraints con
--left outer join sys.objects t
--on con.parent_object_id = t.object_id;

-- 2.1 ASIS ���ڿ� ����������Ʈ (newweb, chatting, hrdDb)
-- CTAS�Ҷ� UNION ALL�� NOT NULL �������� ���� �����ϵ��� �����ؼ� �ּ�ó����(4/14)
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

-- ����Ŭ�� CLOB������ 48�ð� �ʰ���, �̰�DB�� 949�ܿ� ��Ⱦ���
---- 2.2 ASIS ���ڿ� ũ�� ����������Ʈ (ĳ���ͼ�)
--select 'ALTER TABLE ' + B.TABLE_SCHEMA + '.' + B.TABLE_NAME + ' ALTER COLUMN "' + B.COLUMN_NAME + '" VARCHAR(' + IIF(CHARACTER_MAXIMUM_LENGTH < 0, '8000', str(round(CHARACTER_MAXIMUM_LENGTH * 1.5, 0))) + ');'
--from INFORMATION_SCHEMA.TABLES A, INFORMATION_SCHEMA.COLUMNS B
--where A.TABLE_CATALOG = B.TABLE_CATALOG  AND A.TABLE_SCHEMA = B.TABLE_SCHEMA  AND A.TABLE_NAME = B.TABLE_NAME and A.TABLE_TYPE != 'VIEW' and B.data_type like '%char%';
--
---- 2.2 ASIS TEXT�ڷ��� NTEXT�� ��ȯ (ĳ���ͼ�)
--select 'ALTER TABLE ' + B.TABLE_SCHEMA + '.' + B.TABLE_NAME + ' ADD ' + B.COLUMN_NAME + '_ntext ntext;' + char(13) + char(10) +
--       'UPDATE ' + B.TABLE_SCHEMA + '.' + B.TABLE_NAME + ' SET ' + B.COLUMN_NAME + '_ntext = ' + B.COLUMN_NAME + ' WHERE '  + B.COLUMN_NAME + ' IS NOT NULL;' + char(13) + char(10) +
--       'ALTER TABLE ' + B.TABLE_SCHEMA + '.' + B.TABLE_NAME + ' DROP COLUMN ' + B.COLUMN_NAME + ';' + char(13) + char(10) +
--       'EXEC SP_RENAME ''' + B.TABLE_SCHEMA + '.' + B.TABLE_NAME + '.' +  B.COLUMN_NAME + '_ntext'', ''' + B.COLUMN_NAME + ''', ''COLUMN'';'
--from INFORMATION_SCHEMA.TABLES A, INFORMATION_SCHEMA.COLUMNS B
--where A.TABLE_CATALOG = B.TABLE_CATALOG  AND A.TABLE_SCHEMA = B.TABLE_SCHEMA  AND A.TABLE_NAME = B.TABLE_NAME and A.TABLE_TYPE != 'VIEW' and B.data_type = 'text';

-- Case 3. TBR-5114: Invalid fractional second value '-1178470736': must be an integer between 0 and 999999999.

-- Case 4. TBR-12126: Database link client API error "SecureDB"�̳� ����� ���� �Լ� �Ǵ� ���� "SecureDB.dbsec.DO_AUDIT"��(��) ã�� �� ���ų� �̸��� ��Ȯ���մϴ�.
-- ASIS���� ��ȣȭ ����� ���̺��� ������ �����ϰ�, �̰��ϴ� ������ ���������� ������.


