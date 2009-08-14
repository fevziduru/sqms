drop sequence SEQ_ORGANIZATION;
drop sequence SEQ_SUITE;
drop sequence SEQ_DATABASE;
drop sequence SEQ_GEO;
drop sequence SEQ_ENUMERATION;

-- Create sequence 
create sequence SEQ_ORGANIZATION
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
create sequence SEQ_GEO
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_ENUMERATION
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;
