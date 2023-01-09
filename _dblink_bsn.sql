-- asis流立立加 DBLink
drop database link ms_newweb;
create database link ms_newweb connect to metabuild identified by 'apxkqlfem1@' using 'bs_ms_newweb';

drop database link ms_chatting;
create database link ms_chatting connect to metabuild identified by 'apxkqlfem1@' using 'bs_ms_chatting';

drop database link ms_hrdDb;
create database link ms_hrdDb connect to metabuild identified by 'metabuild' using 'bs_ms_hrdDb';

drop database link ms_education;
create database link ms_education connect to metabuild identified by 'metabuild' using 'bs_ms_education';

drop database link ora_cysnet;
create database link ora_cysnet connect to metabuild identified by 'metabuild' using 'bs_ora_cysnet';

drop database link ora_orcl;
create database link ora_orcl connect to metabuild identified by 'metabuild' using 'bs_ora_orcl';

drop database link my_maria;
create database link my_maria connect to metabuild identified by 'metabuild' using 'bs_my_maria';
