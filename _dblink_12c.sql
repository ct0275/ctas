-- 12ÃşDB
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
