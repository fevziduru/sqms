drop sequence SEQ_EMPLOYEE;
drop sequence SEQ_EQUIPMENT;
drop sequence SEQ_GEO;
drop sequence SEQ_LOG;
drop sequence SEQ_ORGANIZATION;
drop sequence SEQ_PASSPORT;
drop sequence SEQ_QUALITY;
drop sequence SEQ_RESOURCE;
drop sequence SEQ_RESPERMISSION;
drop sequence SEQ_ROLE;
drop sequence SEQ_USERROLE;
drop sequence SEQ_MPASSIGNMENT;
drop sequence SEQ_PROJECT;
drop sequence SEQ_ROAD;
drop sequence SEQ_ENUMERATION;
drop sequence SEQ_MENU;
drop sequence SEQ_OPERATION;
drop sequence SEQ_VIDEO;
drop sequence SEQ_MONITORPOINTVIDEO;

-- Create sequence 
create sequence SEQ_MONITORPOINTVIDEO
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_VIDEO
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_EMPLOYEE
minvalue 0
maxvalue 999999999999999999999999999
start with 357
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_EQUIPMENT
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
create sequence SEQ_LOG
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_ORGANIZATION
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_PASSPORT
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_QUALITY
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_RESOURCE
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_RESPERMISSION
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_ROLE
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_USERROLE
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;


-- Create sequence 
create sequence SEQ_MPASSIGNMENT
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_PROJECT
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_ROAD
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_OPERATION
minvalue 0
maxvalue 999999999999999999999999999
start with 63
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_ENUMERATION
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_MENU
minvalue 0
maxvalue 999999999999999999999999999
start with 0
increment by 1
cache 20;
