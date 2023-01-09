-- Generic I/O Error
create table chatting.j7 (
roomid                                   NUMBER(19)         NOT NULL,
contents                                 CLOB
);
insert into chatting.j7 select * from chatting.j7@ms_chatting;
commit;
