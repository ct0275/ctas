create table COUNSEL.SY_SECURE_KEY (key long raw);
insert into COUNSEL.SY_SECURE_KEY select * from COUNSEL.SY_SECURE_KEY@ora_cysnet;
commit;