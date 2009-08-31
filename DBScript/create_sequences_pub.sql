drop sequence SEQ_PUBORGANIZATION;
drop sequence SEQ_SUITE;
drop sequence SEQ_DATABASE;
drop sequence SEQ_PUBGEO;
drop sequence SEQ_PUBENUMERATION;
drop sequence SEQ_PUBLOG;

-- Create sequence 
create sequence SEQ_PUBORGANIZATION
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_SUITE
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_DATABASE
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_PUBGEO
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_PUBENUMERATION
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

create sequence SEQ_PUBLOG
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;
