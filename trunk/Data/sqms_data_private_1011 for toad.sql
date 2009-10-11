prompt PL/SQL Developer import file
prompt Created on 2009��10��11�� by puy
set feedback off
set define off
prompt Dropping ENUMERATION...
drop table ENUMERATION cascade constraints;
prompt Dropping EQUIPMENT...
drop table EQUIPMENT cascade constraints;
prompt Dropping GEO...
drop table GEO cascade constraints;
prompt Dropping ORGANIZATION...
drop table ORGANIZATION cascade constraints;
prompt Dropping EMPLOYEE...
drop table EMPLOYEE cascade constraints;
prompt Dropping TIMESCHEMA...
drop table TIMESCHEMA cascade constraints;
prompt Dropping EMERGENCYEVENT...
drop table EMERGENCYEVENT cascade constraints;
prompt Dropping LOG...
drop table LOG cascade constraints;
prompt Dropping MENU...
drop table MENU cascade constraints;
prompt Dropping PROJECT...
drop table PROJECT cascade constraints;
prompt Dropping ROAD...
drop table ROAD cascade constraints;
prompt Dropping MPASSIGNMENT...
drop table MPASSIGNMENT cascade constraints;
prompt Dropping MONITORPOINTINVIDEO...
drop table MONITORPOINTINVIDEO cascade constraints;
prompt Dropping OPERATION...
drop table OPERATION cascade constraints;
prompt Dropping PASSPORT...
drop table PASSPORT cascade constraints;
prompt Dropping QUALITY...
drop table QUALITY cascade constraints;
prompt Dropping RESOURCEITEM...
drop table RESOURCEITEM cascade constraints;
prompt Dropping ROLE...
drop table ROLE cascade constraints;
prompt Dropping RESPERMISSION...
drop table RESPERMISSION cascade constraints;
prompt Dropping TIMEITEM...
drop table TIMEITEM cascade constraints;
prompt Dropping USERROLE...
drop table USERROLE cascade constraints;
prompt Dropping VEHICLETASK...
drop table VEHICLETASK cascade constraints;
prompt Dropping VEHICLETASKDATA...
drop table VEHICLETASKDATA cascade constraints;
prompt Dropping VIDEO...
drop table VIDEO cascade constraints;
prompt Creating ENUMERATION...
create table ENUMERATION
(
  ENUMID     VARCHAR2(40) not null,
  ENUMCODE   VARCHAR2(40),
  ENUMNAME   VARCHAR2(60),
  ENUMTYPE   VARCHAR2(60),
  MEMO       VARCHAR2(2000),
  CREATED    DATE,
  CREATEDBY  VARCHAR2(40),
  MODIFIED   DATE,
  MODIFIEDBY VARCHAR2(40)
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table ENUMERATION
  is 'ö��';
comment on column ENUMERATION.ENUMID
  is 'ö��ID';
comment on column ENUMERATION.ENUMCODE
  is 'ö�ٱ���';
comment on column ENUMERATION.ENUMNAME
  is 'ö������';
comment on column ENUMERATION.ENUMTYPE
  is 'ö������';
comment on column ENUMERATION.MEMO
  is '��ע';
comment on column ENUMERATION.CREATED
  is '����ʱ��';
comment on column ENUMERATION.CREATEDBY
  is '������';
comment on column ENUMERATION.MODIFIED
  is '�޸�ʱ��';
comment on column ENUMERATION.MODIFIEDBY
  is '�޸���';
alter table ENUMERATION
  add constraint PK_ENUMERATION primary key (ENUMID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ENUMERATION_ENUMTYPE on ENUMERATION (ENUMTYPE)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating EQUIPMENT...
create table EQUIPMENT
(
  EQUID          VARCHAR2(40) not null,
  EQUCODE        VARCHAR2(40) not null,
  EQUNAME        VARCHAR2(60) not null,
  IDENTIFY       VARCHAR2(40) not null,
  MEMO           VARCHAR2(2000),
  CREATED        DATE default SYSDATE not null,
  CREATEDBY      VARCHAR2(40),
  MODIFIED       DATE default SYSDATE not null,
  MODIFIEDBY     VARCHAR2(40),
  ISVOID         VARCHAR2(1) default 'N' not null,
  ORGANIZATIONID VARCHAR2(40),
  SUITEID        VARCHAR2(40)
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table EQUIPMENT
  is '�豸';
comment on column EQUIPMENT.EQUID
  is '�豸ID';
comment on column EQUIPMENT.EQUCODE
  is '�豸����';
comment on column EQUIPMENT.EQUNAME
  is '�豸����';
comment on column EQUIPMENT.IDENTIFY
  is '�豸��ʶ';
comment on column EQUIPMENT.MEMO
  is '��ע';
comment on column EQUIPMENT.CREATED
  is '����ʱ��';
comment on column EQUIPMENT.CREATEDBY
  is '������';
comment on column EQUIPMENT.MODIFIED
  is '�޸�ʱ��';
comment on column EQUIPMENT.MODIFIEDBY
  is '�޸���';
comment on column EQUIPMENT.ISVOID
  is '����';
comment on column EQUIPMENT.ORGANIZATIONID
  is 'ORGANIZATIONID';
comment on column EQUIPMENT.SUITEID
  is 'SUITEID';
alter table EQUIPMENT
  add constraint PK_EQUIPMENT primary key (EQUID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index EQUIPMENT_ORG on EQUIPMENT (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating GEO...
create table GEO
(
  GEOID      VARCHAR2(40) not null,
  PARENTGEO  VARCHAR2(40),
  GEOCODE    VARCHAR2(40) not null,
  GEONAME    VARCHAR2(60) not null,
  MEMO       VARCHAR2(2000),
  CREATED    DATE,
  CREATEDBY  VARCHAR2(40),
  MODIFIED   DATE,
  MODIFIEDBY VARCHAR2(40),
  ISVOID     VARCHAR2(1)
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table GEO
  is '����';
comment on column GEO.GEOID
  is '����ID';
comment on column GEO.PARENTGEO
  is '�ϼ�����';
comment on column GEO.GEOCODE
  is '��������';
comment on column GEO.GEONAME
  is '��������';
comment on column GEO.MEMO
  is '��ע';
comment on column GEO.CREATED
  is '����ʱ��';
comment on column GEO.CREATEDBY
  is '������';
comment on column GEO.MODIFIED
  is '�޸�ʱ��';
comment on column GEO.MODIFIEDBY
  is '�޸���';
comment on column GEO.ISVOID
  is '����';
alter table GEO
  add constraint PK_GEO primary key (GEOID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table GEO
  add constraint FK_GEO_RELGEO_GEO foreign key (PARENTGEO)
  references GEO (GEOID);
create index IDX_GEO_GEOID_FK on GEO (PARENTGEO)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ORGANIZATION...
create table ORGANIZATION
(
  ORGID          VARCHAR2(40) not null,
  COUNTRY        VARCHAR2(40),
  CITY           VARCHAR2(40),
  PARENTORG      VARCHAR2(40),
  PROVINCE       VARCHAR2(40),
  ORGCODE        VARCHAR2(40) not null,
  ORGNAME        VARCHAR2(60),
  ORGTYPE        VARCHAR2(40) default 'organization' not null,
  ORGALIAS       VARCHAR2(60),
  ORGSTATUS      VARCHAR2(2000),
  ORGADDRESS     VARCHAR2(200),
  ZIPCODE        VARCHAR2(20),
  CONTACT        VARCHAR2(20),
  CONTACTTEL     VARCHAR2(20),
  EMAIL          VARCHAR2(100),
  MEMO           VARCHAR2(2000),
  CREATED        DATE default SYSDATE not null,
  CREATEDBY      VARCHAR2(40),
  MODIFIEDBY     VARCHAR2(40),
  SUITEID        VARCHAR2(40),
  DATABASEID     VARCHAR2(40),
  MODIFIED       DATE default SYSDATE not null,
  ORGANIZATIONID VARCHAR2(40),
  ISVOID         CHAR(1) default 'N' not null
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table ORGANIZATION
  is '����';
comment on column ORGANIZATION.ORGID
  is '����ID';
comment on column ORGANIZATION.COUNTRY
  is '����';
comment on column ORGANIZATION.CITY
  is '��';
comment on column ORGANIZATION.PARENTORG
  is '�ϼ�����';
comment on column ORGANIZATION.PROVINCE
  is 'ʡ';
comment on column ORGANIZATION.ORGCODE
  is '��������';
comment on column ORGANIZATION.ORGNAME
  is '��������';
comment on column ORGANIZATION.ORGTYPE
  is '��������';
comment on column ORGANIZATION.ORGALIAS
  is '���';
comment on column ORGANIZATION.ORGSTATUS
  is '�����ſ�';
comment on column ORGANIZATION.ORGADDRESS
  is '������ַ';
comment on column ORGANIZATION.ZIPCODE
  is '�ʱ�';
comment on column ORGANIZATION.CONTACT
  is '��ϵ��';
comment on column ORGANIZATION.CONTACTTEL
  is '��ϵ�绰';
comment on column ORGANIZATION.EMAIL
  is 'Email';
comment on column ORGANIZATION.MEMO
  is '��ע';
comment on column ORGANIZATION.CREATED
  is '����ʱ��';
comment on column ORGANIZATION.CREATEDBY
  is '������';
comment on column ORGANIZATION.MODIFIEDBY
  is '�޸���';
comment on column ORGANIZATION.SUITEID
  is 'SUITEID';
comment on column ORGANIZATION.DATABASEID
  is 'DATABASEID';
comment on column ORGANIZATION.MODIFIED
  is '�޸�ʱ��';
comment on column ORGANIZATION.ORGANIZATIONID
  is 'ORGANIZATIONID';
comment on column ORGANIZATION.ISVOID
  is '����';
alter table ORGANIZATION
  add constraint PK_ORGANIZATION primary key (ORGID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORGANIZATION
  add constraint FK_ORGANIZA_REFERENCE_ENUMERAT foreign key (ORGTYPE)
  references ENUMERATION (ENUMID);
alter table ORGANIZATION
  add constraint FK_ORGANIZA_RELORGCIT_GEO foreign key (CITY)
  references GEO (GEOID);
alter table ORGANIZATION
  add constraint FK_ORGANIZA_RELORGCOU_GEO foreign key (COUNTRY)
  references GEO (GEOID);
alter table ORGANIZATION
  add constraint FK_ORGANIZA_RELORGPRO_GEO foreign key (PROVINCE)
  references GEO (GEOID);
alter table ORGANIZATION
  add constraint FK_ORGANIZA_RELPARENT_ORGANIZA foreign key (PARENTORG)
  references ORGANIZATION (ORGID);
create index IDX_ORGANIZATION_CITY_FK on ORGANIZATION (CITY)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ORGANIZATION_COUNTRY_FK on ORGANIZATION (COUNTRY)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ORGANIZATION_PARENTORG_FK on ORGANIZATION (PARENTORG)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ORGANIZATION_PROVINCE_FK on ORGANIZATION (PROVINCE)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ORGANIZATION_SUITEID on ORGANIZATION (SUITEID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating EMPLOYEE...
create table EMPLOYEE
(
  EMPID          VARCHAR2(40) not null,
  DEPTID         VARCHAR2(40),
  EQUID          VARCHAR2(40),
  SEX            VARCHAR2(40),
  EMPNAME        VARCHAR2(60) not null,
  EMPCODE        VARCHAR2(40) not null,
  EMPSTATUS      VARCHAR2(20),
  MOBILE         VARCHAR2(20),
  ISVOID         CHAR(1) default 'N' not null,
  JOBTITLE       VARCHAR2(40),
  CONTACTTEL     VARCHAR2(20),
  BIRTHDAY       DATE,
  DEGREE         VARCHAR2(40),
  MEMO           VARCHAR2(2000),
  CREATED        DATE default SYSDATE not null,
  CREATEDBY      VARCHAR2(40),
  MODIFIEDBY     VARCHAR2(40),
  MODIFIED       DATE default SYSDATE not null,
  ORGANIZATIONID VARCHAR2(40),
  SUITEID        VARCHAR2(40),
  ISEQUACTIVATE  CHAR(1) default 'N'
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table EMPLOYEE
  is 'ְԱ';
comment on column EMPLOYEE.EMPID
  is 'ְԱID';
comment on column EMPLOYEE.DEPTID
  is '��������';
comment on column EMPLOYEE.EQUID
  is '�ƶ��豸';
comment on column EMPLOYEE.SEX
  is '�Ա�';
comment on column EMPLOYEE.EMPNAME
  is 'ְԱ����';
comment on column EMPLOYEE.EMPCODE
  is 'ְԱ����';
comment on column EMPLOYEE.EMPSTATUS
  is 'ְԱ״̬';
comment on column EMPLOYEE.MOBILE
  is '�ƶ��绰';
comment on column EMPLOYEE.ISVOID
  is '����';
comment on column EMPLOYEE.JOBTITLE
  is 'ְλ';
comment on column EMPLOYEE.CONTACTTEL
  is '��ϵ�绰';
comment on column EMPLOYEE.BIRTHDAY
  is '��������';
comment on column EMPLOYEE.DEGREE
  is 'ѧ��';
comment on column EMPLOYEE.MEMO
  is '��ע';
comment on column EMPLOYEE.CREATED
  is '����ʱ��';
comment on column EMPLOYEE.CREATEDBY
  is '������';
comment on column EMPLOYEE.MODIFIEDBY
  is '�޸���';
comment on column EMPLOYEE.MODIFIED
  is '�޸�ʱ��';
comment on column EMPLOYEE.ORGANIZATIONID
  is 'ORGANIZATIONID';
comment on column EMPLOYEE.SUITEID
  is 'SUITEID';
comment on column EMPLOYEE.ISEQUACTIVATE
  is 'ISEQUACTIVATE';
alter table EMPLOYEE
  add constraint PK_EMPLOYEE primary key (EMPID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EMPLOYEE
  add constraint FK_EMPLOYEE_EMP_DEPT__ORGANIZA foreign key (DEPTID)
  references ORGANIZATION (ORGID);
alter table EMPLOYEE
  add constraint FK_EMPLOYEE_EMP_ORG_R_ORGANIZA foreign key (ORGANIZATIONID)
  references ORGANIZATION (ORGID);
alter table EMPLOYEE
  add constraint FK_EMPLOYEE_REFERENCE_ENUMERAT foreign key (DEGREE)
  references ENUMERATION (ENUMID);
alter table EMPLOYEE
  add constraint FK_EMPLOYEE_RELATIONS_ENUMERAT foreign key (SEX)
  references ENUMERATION (ENUMID);
alter table EMPLOYEE
  add constraint FK_EMPLOYEE_RELEQUBIN_EQUIPMEN foreign key (EQUID)
  references EQUIPMENT (EQUID);
create index IDX_EMPLOYEE_EQUID_FK on EMPLOYEE (EQUID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_EMPLOYEE_ORGANIZATIONID on EMPLOYEE (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_EMPLOYEE_SEX_FK on EMPLOYEE (SEX)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating TIMESCHEMA...
create table TIMESCHEMA
(
  SCHEMAID       VARCHAR2(40) not null,
  SCHEMANAME     VARCHAR2(60),
  CREATED        DATE default SYSDATE not null,
  CREATEDBY      VARCHAR2(40),
  MODIFIED       DATE default SYSDATE not null,
  MODIFIEDBY     VARCHAR2(40),
  ORGANIZATIONID VARCHAR2(40),
  FLOATTIME      NUMBER,
  BEGINTIME      DATE,
  ENDTIME        DATE,
  ISVOID         CHAR(1) default 'N' not null
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table TIMESCHEMA
  is 'ʱ��ģ��';
comment on column TIMESCHEMA.SCHEMAID
  is 'ģ��ID';
comment on column TIMESCHEMA.SCHEMANAME
  is 'ģ������';
comment on column TIMESCHEMA.CREATED
  is '����ʱ��';
comment on column TIMESCHEMA.CREATEDBY
  is '������';
comment on column TIMESCHEMA.MODIFIED
  is '�޸�ʱ��';
comment on column TIMESCHEMA.MODIFIEDBY
  is '�޸���';
comment on column TIMESCHEMA.ORGANIZATIONID
  is 'ORGANIZATIONID';
comment on column TIMESCHEMA.FLOATTIME
  is '����ʱ��';
comment on column TIMESCHEMA.BEGINTIME
  is '��ʼʱ��';
comment on column TIMESCHEMA.ENDTIME
  is '����ʱ��';
comment on column TIMESCHEMA.ISVOID
  is '����';
alter table TIMESCHEMA
  add constraint PK_TIMESCHEMA primary key (SCHEMAID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TIMESCHEMA_ORGANIZATIONID on TIMESCHEMA (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating EMERGENCYEVENT...
create table EMERGENCYEVENT
(
  EVENTID               VARCHAR2(40) not null,
  EVENTCODE             VARCHAR2(60),
  SCHEMAID              VARCHAR2(40),
  EVENTNAME             VARCHAR2(60),
  ISVOID                CHAR(1),
  CREATED               DATE,
  CREATEDBY             VARCHAR2(40),
  MODIFIED              DATE,
  MODIFIEDBY            VARCHAR2(40),
  ORGANIZATIONID        VARCHAR2(40),
  CHECKTIME             DATE,
  CHECKUNIT             VARCHAR2(1000),
  PRIVILIGE             VARCHAR2(40),
  EMERGENCYCHARGEPERSON VARCHAR2(40),
  MEMO                  VARCHAR2(1000)
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table EMERGENCYEVENT
  is 'Ӧ���¼�����';
comment on column EMERGENCYEVENT.EVENTID
  is '�¼�ID';
comment on column EMERGENCYEVENT.EVENTCODE
  is '�¼�����';
comment on column EMERGENCYEVENT.SCHEMAID
  is 'ģ��ID';
comment on column EMERGENCYEVENT.EVENTNAME
  is '�¼�����';
comment on column EMERGENCYEVENT.ISVOID
  is '����';
comment on column EMERGENCYEVENT.CREATED
  is '����ʱ��';
comment on column EMERGENCYEVENT.CREATEDBY
  is '������';
comment on column EMERGENCYEVENT.MODIFIED
  is '�޸�ʱ��';
comment on column EMERGENCYEVENT.MODIFIEDBY
  is '�޸���';
comment on column EMERGENCYEVENT.ORGANIZATIONID
  is 'ORGANIZATIONID';
comment on column EMERGENCYEVENT.CHECKTIME
  is '���ʱ��';
comment on column EMERGENCYEVENT.CHECKUNIT
  is 'Ӧ����鵥λ';
comment on column EMERGENCYEVENT.PRIVILIGE
  is '���ȼ�';
comment on column EMERGENCYEVENT.EMERGENCYCHARGEPERSON
  is 'Ӧ��ʱ�为����';
comment on column EMERGENCYEVENT.MEMO
  is '��ע';
alter table EMERGENCYEVENT
  add constraint PK_EMERGENCYEVENT primary key (EVENTID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EMERGENCYEVENT
  add constraint FK_EMERGENC_REFERENCE_EMPLOYEE foreign key (EMERGENCYCHARGEPERSON)
  references EMPLOYEE (EMPID);
alter table EMERGENCYEVENT
  add constraint FK_EMERGENC_REFERENCE_TIMESCHE foreign key (SCHEMAID)
  references TIMESCHEMA (SCHEMAID);
create index IDX_EVENT_ORGANIZATIONID on EMERGENCYEVENT (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating LOG...
create table LOG
(
  LOGID          VARCHAR2(40) not null,
  LOGCODE        VARCHAR2(40) not null,
  LOGTYPE        VARCHAR2(20) not null,
  LOGLEVEL       VARCHAR2(20) not null,
  LOGSOURCE      VARCHAR2(200) not null,
  CONTENT        VARCHAR2(1000),
  RECORDTIME     DATE not null,
  ISVOID         CHAR(1),
  CREATED        DATE,
  CREATEDBY      VARCHAR2(40),
  MODIFIED       DATE,
  MODIFIEDBY     VARCHAR2(40),
  ORGANIZATIONID VARCHAR2(40),
  SUITEID        VARCHAR2(40)
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table LOG
  is '��־';
comment on column LOG.LOGID
  is '��־ID';
comment on column LOG.LOGCODE
  is '��־����';
comment on column LOG.LOGTYPE
  is '����';
comment on column LOG.LOGLEVEL
  is '����';
comment on column LOG.LOGSOURCE
  is '��Դ';
comment on column LOG.CONTENT
  is '����';
comment on column LOG.RECORDTIME
  is '��¼ʱ��';
comment on column LOG.ISVOID
  is '����';
comment on column LOG.CREATED
  is '����ʱ��';
comment on column LOG.CREATEDBY
  is '������';
comment on column LOG.MODIFIED
  is '�޸�ʱ��';
comment on column LOG.MODIFIEDBY
  is '�޸���';
comment on column LOG.ORGANIZATIONID
  is 'ORGANIZATIONID';
comment on column LOG.SUITEID
  is 'SUITEID';
alter table LOG
  add constraint PK_LOG primary key (LOGID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LOG_ORGANIZATIONID on LOG (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating MENU...
create table MENU
(
  MENUID      VARCHAR2(40) not null,
  TITLE       VARCHAR2(100),
  URL         VARCHAR2(2000),
  RESOURCEKEY VARCHAR2(200),
  MEMO        VARCHAR2(1000),
  PARENTMENU  VARCHAR2(40),
  ITEMORDER   VARCHAR2(600),
  TYPE        VARCHAR2(40)
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table MENU
  is '�˵�';
comment on column MENU.MENUID
  is '�˵�ID';
comment on column MENU.TITLE
  is '����';
comment on column MENU.URL
  is 'URL';
comment on column MENU.RESOURCEKEY
  is '��Դ��ʶ';
comment on column MENU.MEMO
  is '��ע';
comment on column MENU.PARENTMENU
  is '�����˵�';
comment on column MENU.ITEMORDER
  is '�˵���˳��';
comment on column MENU.TYPE
  is '����';
alter table MENU
  add constraint PK_MENU primary key (MENUID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating PROJECT...
create table PROJECT
(
  PROJECTID         VARCHAR2(40) not null,
  EMPID             VARCHAR2(40),
  PROJECTCODE       VARCHAR2(40),
  PROJECTNAME       VARCHAR2(600),
  TOTALWORKTIME     NUMBER(12,4),
  TOTALSCALE        NUMBER(12,4),
  ASSISTAMOUNT      INTEGER,
  LEADERAMOUNT      INTEGER,
  VISELEADERAMOUNT  INTEGER,
  TOTALWORKERAMOUNT INTEGER,
  MEMO              VARCHAR2(2000),
  CREATED           DATE default SYSDATE not null,
  CREATEDBY         VARCHAR2(40),
  MODIFIED          DATE default SYSDATE not null,
  MODIFIEDBY        VARCHAR2(40),
  ORGANIZATIONID    VARCHAR2(40),
  SUITEID           VARCHAR2(40),
  ISVOID            VARCHAR2(1) default 'N' not null
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table PROJECT
  is '��Ŀ';
comment on column PROJECT.PROJECTID
  is '��ĿID';
comment on column PROJECT.EMPID
  is '������';
comment on column PROJECT.PROJECTCODE
  is '��Ŀ����';
comment on column PROJECT.PROJECTNAME
  is '��Ŀ����';
comment on column PROJECT.TOTALWORKTIME
  is '����ҵʱ��';
comment on column PROJECT.TOTALSCALE
  is '�ܹ�ģ';
comment on column PROJECT.ASSISTAMOUNT
  is '��������';
comment on column PROJECT.LEADERAMOUNT
  is '�鳤����';
comment on column PROJECT.VISELEADERAMOUNT
  is '���鳤����';
comment on column PROJECT.TOTALWORKERAMOUNT
  is '�ܹ�����';
comment on column PROJECT.MEMO
  is '��ע';
comment on column PROJECT.CREATED
  is '����ʱ��';
comment on column PROJECT.CREATEDBY
  is '������';
comment on column PROJECT.MODIFIED
  is '�޸�ʱ��';
comment on column PROJECT.MODIFIEDBY
  is '�޸���';
comment on column PROJECT.ORGANIZATIONID
  is 'ORGANIZATIONID';
comment on column PROJECT.SUITEID
  is 'SUITEID';
comment on column PROJECT.ISVOID
  is '����';
alter table PROJECT
  add constraint PK_PROJECT primary key (PROJECTID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PROJECT
  add constraint FK_PROJECT_REFERENCE_EMPLOYEE foreign key (EMPID)
  references EMPLOYEE (EMPID);
create index IDX_PROJECT_EMPID_FK on PROJECT (EMPID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_PROJECT_ORGANIZATIONID on PROJECT (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ROAD...
create table ROAD
(
  ROADID          VARCHAR2(40) not null,
  PROJECTID       VARCHAR2(40),
  ROADCODE        VARCHAR2(40),
  ROADNAME        VARCHAR2(1000),
  ROADTYPE        VARCHAR2(200),
  BEGINTIME       DATE,
  ENDTIME         DATE,
  WORKTIME        NUMBER(12,4),
  WORKERAMOUNT    INTEGER,
  MEMO            VARCHAR2(2000),
  AVGWORKERAMOUNT NUMBER(12,4),
  CREATED         DATE default SYSDATE not null,
  CREATEDBY       VARCHAR2(40),
  MODIFIED        DATE default SYSDATE not null,
  MODIFIEDBY      VARCHAR2(40),
  ISVOID          VARCHAR2(1) default 'N' not null,
  ORGANIZATIONID  VARCHAR2(40),
  SUITEID         VARCHAR2(40),
  SCALE           NUMBER
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table ROAD
  is '·��';
comment on column ROAD.ROADID
  is '·��ID';
comment on column ROAD.PROJECTID
  is '��ĿID';
comment on column ROAD.ROADCODE
  is '·�α���';
comment on column ROAD.ROADNAME
  is '·������';
comment on column ROAD.ROADTYPE
  is '·������';
comment on column ROAD.BEGINTIME
  is '��ҵ��ʼʱ��';
comment on column ROAD.ENDTIME
  is '��ҵ����ʱ��';
comment on column ROAD.WORKTIME
  is '��ҵʱ��';
comment on column ROAD.WORKERAMOUNT
  is '��������';
comment on column ROAD.MEMO
  is '��ע';
comment on column ROAD.AVGWORKERAMOUNT
  is '�����˾���';
comment on column ROAD.CREATED
  is '����ʱ��';
comment on column ROAD.CREATEDBY
  is '������';
comment on column ROAD.MODIFIED
  is '�޸�ʱ��';
comment on column ROAD.MODIFIEDBY
  is '�޸���';
comment on column ROAD.ISVOID
  is '����';
comment on column ROAD.ORGANIZATIONID
  is 'ORGANIZATIONID';
comment on column ROAD.SUITEID
  is 'SUITEID';
comment on column ROAD.SCALE
  is '��ģ';
alter table ROAD
  add constraint PK_ROAD primary key (ROADID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ROAD
  add constraint FK_ROAD_RELATIONS_PROJECT foreign key (PROJECTID)
  references PROJECT (PROJECTID);
create index IDX_ROAD_ORGAINZATIONID on ROAD (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ROAD_PROJECTID_FK on ROAD (PROJECTID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating MPASSIGNMENT...
create table MPASSIGNMENT
(
  MPID           VARCHAR2(40) not null,
  ROADID         VARCHAR2(40),
  SCHEMAID       VARCHAR2(40),
  MPCODE         VARCHAR2(40),
  MPNAME         VARCHAR2(200),
  LONGITUDE      NUMBER(17,14),
  LATITUDE       NUMBER(17,14),
  MEMO           VARCHAR2(2000),
  CREATED        DATE default SYSDATE not null,
  CREATEDBY      VARCHAR2(40),
  MODIFIED       DATE default SYSDATE not null,
  MODIFIEDBY     VARCHAR2(40),
  ORGANIZATIONID VARCHAR2(40),
  SUITEID        VARCHAR2(40),
  ISVOID         VARCHAR2(1) default 'N' not null,
  MPLEVEL        NUMBER,
  FLOATDIST      NUMBER,
  IMPORTANCE     VARCHAR2(40) default '0' not null,
  EVENTID        VARCHAR2(40),
  LATESTQCLEVEL  NUMBER default -1 not null,
  ISSTART        CHAR(1) default 'N' not null,
  ISEND          CHAR(1) default 'N' not null,
  ORDERINROAD    NUMBER default 0 not null,
  MPTYPE         VARCHAR2(40)
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table MPASSIGNMENT
  is '��ص�';
comment on column MPASSIGNMENT.MPID
  is '��ص�ID';
comment on column MPASSIGNMENT.ROADID
  is '·��ID';
comment on column MPASSIGNMENT.SCHEMAID
  is 'ʱ��ģ��';
comment on column MPASSIGNMENT.MPCODE
  is '��ص����';
comment on column MPASSIGNMENT.MPNAME
  is '��ص�����';
comment on column MPASSIGNMENT.LONGITUDE
  is '����';
comment on column MPASSIGNMENT.LATITUDE
  is 'γ��';
comment on column MPASSIGNMENT.MEMO
  is '��ע';
comment on column MPASSIGNMENT.CREATED
  is '����ʱ��';
comment on column MPASSIGNMENT.CREATEDBY
  is '������';
comment on column MPASSIGNMENT.MODIFIED
  is '�޸�ʱ��';
comment on column MPASSIGNMENT.MODIFIEDBY
  is '�޸���';
comment on column MPASSIGNMENT.ORGANIZATIONID
  is 'ORGANIZATIONID';
comment on column MPASSIGNMENT.SUITEID
  is 'SUITEID';
comment on column MPASSIGNMENT.ISVOID
  is '����';
comment on column MPASSIGNMENT.MPLEVEL
  is '��ͼ���ż���';
comment on column MPASSIGNMENT.FLOATDIST
  is '��������';
comment on column MPASSIGNMENT.IMPORTANCE
  is '��ص���Ҫ��';
comment on column MPASSIGNMENT.EVENTID
  is '�¼�ID';
comment on column MPASSIGNMENT.LATESTQCLEVEL
  is '������������';
comment on column MPASSIGNMENT.ISSTART
  is '�Ƿ����';
comment on column MPASSIGNMENT.ISEND
  is '�Ƿ��յ�';
comment on column MPASSIGNMENT.ORDERINROAD
  is '���';
comment on column MPASSIGNMENT.MPTYPE
  is '��ص�����';
alter table MPASSIGNMENT
  add constraint PK_MPASSIGNMENT primary key (MPID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MPASSIGNMENT
  add constraint FK_MPASSIGN_REFERENCE_EMERGENC foreign key (EVENTID)
  references EMERGENCYEVENT (EVENTID);
alter table MPASSIGNMENT
  add constraint FK_MPASSIGN_REFERENCE_ENUMERAT foreign key (IMPORTANCE)
  references ENUMERATION (ENUMID);
alter table MPASSIGNMENT
  add constraint FK_MPASSIGN_REFERENCE_TIMESCHE foreign key (SCHEMAID)
  references TIMESCHEMA (SCHEMAID);
alter table MPASSIGNMENT
  add constraint FK_MPASSIGN_RELATIONS_ROAD foreign key (ROADID)
  references ROAD (ROADID);
create index IDX_ROAD_ORGANIZATIONID on MPASSIGNMENT (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ROAD_ROADID_FK on MPASSIGNMENT (ROADID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating MONITORPOINTINVIDEO...
create table MONITORPOINTINVIDEO
(
  VIDEOID VARCHAR2(40) not null,
  MPID    VARCHAR2(40) not null
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table MONITORPOINTINVIDEO
  is '��ص�����Ƶ��ϵ���洢��Ƶ�а����ļ�ص�';
comment on column MONITORPOINTINVIDEO.VIDEOID
  is '��ƵID';
comment on column MONITORPOINTINVIDEO.MPID
  is '��ص�ID';
alter table MONITORPOINTINVIDEO
  add constraint PK_MONITORPOINTINVIDEO primary key (VIDEOID, MPID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MONITORPOINTINVIDEO
  add constraint FK_MONITORP_REFERENCE_MPASSIGN foreign key (MPID)
  references MPASSIGNMENT (MPID);
create index IDX_MONITORPOINTVIDEO_MPID_FK on MONITORPOINTINVIDEO (MPID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_MPV_VIDEOID_FK on MONITORPOINTINVIDEO (VIDEOID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating OPERATION...
create table OPERATION
(
  OPID           VARCHAR2(40) not null,
  OPCODE         VARCHAR2(40) not null,
  OPNAME         VARCHAR2(60) not null,
  MEMO           VARCHAR2(2000),
  CREATED        DATE default SYSDATE not null,
  CREATEDBY      VARCHAR2(40),
  MODIFIED       DATE default SYSDATE not null,
  MODIFIEDBY     VARCHAR2(40),
  ISVOID         VARCHAR2(1) default 'N' not null,
  ORGANIZATIONID VARCHAR2(40),
  OPORDER        NUMBER,
  OPIDENTITY     VARCHAR2(40)
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table OPERATION
  is '����';
comment on column OPERATION.OPID
  is '����ID';
comment on column OPERATION.OPCODE
  is '��������';
comment on column OPERATION.OPNAME
  is '��������';
comment on column OPERATION.MEMO
  is '��ע';
comment on column OPERATION.CREATED
  is '����ʱ��';
comment on column OPERATION.CREATEDBY
  is '������';
comment on column OPERATION.MODIFIED
  is '�޸�ʱ��';
comment on column OPERATION.MODIFIEDBY
  is '�޸���';
comment on column OPERATION.ISVOID
  is '����';
comment on column OPERATION.ORGANIZATIONID
  is 'ORGANIZATIONID';
comment on column OPERATION.OPORDER
  is 'OPORDER';
comment on column OPERATION.OPIDENTITY
  is 'OPIDENTITY';
alter table OPERATION
  add constraint PK_OPERATION primary key (OPID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_OPERATION_ORGANIZATIONID on OPERATION (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating PASSPORT...
create table PASSPORT
(
  PASSPORTID     VARCHAR2(40) not null,
  EMPID          VARCHAR2(40) not null,
  PASSPORTCODE   VARCHAR2(40) not null,
  PASSPORT       VARCHAR2(60) not null,
  PASSWORD       VARCHAR2(20),
  ISVOID         CHAR(1) default 'N' not null,
  MEMO           VARCHAR2(2000),
  CREATED        DATE default SYSDATE not null,
  CREATEDBY      VARCHAR2(40),
  MODIFIED       DATE default SYSDATE not null,
  MODIFIEDBY     VARCHAR2(40),
  ORGANIZATIONID VARCHAR2(40),
  SUITEID        VARCHAR2(40)
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table PASSPORT
  is '�˺�';
comment on column PASSPORT.PASSPORTID
  is '�˺�ID';
comment on column PASSPORT.EMPID
  is 'ְԱ';
comment on column PASSPORT.PASSPORTCODE
  is '�˺ű���';
comment on column PASSPORT.PASSPORT
  is '�˺�';
comment on column PASSPORT.PASSWORD
  is '����';
comment on column PASSPORT.ISVOID
  is '����';
comment on column PASSPORT.MEMO
  is '��ע';
comment on column PASSPORT.CREATED
  is '����ʱ��';
comment on column PASSPORT.CREATEDBY
  is '������';
comment on column PASSPORT.MODIFIED
  is '�޸�ʱ��';
comment on column PASSPORT.MODIFIEDBY
  is '�޸���';
comment on column PASSPORT.ORGANIZATIONID
  is 'ORGANIZATIONID';
comment on column PASSPORT.SUITEID
  is 'SUITEID';
alter table PASSPORT
  add constraint PK_PASSPORT primary key (PASSPORTID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PASSPORT
  add constraint FK_PASSPORT_EMPPASSPO_EMPLOYEE foreign key (EMPID)
  references EMPLOYEE (EMPID);
create index IDX_PASSPORT_EMPID_FK on PASSPORT (EMPID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index PASSPORT_ORGANIZATIONID on PASSPORT (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating QUALITY...
create table QUALITY
(
  QMID            VARCHAR2(40) not null,
  CHARGEPERSON    VARCHAR2(40),
  WORKUNIT        VARCHAR2(40),
  STATUS          VARCHAR2(40) default '_qc_state_valid' not null,
  MPID            VARCHAR2(40),
  EMERGENCYPERSON VARCHAR2(40),
  QMCODE          VARCHAR2(40),
  CHECKPERSON     VARCHAR2(40),
  ROADID          VARCHAR2(40),
  MATERIAL        VARCHAR2(2000) not null,
  LONGITUDE       NUMBER(17,14),
  LATITUDE        NUMBER(17,14),
  TYPE            VARCHAR2(40) default '_qc_type_normal' not null,
  MEMO            VARCHAR2(2000),
  CREATED         DATE default SYSDATE not null,
  CREATEDBY       VARCHAR2(40),
  MODIFIED        DATE default SYSDATE not null,
  MODIFIEDBY      VARCHAR2(40),
  ORGANIZATIONID  VARCHAR2(40),
  SUITEID         VARCHAR2(40),
  ISVOID          VARCHAR2(1) default 'N' not null,
  QUALITYLEVEL    NUMBER,
  IMAGEURL        VARCHAR2(1000),
  VIDEOURL        VARCHAR2(1000)
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table QUALITY
  is '��������';
comment on column QUALITY.QMID
  is 'QMID';
comment on column QUALITY.CHARGEPERSON
  is '������';
comment on column QUALITY.WORKUNIT
  is '��ҵ��λ';
comment on column QUALITY.STATUS
  is '״̬';
comment on column QUALITY.MPID
  is '��ص�ID';
comment on column QUALITY.EMERGENCYPERSON
  is 'Ӧ������������';
comment on column QUALITY.QMCODE
  is '�ʿر���';
comment on column QUALITY.CHECKPERSON
  is 'Ѳ��Ա';
comment on column QUALITY.ROADID
  is '·��ID';
comment on column QUALITY.MATERIAL
  is 'ͼƬ��Ϣ';
comment on column QUALITY.LONGITUDE
  is '���ݲɼ��ص㾭��';
comment on column QUALITY.LATITUDE
  is '���ݲɼ��ص�γ��';
comment on column QUALITY.TYPE
  is '����';
comment on column QUALITY.MEMO
  is '��ע';
comment on column QUALITY.CREATED
  is '���ֶα��뱣��ʱ�����ݣ����ʽΪyyyy-mm-dd hh24:mi:ss';
comment on column QUALITY.CREATEDBY
  is '������';
comment on column QUALITY.MODIFIED
  is '���ֶα��뱣��ʱ�����ݣ����ʽΪyyyy-mm-dd hh24:mi:ss';
comment on column QUALITY.MODIFIEDBY
  is '�޸���';
comment on column QUALITY.ORGANIZATIONID
  is 'ORGANIZATIONID';
comment on column QUALITY.SUITEID
  is 'SUITEID';
comment on column QUALITY.ISVOID
  is '����';
comment on column QUALITY.QUALITYLEVEL
  is 'QUALITYLEVEL';
comment on column QUALITY.IMAGEURL
  is 'ͼƬURL';
comment on column QUALITY.VIDEOURL
  is '��ƵURL';
alter table QUALITY
  add constraint PK_QUALITY primary key (QMID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table QUALITY
  add constraint FK_QUALITY_REFERENCE_ROAD foreign key (ROADID)
  references ROAD (ROADID);
alter table QUALITY
  add constraint FK_QUALITY_RELATIONS_ENUMERAT foreign key (STATUS)
  references ENUMERATION (ENUMID);
alter table QUALITY
  add constraint FK_QUALITY_RELATIONS_MPASSIGN foreign key (MPID)
  references MPASSIGNMENT (MPID)
  disable;
alter table QUALITY
  add constraint FK_QUALITY_RELCHARGE_EMPLOYEE foreign key (CHARGEPERSON)
  references EMPLOYEE (EMPID);
alter table QUALITY
  add constraint FK_QUALITY_RELEMERGE_EMPLOYEE foreign key (EMERGENCYPERSON)
  references EMPLOYEE (EMPID);
alter table QUALITY
  add constraint FK_QUALITY_RELEMPLOY_EMPLOYEE foreign key (CHECKPERSON)
  references EMPLOYEE (EMPID);
alter table QUALITY
  add constraint FK_QUALITY_RELWORKUN_ORGANIZA foreign key (WORKUNIT)
  references ORGANIZATION (ORGID);
create index IDX_QUALITY_CHARGEPERSON_FK on QUALITY (CHARGEPERSON)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_QUALITY_CHECKPERSON_FK on QUALITY (CHECKPERSON)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_QUALITY_CREATED on QUALITY (CREATED DESC)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_QUALITY_EMERGENCYPERSON_FK on QUALITY (EMERGENCYPERSON)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_QUALITY_MPID_FK on QUALITY (MPID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_QUALITY_ORGANIZATIONID on QUALITY (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_QUALITY_STATUS_FK on QUALITY (STATUS)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_QUALITY_WORKUNIT_FK on QUALITY (WORKUNIT)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating RESOURCEITEM...
create table RESOURCEITEM
(
  RESID          VARCHAR2(40) not null,
  RESCODE        VARCHAR2(40) not null,
  RESIDENTITY    VARCHAR2(200),
  VIEWNAME       VARCHAR2(512),
  RESNAME        VARCHAR2(60) not null,
  RESTYPE        VARCHAR2(60),
  LOCATION       VARCHAR2(600),
  MEMO           VARCHAR2(2000),
  ISVOID         CHAR(1) default 'N' not null,
  CREATED        DATE default SYSDATE not null,
  CREATEDBY      VARCHAR2(40),
  MODIFIED       DATE default SYSDATE not null,
  MODIFIEDBY     VARCHAR2(40),
  ORGANIZATIONID VARCHAR2(40)
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table RESOURCEITEM
  is '��Դ';
comment on column RESOURCEITEM.RESID
  is '��ԴID';
comment on column RESOURCEITEM.RESCODE
  is '��Դ����';
comment on column RESOURCEITEM.RESIDENTITY
  is '��Դ��ʶ';
comment on column RESOURCEITEM.VIEWNAME
  is '���ڱ���ʵ�ʵ�ҳ���ļ���';
comment on column RESOURCEITEM.RESNAME
  is '�Զ������Դ������';
comment on column RESOURCEITEM.RESTYPE
  is '��Դ����';
comment on column RESOURCEITEM.LOCATION
  is '��Դλ��';
comment on column RESOURCEITEM.MEMO
  is '��ע';
comment on column RESOURCEITEM.ISVOID
  is '����';
comment on column RESOURCEITEM.CREATED
  is '����ʱ��';
comment on column RESOURCEITEM.CREATEDBY
  is '������';
comment on column RESOURCEITEM.MODIFIED
  is '�޸�ʱ��';
comment on column RESOURCEITEM.MODIFIEDBY
  is '�޸���';
comment on column RESOURCEITEM.ORGANIZATIONID
  is 'ORGANIZATIONID';
alter table RESOURCEITEM
  add constraint PK_RESOURCEITEM primary key (RESID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index IDX_U_RESOURCE_RESIDENTITY on RESOURCEITEM (RESIDENTITY)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index RESOURCEITEM_ORGANIZATIONID on RESOURCEITEM (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLE...
create table ROLE
(
  ROLEID         VARCHAR2(40) not null,
  ROLECODE       VARCHAR2(40) not null,
  ROLENAME       VARCHAR2(60) not null,
  ISVOID         CHAR(1) default 'N' not null,
  MEMO           VARCHAR2(2000),
  CREATED        DATE default SYSDATE not null,
  CREATEDBY      VARCHAR2(40),
  MODIFIED       DATE default SYSDATE not null,
  MODIFIEDBY     VARCHAR2(40),
  ORGANIZATIONID VARCHAR2(40),
  SUITEID        VARCHAR2(40)
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table ROLE
  is '��ɫ';
comment on column ROLE.ROLEID
  is '��ɫID';
comment on column ROLE.ROLECODE
  is '��ɫ����';
comment on column ROLE.ROLENAME
  is '��ɫ����';
comment on column ROLE.ISVOID
  is '����';
comment on column ROLE.MEMO
  is '��ע';
comment on column ROLE.CREATED
  is '����ʱ��';
comment on column ROLE.CREATEDBY
  is '������';
comment on column ROLE.MODIFIED
  is '�޸�ʱ��';
comment on column ROLE.MODIFIEDBY
  is '�޸���';
comment on column ROLE.ORGANIZATIONID
  is 'ORGANIZATIONID';
comment on column ROLE.SUITEID
  is 'SUITEID';
alter table ROLE
  add constraint PK_ROLE primary key (ROLEID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index ROLE_ORGANIZATIONID on ROLE (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating RESPERMISSION...
create table RESPERMISSION
(
  ORGANIZATIONID VARCHAR2(40),
  ROLEID         VARCHAR2(40) not null,
  RESID          VARCHAR2(40) not null,
  OPID           VARCHAR2(40) not null
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table RESPERMISSION
  is '��ԴȨ��';
comment on column RESPERMISSION.ORGANIZATIONID
  is 'ORGANIZATIONID';
comment on column RESPERMISSION.ROLEID
  is '��ɫID';
comment on column RESPERMISSION.RESID
  is '��ԴID';
comment on column RESPERMISSION.OPID
  is '����ID';
alter table RESPERMISSION
  add constraint PK_RESPERMISSION primary key (ROLEID, RESID, OPID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table RESPERMISSION
  add constraint FK_RESPERMI_REFERENCE_OPERATIO foreign key (OPID)
  references OPERATION (OPID);
alter table RESPERMISSION
  add constraint FK_RESPERMI_REFERENCE_RESOURCE foreign key (RESID)
  references RESOURCEITEM (RESID);
alter table RESPERMISSION
  add constraint FK_RESPERMI_REFERENCE_ROLE foreign key (ROLEID)
  references ROLE (ROLEID);
create index IDX_RESPERMISSION_OPID_FK on RESPERMISSION (OPID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_RESPERMISSION_RESID_FK on RESPERMISSION (RESID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_RESPERMISSION_ROLEID_FK on RESPERMISSION (ROLEID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_RESPERM_ORGANIZATIONID on RESPERMISSION (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating TIMEITEM...
create table TIMEITEM
(
  TIMEITEMID     VARCHAR2(40) not null,
  SCHEMAID       VARCHAR2(40),
  TIMEITEMTYPE   VARCHAR2(40),
  TIMESPAN       NUMBER,
  CREATED        DATE default SYSDATE not null,
  CREATEDBY      VARCHAR2(40),
  MODIFIED       DATE default SYSDATE not null,
  MODIFIEDBY     VARCHAR2(40),
  ORGANIZATIONID VARCHAR2(40),
  TIMES          NUMBER,
  FLOATTIME      NUMBER,
  TIMESPOT       VARCHAR2(40),
  ISVOID         CHAR(1) default 'N' not null
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table TIMEITEM
  is 'ʱ����';
comment on column TIMEITEM.TIMEITEMID
  is 'ʱ����ID';
comment on column TIMEITEM.SCHEMAID
  is 'ģ��';
comment on column TIMEITEM.TIMEITEMTYPE
  is 'ʱ��������';
comment on column TIMEITEM.TIMESPAN
  is 'ʱ����';
comment on column TIMEITEM.CREATED
  is '����ʱ��';
comment on column TIMEITEM.CREATEDBY
  is '������';
comment on column TIMEITEM.MODIFIED
  is '�޸�ʱ��';
comment on column TIMEITEM.MODIFIEDBY
  is '�޸���';
comment on column TIMEITEM.ORGANIZATIONID
  is 'ORGANIZATIONID';
comment on column TIMEITEM.TIMES
  is 'ÿ���Ѳ�����';
comment on column TIMEITEM.FLOATTIME
  is '����ʱ��';
comment on column TIMEITEM.TIMESPOT
  is 'ʱ���';
comment on column TIMEITEM.ISVOID
  is '����';
alter table TIMEITEM
  add constraint PK_TIMEITEM primary key (TIMEITEMID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TIMEITEM
  add constraint FK_TIMEITEM_REFERENCE_TIMESCHE foreign key (SCHEMAID)
  references TIMESCHEMA (SCHEMAID);
create index IDX_TIMEITEM_ORGANIZATIONID on TIMEITEM (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating USERROLE...
create table USERROLE
(
  ROLEID         VARCHAR2(40) not null,
  PASSPORTID     VARCHAR2(40) not null,
  ORGANIZATIONID VARCHAR2(40) not null
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table USERROLE
  is '�û���ɫ';
comment on column USERROLE.ROLEID
  is '��ɫID';
comment on column USERROLE.PASSPORTID
  is '�˺�ID';
comment on column USERROLE.ORGANIZATIONID
  is 'ORGANIZATIONID';
alter table USERROLE
  add constraint PK_USERROLE primary key (ROLEID, PASSPORTID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USERROLE
  add constraint FK_USERROLE_USERROLE2_PASSPORT foreign key (PASSPORTID)
  references PASSPORT (PASSPORTID);
alter table USERROLE
  add constraint FK_USERROLE_USERROLE_ROLE foreign key (ROLEID)
  references ROLE (ROLEID);
create index IDX_USERROLE_ORGANIZATIONID on USERROLE (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_USERROLE_PASSPORTID_FK on USERROLE (PASSPORTID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_USERROLE_ROLEID_FK on USERROLE (ROLEID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating VEHICLETASK...
create table VEHICLETASK
(
  TASKID          VARCHAR2(40) not null,
  TASKNAME        VARCHAR2(60),
  PUBLICTIME      DATE default SYSDATE not null,
  STARTTIME       DATE default SYSDATE not null,
  ENDTIME         DATE default SYSDATE not null,
  MODEL           VARCHAR2(200),
  TASKTYPE        VARCHAR2(40),
  CHARGEMAN       VARCHAR2(40),
  LICENSEPLATENUM VARCHAR2(400),
  ISGASSUPPLIED   CHAR(1) default 'N' not null,
  ISWATERSUPPLIED CHAR(1) default 'N' not null,
  ISREPAIRED      CHAR(1) default 'N' not null,
  CREATED         DATE default SYSDATE not null,
  CREATEDBY       VARCHAR2(40),
  MODIFIED        DATE default SYSDATE not null,
  MODIFIEDBY      VARCHAR2(40),
  ISVOID          CHAR(1) default 'N' not null,
  TASKCODE        VARCHAR2(60),
  MEMO            VARCHAR2(2000),
  TRACE           VARCHAR2(4000)
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table VEHICLETASK
  is '�г�����';
comment on column VEHICLETASK.TASKID
  is '����ID';
comment on column VEHICLETASK.TASKNAME
  is '��������';
comment on column VEHICLETASK.PUBLICTIME
  is '�´�ʱ��';
comment on column VEHICLETASK.STARTTIME
  is '��ʼʱ��';
comment on column VEHICLETASK.ENDTIME
  is '����ʱ��';
comment on column VEHICLETASK.MODEL
  is '�����ͺ�';
comment on column VEHICLETASK.TASKTYPE
  is '��������';
comment on column VEHICLETASK.CHARGEMAN
  is '������';
comment on column VEHICLETASK.LICENSEPLATENUM
  is '���ƺ�';
comment on column VEHICLETASK.ISGASSUPPLIED
  is '�Ƿ����';
comment on column VEHICLETASK.ISWATERSUPPLIED
  is '�Ƿ��ˮ';
comment on column VEHICLETASK.ISREPAIRED
  is '�Ƿ�ά��';
comment on column VEHICLETASK.CREATED
  is '����ʱ��';
comment on column VEHICLETASK.CREATEDBY
  is '������';
comment on column VEHICLETASK.MODIFIED
  is '�޸�ʱ��';
comment on column VEHICLETASK.MODIFIEDBY
  is '�޸���';
comment on column VEHICLETASK.ISVOID
  is '����';
alter table VEHICLETASK
  add constraint PK_VEHICLETASK primary key (TASKID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table VEHICLETASK
  add constraint FK_VEHICLET_REFERENCE_EMPLOYEE foreign key (CHARGEMAN)
  references EMPLOYEE (EMPID);
alter table VEHICLETASK
  add constraint FK_VEHICLET_REFERENCE_ENUMERAT foreign key (TASKTYPE)
  references ENUMERATION (ENUMID);

prompt Creating VEHICLETASKDATA...
create table VEHICLETASKDATA
(
  VTDID      VARCHAR2(40) not null,
  TASKID     VARCHAR2(40),
  VIDEOURL   VARCHAR2(1000),
  LATITUDE   NUMBER(17,14),
  LONGITUDE  NUMBER(17,14),
  IMAGEURL   VARCHAR2(1000),
  TICKETID   VARCHAR2(40),
  TICKETTYPE VARCHAR2(40),
  CREATED    DATE default SYSDATE not null,
  CREATEDBY  VARCHAR2(40),
  MODIFIED   DATE default SYSDATE not null,
  MODIFIEDBY VARCHAR2(40),
  ISVOID     CHAR(1) default 'N' not null
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table VEHICLETASKDATA
  is '�г�����';
comment on column VEHICLETASKDATA.VTDID
  is '�г�����ID';
comment on column VEHICLETASKDATA.TASKID
  is '����ID';
comment on column VEHICLETASKDATA.VIDEOURL
  is 'VIDEOURL';
comment on column VEHICLETASKDATA.LATITUDE
  is 'γ��';
comment on column VEHICLETASKDATA.LONGITUDE
  is '����';
comment on column VEHICLETASKDATA.IMAGEURL
  is 'ͼƬλ��';
comment on column VEHICLETASKDATA.TICKETID
  is 'Ʊ�ݱ��';
comment on column VEHICLETASKDATA.TICKETTYPE
  is 'Ʊ������';
comment on column VEHICLETASKDATA.CREATED
  is '����ʱ��';
comment on column VEHICLETASKDATA.CREATEDBY
  is '������';
comment on column VEHICLETASKDATA.MODIFIED
  is '�޸�ʱ��';
comment on column VEHICLETASKDATA.MODIFIEDBY
  is '�޸���';
comment on column VEHICLETASKDATA.ISVOID
  is '����';
alter table VEHICLETASKDATA
  add constraint PK_VEHICLETASKDATA primary key (VTDID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table VEHICLETASKDATA
  add constraint FK_VEHICLET_REFERENCE_VEHICLET foreign key (TASKID)
  references VEHICLETASK (TASKID);

prompt Creating VIDEO...
create table VIDEO
(
  VIDEOID        VARCHAR2(40) not null,
  EVENTID        VARCHAR2(40),
  VIDEONAME      VARCHAR2(100),
  MEMO           VARCHAR2(500),
  VIDEOURL       VARCHAR2(2000),
  CREATED        DATE default SYSDATE not null,
  CREATEDBY      VARCHAR2(40),
  MODIFIED       DATE default SYSDATE not null,
  MODIFIEDBY     VARCHAR2(40),
  ORGANIZATIONID VARCHAR2(40),
  SUITEID        VARCHAR2(40),
  ISVOID         CHAR(1) default 'N' not null,
  DURATION       NUMBER,
  TRACE          VARCHAR2(4000)
)
tablespace SQMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table VIDEO
  is '�������ʱ�ɼ�����Ƶ����';
comment on column VIDEO.VIDEOID
  is 'VideoId';
comment on column VIDEO.EVENTID
  is '�¼�ID';
comment on column VIDEO.VIDEONAME
  is 'VideoName';
comment on column VIDEO.MEMO
  is 'Memo';
comment on column VIDEO.VIDEOURL
  is 'VideoUrl';
comment on column VIDEO.CREATED
  is 'Created';
comment on column VIDEO.CREATEDBY
  is 'CreatedBy';
comment on column VIDEO.MODIFIED
  is 'Modified';
comment on column VIDEO.MODIFIEDBY
  is 'ModifiedBy';
comment on column VIDEO.ORGANIZATIONID
  is 'ORGANIZATIONID';
comment on column VIDEO.SUITEID
  is 'SUITEID';
comment on column VIDEO.ISVOID
  is 'ISVOID';
comment on column VIDEO.DURATION
  is 'DURATION';
alter table VIDEO
  add constraint PK_VIDEO primary key (VIDEOID)
  using index 
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ORGANIZATIONID on VIDEO (ORGANIZATIONID)
  tablespace SQMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for ENUMERATION...
alter table ENUMERATION disable all triggers;
prompt Disabling triggers for EQUIPMENT...
alter table EQUIPMENT disable all triggers;
prompt Disabling triggers for GEO...
alter table GEO disable all triggers;
prompt Disabling triggers for ORGANIZATION...
alter table ORGANIZATION disable all triggers;
prompt Disabling triggers for EMPLOYEE...
alter table EMPLOYEE disable all triggers;
prompt Disabling triggers for TIMESCHEMA...
alter table TIMESCHEMA disable all triggers;
prompt Disabling triggers for EMERGENCYEVENT...
alter table EMERGENCYEVENT disable all triggers;
prompt Disabling triggers for LOG...
alter table LOG disable all triggers;
prompt Disabling triggers for MENU...
alter table MENU disable all triggers;
prompt Disabling triggers for PROJECT...
alter table PROJECT disable all triggers;
prompt Disabling triggers for ROAD...
alter table ROAD disable all triggers;
prompt Disabling triggers for MPASSIGNMENT...
alter table MPASSIGNMENT disable all triggers;
prompt Disabling triggers for MONITORPOINTINVIDEO...
alter table MONITORPOINTINVIDEO disable all triggers;
prompt Disabling triggers for OPERATION...
alter table OPERATION disable all triggers;
prompt Disabling triggers for PASSPORT...
alter table PASSPORT disable all triggers;
prompt Disabling triggers for QUALITY...
alter table QUALITY disable all triggers;
prompt Disabling triggers for RESOURCEITEM...
alter table RESOURCEITEM disable all triggers;
prompt Disabling triggers for ROLE...
alter table ROLE disable all triggers;
prompt Disabling triggers for RESPERMISSION...
alter table RESPERMISSION disable all triggers;
prompt Disabling triggers for TIMEITEM...
alter table TIMEITEM disable all triggers;
prompt Disabling triggers for USERROLE...
alter table USERROLE disable all triggers;
prompt Disabling triggers for VEHICLETASK...
alter table VEHICLETASK disable all triggers;
prompt Disabling triggers for VEHICLETASKDATA...
alter table VEHICLETASKDATA disable all triggers;
prompt Disabling triggers for VIDEO...
alter table VIDEO disable all triggers;
prompt Disabling foreign key constraints for GEO...
alter table GEO disable constraint FK_GEO_RELGEO_GEO;
prompt Disabling foreign key constraints for ORGANIZATION...
alter table ORGANIZATION disable constraint FK_ORGANIZA_REFERENCE_ENUMERAT;
alter table ORGANIZATION disable constraint FK_ORGANIZA_RELORGCIT_GEO;
alter table ORGANIZATION disable constraint FK_ORGANIZA_RELORGCOU_GEO;
alter table ORGANIZATION disable constraint FK_ORGANIZA_RELORGPRO_GEO;
alter table ORGANIZATION disable constraint FK_ORGANIZA_RELPARENT_ORGANIZA;
prompt Disabling foreign key constraints for EMPLOYEE...
alter table EMPLOYEE disable constraint FK_EMPLOYEE_EMP_DEPT__ORGANIZA;
alter table EMPLOYEE disable constraint FK_EMPLOYEE_EMP_ORG_R_ORGANIZA;
alter table EMPLOYEE disable constraint FK_EMPLOYEE_REFERENCE_ENUMERAT;
alter table EMPLOYEE disable constraint FK_EMPLOYEE_RELATIONS_ENUMERAT;
alter table EMPLOYEE disable constraint FK_EMPLOYEE_RELEQUBIN_EQUIPMEN;
prompt Disabling foreign key constraints for EMERGENCYEVENT...
alter table EMERGENCYEVENT disable constraint FK_EMERGENC_REFERENCE_EMPLOYEE;
alter table EMERGENCYEVENT disable constraint FK_EMERGENC_REFERENCE_TIMESCHE;
prompt Disabling foreign key constraints for PROJECT...
alter table PROJECT disable constraint FK_PROJECT_REFERENCE_EMPLOYEE;
prompt Disabling foreign key constraints for ROAD...
alter table ROAD disable constraint FK_ROAD_RELATIONS_PROJECT;
prompt Disabling foreign key constraints for MPASSIGNMENT...
alter table MPASSIGNMENT disable constraint FK_MPASSIGN_REFERENCE_EMERGENC;
alter table MPASSIGNMENT disable constraint FK_MPASSIGN_REFERENCE_ENUMERAT;
alter table MPASSIGNMENT disable constraint FK_MPASSIGN_REFERENCE_TIMESCHE;
alter table MPASSIGNMENT disable constraint FK_MPASSIGN_RELATIONS_ROAD;
prompt Disabling foreign key constraints for MONITORPOINTINVIDEO...
alter table MONITORPOINTINVIDEO disable constraint FK_MONITORP_REFERENCE_MPASSIGN;
prompt Disabling foreign key constraints for PASSPORT...
alter table PASSPORT disable constraint FK_PASSPORT_EMPPASSPO_EMPLOYEE;
prompt Disabling foreign key constraints for QUALITY...
alter table QUALITY disable constraint FK_QUALITY_REFERENCE_ROAD;
alter table QUALITY disable constraint FK_QUALITY_RELATIONS_ENUMERAT;
alter table QUALITY disable constraint FK_QUALITY_RELCHARGE_EMPLOYEE;
alter table QUALITY disable constraint FK_QUALITY_RELEMERGE_EMPLOYEE;
alter table QUALITY disable constraint FK_QUALITY_RELEMPLOY_EMPLOYEE;
alter table QUALITY disable constraint FK_QUALITY_RELWORKUN_ORGANIZA;
prompt Disabling foreign key constraints for RESPERMISSION...
alter table RESPERMISSION disable constraint FK_RESPERMI_REFERENCE_OPERATIO;
alter table RESPERMISSION disable constraint FK_RESPERMI_REFERENCE_RESOURCE;
alter table RESPERMISSION disable constraint FK_RESPERMI_REFERENCE_ROLE;
prompt Disabling foreign key constraints for TIMEITEM...
alter table TIMEITEM disable constraint FK_TIMEITEM_REFERENCE_TIMESCHE;
prompt Disabling foreign key constraints for USERROLE...
alter table USERROLE disable constraint FK_USERROLE_USERROLE2_PASSPORT;
alter table USERROLE disable constraint FK_USERROLE_USERROLE_ROLE;
prompt Disabling foreign key constraints for VEHICLETASK...
alter table VEHICLETASK disable constraint FK_VEHICLET_REFERENCE_EMPLOYEE;
alter table VEHICLETASK disable constraint FK_VEHICLET_REFERENCE_ENUMERAT;
prompt Disabling foreign key constraints for VEHICLETASKDATA...
alter table VEHICLETASKDATA disable constraint FK_VEHICLET_REFERENCE_VEHICLET;
prompt Loading ENUMERATION...
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('monitorpoint', 'monitorpoint', '��ص�', '_mptype', null, to_date('24-09-2009', 'dd-mm-yyyy'), 'admin', to_date('24-09-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('accident', 'accident', '�¹��ֳ�', '_mptype', null, to_date('24-09-2009', 'dd-mm-yyyy'), 'admin', to_date('24-09-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('trashentrance', 'trashentrance', '����', '_mptype', null, to_date('24-09-2009', 'dd-mm-yyyy'), 'admin', to_date('24-09-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_mun_main_road', '_road_type_mun_main_road', '��������·', '_road_type', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_mun_normal_road', '_road_type_mun_normal_road', '������·', '_road_type', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_industry', '_road_typeindustry', '��ҵ԰��', '_road_type', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_comm_road', '_road_type_comm_road', '������·', '_road_type', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_triple_confuse', '_road_type_triple_confuse', '������ҵ', '_road_type', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_garden_road', '_road_type_garden_road', '԰����·', '_road_type', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_qc_state_valid', '_qc_state_valid', '��Ч', '_qc_state', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_qc_state_not_valid', '_qc_state_not_valid', '��Ч', '_qc_state', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_qc_type_normal', '_qc_type_normal', '��̬���', '_qc_type', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_qc_type_dynamic', '_qc_type_dynamic', 'Ѳ��', '_qc_type', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('incumbency', 'incumbency', '��ְ', '_empstatus', null, to_date('09-08-2009', 'dd-mm-yyyy'), 'admin', to_date('09-08-2009', 'dd-mm-yyyy'), 'adimin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('dimission', 'dimission', '��ְ', '_empstatus', null, to_date('09-08-2009', 'dd-mm-yyyy'), 'admin', to_date('09-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('department', 'department', '����', '_org', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('organization', 'organization', '����', '_org', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('midschool', 'midschool', '��ѧ', '_degree', null, to_date('09-08-2009', 'dd-mm-yyyy'), 'admin', to_date('09-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('highschool', 'highschool', 'ѧʿ', '_degree', null, to_date('09-08-2009', 'dd-mm-yyyy'), 'admin', to_date('09-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('master', 'master', '˶ʿ', '_degree', null, to_date('09-08-2009', 'dd-mm-yyyy'), 'admin', to_date('09-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('male', 'male', '��', '_sex', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('female', 'female', 'Ů', '_sex', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('picture', 'picture', 'ͼ��', '_quality_data_type', null, to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('video', 'video', '��Ƶ', '_quality_data_type', null, to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('2', 'mp_emergency', '����', '_mp_importance', null, to_date('05-09-2009', 'dd-mm-yyyy'), 'admin', to_date('05-09-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('1', 'mp_critical', '�ؼ�', '_mp_importance', null, to_date('05-09-2009', 'dd-mm-yyyy'), 'admin', to_date('05-09-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('0', 'mp_normal', '��ͨ', '_mp_importance', null, to_date('05-09-2009', 'dd-mm-yyyy'), 'admin', to_date('05-09-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('watervehicle', 'watervehicle', '��ˮ������', '_vt_tasktype', null, to_date('30-09-2009', 'dd-mm-yyyy'), 'admin', to_date('30-09-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('junkvehicle', 'junkvehicle', '����������', '_vt_tasktype', null, to_date('30-09-2009', 'dd-mm-yyyy'), 'admin', to_date('30-09-2009', 'dd-mm-yyyy'), 'admin');
commit;
prompt 29 records loaded
prompt Loading EQUIPMENT...
insert into EQUIPMENT (EQUID, EQUCODE, EQUNAME, IDENTIFY, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('t2', 'EQ0002', '�豸2', '13252145785', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('24-09-2009', 'dd-mm-yyyy'), 't2', 'N', 't1', null);
insert into EQUIPMENT (EQUID, EQUCODE, EQUNAME, IDENTIFY, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('t3', 'EQ0003', '�豸3', '15425123658', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 't1', 'N', 't1', null);
insert into EQUIPMENT (EQUID, EQUCODE, EQUNAME, IDENTIFY, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('t4', 'EQ0004', '�豸4', '15425123652', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('25-08-2009', 'dd-mm-yyyy'), 't2', 'N', 't1', null);
insert into EQUIPMENT (EQUID, EQUCODE, EQUNAME, IDENTIFY, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('t5', 'EQ0005', '�豸5', '15421547896', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 'N', 't1', null);
insert into EQUIPMENT (EQUID, EQUCODE, EQUNAME, IDENTIFY, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('t6', 'EQ0006', '�豸6', '13021458789', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 'N', 't1', null);
insert into EQUIPMENT (EQUID, EQUCODE, EQUNAME, IDENTIFY, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('t7', 'EQ0007', '�豸7', '13458452369', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 'N', 't1', null);
insert into EQUIPMENT (EQUID, EQUCODE, EQUNAME, IDENTIFY, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('t8', 'EQ0008', '�豸8', '14574589652', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 'N', 't1', null);
insert into EQUIPMENT (EQUID, EQUCODE, EQUNAME, IDENTIFY, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('t9', 'EQ0009', '�豸9', '16547845265', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 'N', 't1', null);
commit;
prompt 8 records loaded
prompt Loading GEO...
insert into GEO (GEOID, PARENTGEO, GEOCODE, GEONAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID)
values ('T1', null, '111', 'NONAME', null, null, null, null, null, 'N');
insert into GEO (GEOID, PARENTGEO, GEOCODE, GEONAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID)
values ('T2', null, '222', 'NONAME', null, null, null, null, null, 'N');
insert into GEO (GEOID, PARENTGEO, GEOCODE, GEONAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID)
values ('t3', null, 'code01', 'NONAME', null, null, null, null, null, null);
commit;
prompt 3 records loaded
prompt Loading ORGANIZATION...
insert into ORGANIZATION (ORGID, COUNTRY, CITY, PARENTORG, PROVINCE, ORGCODE, ORGNAME, ORGTYPE, ORGALIAS, ORGSTATUS, ORGADDRESS, ZIPCODE, CONTACT, CONTACTTEL, EMAIL, MEMO, CREATED, CREATEDBY, MODIFIEDBY, SUITEID, DATABASEID, MODIFIED, ORGANIZATIONID, ISVOID)
values ('t1', null, null, null, null, 'MAINTEST_ORG', 'ר�ò��Ի���', 'organization', '���Ի���', '����', '������ɳƺ����', '400044', '����Ա', '13542154879', 'yinpsoft@gmail.com', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 'admin', null, null, to_date('14-08-2009', 'dd-mm-yyyy'), null, 'N');
insert into ORGANIZATION (ORGID, COUNTRY, CITY, PARENTORG, PROVINCE, ORGCODE, ORGNAME, ORGTYPE, ORGALIAS, ORGSTATUS, ORGADDRESS, ZIPCODE, CONTACT, CONTACTTEL, EMAIL, MEMO, CREATED, CREATEDBY, MODIFIEDBY, SUITEID, DATABASEID, MODIFIED, ORGANIZATIONID, ISVOID)
values ('t2', null, null, 't1', null, 'MAINTEST_DEPT', 'ר�ò��Բ���', 'department', '���Բ���', '����', '������ɳƺ����', '400044', '����Ա', '13542154879', 'fishtrees@gmail.com', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 'admin', null, null, to_date('14-08-2009', 'dd-mm-yyyy'), 't1', 'N');
insert into ORGANIZATION (ORGID, COUNTRY, CITY, PARENTORG, PROVINCE, ORGCODE, ORGNAME, ORGTYPE, ORGALIAS, ORGSTATUS, ORGADDRESS, ZIPCODE, CONTACT, CONTACTTEL, EMAIL, MEMO, CREATED, CREATEDBY, MODIFIEDBY, SUITEID, DATABASEID, MODIFIED, ORGANIZATIONID, ISVOID)
values ('t3', null, null, 't1', null, 'MAINTEST_SUBORG', '���Է�֧����', 'organization', '���Ի���', '����', '���������ƺ', '400043', '����Ա', '132456789', 'yul@126.com', null, to_date('15-08-2009', 'dd-mm-yyyy'), 'admin', 'admin', null, null, to_date('15-08-2009', 'dd-mm-yyyy'), 't1', 'N');
insert into ORGANIZATION (ORGID, COUNTRY, CITY, PARENTORG, PROVINCE, ORGCODE, ORGNAME, ORGTYPE, ORGALIAS, ORGSTATUS, ORGADDRESS, ZIPCODE, CONTACT, CONTACTTEL, EMAIL, MEMO, CREATED, CREATEDBY, MODIFIEDBY, SUITEID, DATABASEID, MODIFIED, ORGANIZATIONID, ISVOID)
values ('t4', null, null, 't2', null, 'MAINTEST_SUBDEPT', '���Է�֧����', 'department', '���Բ���', '����', '�����о�����', '400021', '����Ա', '423423423432', 'yin.p.soft@gmail.com', null, to_date('15-08-2009', 'dd-mm-yyyy'), 'admin', 'admin', null, null, to_date('15-08-2009', 'dd-mm-yyyy'), 't1', 'N');
commit;
prompt 4 records loaded
prompt Loading EMPLOYEE...
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('361', 't4', 't2', 'female', '���巼', 'EM-633886439328437500', 'incumbency', '13254124589', 'N', null, '65112415', null, 'highschool', null, to_date('15-09-2009', 'dd-mm-yyyy'), 't2', 't2', to_date('15-09-2009 20:40:01', 'dd-mm-yyyy hh24:mi:ss'), 't1', null, 'Y');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('400', 't2', 't5', 'male', 'demo2', 'EM-633865768122968750', 'incumbency', '2342342', 'N', null, '45345', null, 'midschool', null, to_date('22-08-2009', 'dd-mm-yyyy'), 't2', 't2', to_date('22-08-2009 22:27:38', 'dd-mm-yyyy hh24:mi:ss'), 't1', null, 'N');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('357', 't2', 't2', 'male', '�����û�', 'EM-633858074279843751', 'incumbency', '234324', 'N', 'admin', '23432', to_date('21-08-2009', 'dd-mm-yyyy'), 'midschool', null, to_date('30-08-2009', 'dd-mm-yyyy'), 'admin', 't2', to_date('30-08-2009 20:17:14', 'dd-mm-yyyy hh24:mi:ss'), 't1', null, 'N');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('58', 't2', 't3', 'male', 'admin', 'EM-633853491247656250', 'incumbency', '34234243', 'N', 'asdf', '23432', null, 'midschool', null, to_date('13-08-2009', 'dd-mm-yyyy'), null, 't1', to_date('13-08-2009 23:53:12', 'dd-mm-yyyy hh24:mi:ss'), 't1', null, 'Y');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('59', 't2', 't4', 'male', 'admin', 'EM-633853491247656250', 'asdf', '34234243', 'N', 'asdf', '23432', null, 'midschool', null, to_date('08-08-2009', 'dd-mm-yyyy'), null, null, to_date('08-08-2009', 'dd-mm-yyyy'), 't1', null, 'Y');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('117', 't2', 't7', 'male', '��ط', 'EM-633853725689375000', 'incumbency', '435324523', 'N', 'ad', '234324', null, 'midschool', null, to_date('11-08-2009', 'dd-mm-yyyy'), 'devuser', 'devuser', to_date('11-08-2009', 'dd-mm-yyyy'), 't1', null, 'Y');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('144', 't2', 't2', 'male', '���Բ���', 'EM-633854550213281250', 'incumbency', '32424', 'N', null, '24324223', null, 'midschool', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'devuser', 't1', to_date('14-08-2009 22:55:03', 'dd-mm-yyyy hh24:mi:ss'), 't1', null, 'N');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('65', 't2', 't9', 'male', 'admin', 'EM-633853498841562500', 'asdf', '324324', 'N', 'sdfs', '23432', null, 'midschool', null, to_date('08-08-2009', 'dd-mm-yyyy'), null, null, to_date('08-08-2009', 'dd-mm-yyyy'), 't1', null, 'Y');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('1', 't2', 't8', 'male', 'test1_modified', 'code0001', 'incumbency', null, 'N', null, null, to_date('11-08-2009', 'dd-mm-yyyy'), 'midschool', null, to_date('11-08-2009', 'dd-mm-yyyy'), 'devuser', 'devuser', to_date('11-08-2009', 'dd-mm-yyyy'), 't1', null, 'Y');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('356', 't2', 't6', 'male', 'testemployee', 'EM-633858074279843750', 'incumbency', '4352342342', 'N', null, '435324', null, 'midschool', null, to_date('14-08-2009', 'dd-mm-yyyy'), 't1', 't1', to_date('14-08-2009 00:45:12', 'dd-mm-yyyy hh24:mi:ss'), 't1', null, 'Y');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('359', 't2', 't5', 'male', 'zy2', 'EM-633908957133750000', 'incumbency', '435345435', 'N', null, '4324324', null, 'midschool', null, to_date('11-10-2009', 'dd-mm-yyyy'), 't2', 't2', to_date('11-10-2009 22:09:07', 'dd-mm-yyyy hh24:mi:ss'), 't1', null, 'N');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('360', 't2', 't5', 'male', 'zy2', 'EM-633908957133750000', 'incumbency', '435345435', 'N', null, '4324324', null, 'midschool', null, to_date('11-10-2009', 'dd-mm-yyyy'), 't2', 't2', to_date('11-10-2009 22:18:37', 'dd-mm-yyyy hh24:mi:ss'), 't1', null, 'Y');
commit;
prompt 12 records loaded
prompt Loading TIMESCHEMA...
insert into TIMESCHEMA (SCHEMAID, SCHEMANAME, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, FLOATTIME, BEGINTIME, ENDTIME, ISVOID)
values ('0', '��ؼƻ���', to_date('08-09-2009', 'dd-mm-yyyy'), 't2', to_date('10-09-2009', 'dd-mm-yyyy'), 't2', 't1', 3, to_date('10-09-2009 01:30:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-09-2009 05:30:00', 'dd-mm-yyyy hh24:mi:ss'), 'N');
insert into TIMESCHEMA (SCHEMAID, SCHEMANAME, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, FLOATTIME, BEGINTIME, ENDTIME, ISVOID)
values ('1', '��ؼƻ�һ', to_date('10-09-2009', 'dd-mm-yyyy'), 't2', to_date('12-09-2009', 'dd-mm-yyyy'), 't2', 't1', 3, to_date('13-09-2009 08:30:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-09-2009 17:30:00', 'dd-mm-yyyy hh24:mi:ss'), 'N');
commit;
prompt 2 records loaded
prompt Loading EMERGENCYEVENT...
insert into EMERGENCYEVENT (EVENTID, EVENTCODE, SCHEMAID, EVENTNAME, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, CHECKTIME, CHECKUNIT, PRIVILIGE, EMERGENCYCHARGEPERSON, MEMO)
values ('21', 'EM-633892490282187500', '0', 'gggg', 'Y', to_date('22-09-2009', 'dd-mm-yyyy'), 't2', to_date('22-09-2009', 'dd-mm-yyyy'), 't2', 't1', to_date('01-09-2009', 'dd-mm-yyyy'), 'dsfsd', '2', '59', 'dsfads');
insert into EMERGENCYEVENT (EVENTID, EVENTCODE, SCHEMAID, EVENTNAME, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, CHECKTIME, CHECKUNIT, PRIVILIGE, EMERGENCYCHARGEPERSON, MEMO)
values ('3', 'EM-633892187313906250', '0', 'testevent', 'N', to_date('22-09-2009', 'dd-mm-yyyy'), 't2', to_date('22-09-2009', 'dd-mm-yyyy'), 't2', 't1', to_date('22-09-2009 09:33:33', 'dd-mm-yyyy hh24:mi:ss'), 'testjjjlllss', '1', '357', 'asdfas');
insert into EMERGENCYEVENT (EVENTID, EVENTCODE, SCHEMAID, EVENTNAME, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, CHECKTIME, CHECKUNIT, PRIVILIGE, EMERGENCYCHARGEPERSON, MEMO)
values ('A00001', 'EM000001', '1', '����շ�վ������©����', 'N', to_date('22-09-2009', 'dd-mm-yyyy'), null, to_date('07-10-2009', 'dd-mm-yyyy'), 't2', 't1', to_date('22-09-2009', 'dd-mm-yyyy'), '��������껷����1', '2', '1', null);
commit;
prompt 3 records loaded
prompt Loading LOG...
insert into LOG (LOGID, LOGCODE, LOGTYPE, LOGLEVEL, LOGSOURCE, CONTENT, RECORDTIME, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('1', 'LO-633900437698281250', '89f0c21d-0326-4984-a', 'be7836a7-3c0e-45c3-a', '52df1e96-b57f-4198-8dfa-2f82947c7d15', null, to_date('02-10-2009 01:29:29', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('02-10-2009', 'dd-mm-yyyy'), 't2', to_date('02-10-2009 01:36:00', 'dd-mm-yyyy hh24:mi:ss'), 't2', 't1', null);
commit;
prompt 1 records loaded
prompt Loading MENU...
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_trashentrancelist', '���ڼ�ع���', '/Views/Quality/TrashEntranceList.aspx?p=trashentrancelist', 'trashentrancelist', null, '_qm', '18', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_accidentlist', '�¹��ֳ���ع���', '/Views/Quality/AccidentList.aspx?p=accidentlist', 'accidentlist', null, '_qm', '19', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_emergencylist', 'Ӧ���¼�����', '/Views/Quality/EmergencyEventList.aspx?p=emergencylist', 'emergencylist', null, '_emergency', '17', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_emergencymonitor', 'Ӧ���¼����', '/Views/Quality/EmergencyMonitor.aspx?p=EmergencyMonitor', 'EmergencyMonitor', null, '_emergency', '26', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_projectlist', '��Ŀ����', '/Views/Project/ProjectList.aspx?p=projectlist', 'projectlist', null, '_basedata', '14', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_exit', '�˳�', '/Views/Security/Login.aspx?status=q', '__pub__', null, '_app', '5', '_pub');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_app', 'Ӧ�ó����', null, '_app', null, '_root', '0', '_pub');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_qm', '������ع���', null, 'qualitymonitor', null, '_app', '1', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_companyqualitymonitor', '������˾�������', '/Views/Quality/CompanyQualityMonitor.aspx?p=QualityCompanyQualityMonitor', 'QualityCompanyQualityMonitor', null, '_qm', '10', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_mam', '���������������', '/Views/Quality/MunicipalAdminMonitor.aspx?p=QualityMunicipalAdminMonitor', 'QualityMunicipalAdminMonitor', null, '_qm', '11', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_som', '�����ල�������', '/Views/Quality/SanitationOfficeMonitor.aspx?p=QualitySanitationOfficeMonitor', 'QualitySanitationOfficeMonitor', null, '_qm', '12', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_basedata', '�������ݹ���', null, 'basedata', null, '_app', '4', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_dept', '��֯��������', '/Views/Basedata/OrganizationList.aspx?p=OrganizationList', 'OrganizationList', null, '_basedata', '20', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_employeelist', 'ְԱ����', '/Views/Basedata/EmployeeList.aspx?p=employeelist', 'employeelist', null, '_basedata', '21', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_equlist', '�豸����', '/Views/Basedata/EquipmentList.aspx?p=equlist', 'equlist', null, '_basedata', '22', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_rolelist', '��ɫ����', '/Views/Basedata/RoleList.aspx?p=rolelist', 'rolelist', null, '_basedata', '23', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_reslist', '��Դ����', '/Views/Basedata/ResourceList.aspx?p=reslist', 'reslist', null, '_basedata', '24', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_operationlist', '��������', '/Views/Basedata/OperationList.aspx?p=operationlist', 'operationlist', null, '_basedata', '25', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_RoadList', '·�ι���', '/Views/Road/RoadList.aspx?p=roadlist', 'roadlist', null, '_basedata', '13', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_mplist', '��ص����', '/Views/Quality/MonitorPointList.aspx?p=mplist', 'mplist', null, '_qm', '14', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_tslist', '���ʱ�������', '/Views/Quality/TimeSchemaList.aspx?p=timeschemalist', 'timeschemalist', null, '_qm', '15', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_aplist', '���������б�', '/Views/Quality/QualityAppraisalList.aspx?p=qalist', 'qalist', null, '_qm', '16', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_vehiclemonitor', '�г�������', '/Views/Vehicle/VehicleMonitor.aspx?p=VehicleMonitor', 'VehicleMonitor', null, '_vehicle', '27', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_vtlist', '�г�����', '/Views/Vehicle/VehicleTaskList.aspx?p=vtlist', 'vtlist', null, '_vehicle', '190', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_vehicle', '�г���ع���', null, 'vehicle', null, '_app', '2', '_pub');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_emergency', 'Ӧ���¼�', null, 'emergency', null, '_app', '3', '_app');
commit;
prompt 26 records loaded
prompt Loading PROJECT...
insert into PROJECT (PROJECTID, EMPID, PROJECTCODE, PROJECTNAME, TOTALWORKTIME, TOTALSCALE, ASSISTAMOUNT, LEADERAMOUNT, VISELEADERAMOUNT, TOTALWORKERAMOUNT, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID)
values ('4', '361', 'GC00001', '�۳�', 735, 266119.6, 1, 2, 0, 26, '�۳�A����˫��6�������ܱ߹��ض�' || chr(13) || '' || chr(10) || '�۳�D�����ڽ��������', to_date('15-09-2009 20:52:10', 'dd-mm-yyyy hh24:mi:ss'), '357', to_date('15-09-2009 20:52:10', 'dd-mm-yyyy hh24:mi:ss'), '357', 't1', null, 'N');
insert into PROJECT (PROJECTID, EMPID, PROJECTCODE, PROJECTNAME, TOTALWORKTIME, TOTALSCALE, ASSISTAMOUNT, LEADERAMOUNT, VISELEADERAMOUNT, TOTALWORKERAMOUNT, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID)
values ('6', '361', 'GC00002', '������ƺ', 24.5, 82180, 0, 1, 0, 27, '���ж࣬������̯��࣬������', to_date('15-09-2009 21:01:01', 'dd-mm-yyyy hh24:mi:ss'), '357', to_date('15-09-2009 21:01:01', 'dd-mm-yyyy hh24:mi:ss'), '357', 't1', null, 'N');
insert into PROJECT (PROJECTID, EMPID, PROJECTCODE, PROJECTNAME, TOTALWORKTIME, TOTALSCALE, ASSISTAMOUNT, LEADERAMOUNT, VISELEADERAMOUNT, TOTALWORKERAMOUNT, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID)
values ('A00001', '1', 'A00001', '����·', null, 206191.29, null, null, null, null, null, to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', 't1', null, 'N');
commit;
prompt 3 records loaded
prompt Loading ROAD...
insert into ROAD (ROADID, PROJECTID, ROADCODE, ROADNAME, ROADTYPE, BEGINTIME, ENDTIME, WORKTIME, WORKERAMOUNT, MEMO, AVGWORKERAMOUNT, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID, SCALE)
values ('5', '4', 'RO00001', '�۳�A��', '_road_type_industry', to_date('01-01-0001', 'dd-mm-yyyy'), to_date('01-01-0001', 'dd-mm-yyyy'), 0, 27, '˫��6�������ܱ߹��ض�', 10474.527, to_date('15-09-2009 21:18:32', 'dd-mm-yyyy hh24:mi:ss'), '357', to_date('15-09-2009 21:18:38', 'dd-mm-yyyy hh24:mi:ss'), '357', 'N', 't1', null, null);
insert into ROAD (ROADID, PROJECTID, ROADCODE, ROADNAME, ROADTYPE, BEGINTIME, ENDTIME, WORKTIME, WORKERAMOUNT, MEMO, AVGWORKERAMOUNT, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID, SCALE)
values ('8', '4', 'RO00002', '�۳�D��', '_road_type_mun_main_road', to_date('01-01-0001', 'dd-mm-yyyy'), to_date('01-01-0001', 'dd-mm-yyyy'), 0, 5, null, 17840, to_date('15-09-2009 21:22:45', 'dd-mm-yyyy hh24:mi:ss'), '357', to_date('15-09-2009 21:22:45', 'dd-mm-yyyy hh24:mi:ss'), '357', 'N', 't1', null, null);
insert into ROAD (ROADID, PROJECTID, ROADCODE, ROADNAME, ROADTYPE, BEGINTIME, ENDTIME, WORKTIME, WORKERAMOUNT, MEMO, AVGWORKERAMOUNT, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID, SCALE)
values ('A00001', 'A00001', 'A00001', '����·�ɵ�', '_city_main_road', null, null, null, null, null, null, to_date('13-09-2009', 'dd-mm-yyyy'), null, to_date('13-09-2009', 'dd-mm-yyyy'), null, 'N', 't1', null, null);
insert into ROAD (ROADID, PROJECTID, ROADCODE, ROADNAME, ROADTYPE, BEGINTIME, ENDTIME, WORKTIME, WORKERAMOUNT, MEMO, AVGWORKERAMOUNT, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID, SCALE)
values ('A00002', 'A00001', 'A00002', '����·', '_city_road', null, null, null, null, null, null, to_date('13-09-2009', 'dd-mm-yyyy'), null, to_date('13-09-2009', 'dd-mm-yyyy'), null, 'N', 't1', null, null);
insert into ROAD (ROADID, PROJECTID, ROADCODE, ROADNAME, ROADTYPE, BEGINTIME, ENDTIME, WORKTIME, WORKERAMOUNT, MEMO, AVGWORKERAMOUNT, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID, SCALE)
values ('A00003', 'A00001', 'A00003', '���������ܱ�', '_city_road', null, null, null, null, null, null, to_date('13-09-2009', 'dd-mm-yyyy'), null, to_date('13-09-2009', 'dd-mm-yyyy'), null, 'N', 't1', null, null);
commit;
prompt 5 records loaded
prompt Loading MPASSIGNMENT...
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE, EVENTID, LATESTQCLEVEL, ISSTART, ISEND, ORDERINROAD, MPTYPE)
values ('A00007', null, null, 'A00007', '����·Ӧ����ص�1', 106.57538652420002, 29.6087318818572, null, to_date('21-09-2009 23:25:01', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('21-09-2009 23:25:01', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', 14, null, '0', 'A00001', -1, 'Y', 'N', 0, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE, EVENTID, LATESTQCLEVEL, ISSTART, ISEND, ORDERINROAD, MPTYPE)
values ('17', 'A00002', '1', 'MP-633895193449218750', 'trtrt', 106, 29, 'dfdsf', to_date('25-09-2009', 'dd-mm-yyyy'), 't2', to_date('25-09-2009', 'dd-mm-yyyy'), 't2', 't1', null, 'N', 3, 3, '2', null, 0, '1', '0', 0, 'trashentrance');
commit;
prompt 2 records loaded
prompt Loading MONITORPOINTINVIDEO...
insert into MONITORPOINTINVIDEO (VIDEOID, MPID)
values ('A00002', 'A00007');
insert into MONITORPOINTINVIDEO (VIDEOID, MPID)
values ('A00003', 'A00007');
commit;
prompt 2 records loaded
prompt Loading OPERATION...
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('saveandnew', 'OP0005', '���沢����', null, to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), 't1', 'N', 't1', 2, 'editandnew');
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('test', 'test', 'test', null, to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), 't1', 'Y', 't1', 5, 'test');
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('1', 'OP0001', '����', null, to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), null, 'Y', 't1', null, null);
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('19', 'OP-633853714211406250', 'sdfasdf', 'asdfasdf', to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), null, 'Y', 't1', null, null);
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('14', 'OP-633853713052812500', 'hhhh', 'fdsfsd', to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), null, 'Y', 't1', null, null);
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('17', 'OP-633853713052812500', 'dfsdfds', 'dasfsdf', to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), null, 'Y', 't1', null, null);
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('61', 'OP-633858014620625000', '��������', '�ض���Ҫ��������������', to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), 't1', to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), 't1', 'Y', 't1', null, null);
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('create', 'OP0001', '����', null, to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), 'admin', 'N', 't1', 0, 'create');
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('delete', 'OP0002', 'ɾ��', null, to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), 'admin', 'N', 't1', 4, 'delete');
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('edit', 'OP0003', '����', null, to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), 'admin', 'N', 't1', 1, 'edit');
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('view', 'OP0004', '���', null, to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), 'admin', 'N', 't1', 2, 'view');
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('default', 'default', 'Ĭ��', null, to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('13-09-2009 23:25:41', 'dd-mm-yyyy hh24:mi:ss'), 't1', 'N', 't1', -1, 'default');
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('67', 'OP-633901793003906250', 'test', 'ssss', to_date('03-10-2009', 'dd-mm-yyyy'), 't2', to_date('03-10-2009', 'dd-mm-yyyy'), 't2', 'Y', 't1', 0, 'ttt');
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('69', 'OP-633901796426093750', 'test1', 'ss', to_date('03-10-2009', 'dd-mm-yyyy'), 't2', to_date('03-10-2009', 'dd-mm-yyyy'), 't2', 'Y', 't1', 0, 'ddd');
commit;
prompt 14 records loaded
prompt Loading PASSPORT...
insert into PASSPORT (PASSPORTID, EMPID, PASSPORTCODE, PASSPORT, PASSWORD, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('t2', '357', 'P0002', 'demo', 'demo', 'N', null, to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', 't1', null);
insert into PASSPORT (PASSPORTID, EMPID, PASSPORTCODE, PASSPORT, PASSWORD, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('t1', '1', 'P0001', 'admin', 'admin', 'N', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 't1', null);
insert into PASSPORT (PASSPORTID, EMPID, PASSPORTCODE, PASSPORT, PASSWORD, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('1', '360', 'PA-633908963178281250', 'eee', '222', 'N', null, to_date('11-10-2009', 'dd-mm-yyyy'), 'demo', to_date('11-10-2009', 'dd-mm-yyyy'), 'demo', 't1', null);
commit;
prompt 3 records loaded
prompt Loading QUALITY...
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00034', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00034', '361', null, 'http://pic.nipic.com/2007-08-14/200781412170982_2.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 16:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 16:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://pic.nipic.com/2007-08-14/200781412170982_2.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00035', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00035', '361', null, 'http://www.hn119.gov.cn/Files/newsimg/2006/2006.10/2006.10.12/200610121716587129.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 13:53:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 13:53:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.hn119.gov.cn/Files/newsimg/2006/2006.10/2006.10.12/200610121716587129.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00036', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00035', '361', null, 'http://www.gsw.gov.cn/UpFiles/Article/wyx/200902/200902261612549400.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.gsw.gov.cn/UpFiles/Article/wyx/200902/200902261612549400.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00037', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00037', '361', null, 'http://img.hc360.com/ep/info/images/200907/200907071514534391.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://img.hc360.com/ep/info/images/200907/200907071514534391.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00038', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00038', '361', null, 'http://img1.zxxk.com/2009-8/ZXXKCOM2009080509411234300.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://img1.zxxk.com/2009-8/ZXXKCOM2009080509411234300.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00039', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00039', '361', null, 'http://www.xunleil.com.cn/uploadfile/200905/25/727155485.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.xunleil.com.cn/uploadfile/200905/25/727155485.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00040', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00040', '361', null, 'http://news.xinhuanet.com/environment/2006-10/20/xin_5321003201620640216911.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://news.xinhuanet.com/environment/2006-10/20/xin_5321003201620640216911.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00041', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00041', '361', null, 'http://210.87.144.54/jpkc/hjbh/imagesw/wykj901.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://210.87.144.54/jpkc/hjbh/imagesw/wykj901.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00042', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00042', '361', null, 'http://www.hksti.gov.cn/upload/2006_03/060321092099101.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 17:01:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 17:01:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.hksti.gov.cn/upload/2006_03/060321092099101.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00043', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00043', '361', null, 'http://pic1.nipic.com/2008-10-14/20081014111710389_2.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 16:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 16:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://pic1.nipic.com/2008-10-14/20081014111710389_2.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00044', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00044', '361', null, 'http://news.xinhuanet.com/newscenter/2007-09/23/xin_0020904232038515157499.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 16:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 16:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://news.xinhuanet.com/newscenter/2007-09/23/xin_0020904232038515157499.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00045', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00045', '361', null, 'http://news.xinhuanet.com/politics/2006-06/04/xinsrc_0820603041322765164404.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 13:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 13:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://news.xinhuanet.com/politics/2006-06/04/xinsrc_0820603041322765164404.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00046', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00046', '361', null, 'http://www.showchina.org/zt/xzjx/07/200902/W020090227691958337631.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 13:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 13:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.showchina.org/zt/xzjx/07/200902/W020090227691958337631.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00047', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00047', '361', null, 'http://www.hb.chinanews.com.cn/news/2007/2007-09-11/_1189471918_1.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.hb.chinanews.com.cn/news/2007/2007-09-11/_1189471918_1.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00048', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00048', '361', null, 'http://www.gxta.gov.cn/ImageDB/2008/1/ImgS-23170-��̬����.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.gxta.gov.cn/ImageDB/2008/1/ImgS-23170-��̬����.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00049', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00049', '361', null, 'http://www.sc405.com/images/New_Folder/xx4.ht4.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.sc405.com/images/New_Folder/xx4.ht4.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A000441', '1', 't1', '_qc_state_valid', 'A00005', '1', 'A00044', '361', null, 'http://i1.sinaimg.cn/hs/ul/2009/0728/U2609P361DT20090728101302.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 16:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 16:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://i1.sinaimg.cn/hs/ul/2009/0728/U2609P361DT20090728101302.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A000451', '1', 't1', '_qc_state_valid', 'A00005', '1', 'A00045', '361', null, 'http://vod.zjkepb.gov.cn/images/uploadimg/200941010564686816.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 16:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 16:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://vod.zjkepb.gov.cn/images/uploadimg/200941010564686816.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A000461', '1', 't1', '_qc_state_valid', 'A00005', '1', 'A00046', '361', null, 'http://www.lrn.cn/specialtopic/38EarthDay/xianzhuang/zibai/200704/W020070419626626009478.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 16:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 16:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.lrn.cn/specialtopic/38EarthDay/xianzhuang/zibai/200704/W020070419626626009478.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A000471', '1', 't1', '_qc_state_valid', 'A00005', '1', 'A00047', '361', null, 'http://image2.sina.com.cn/dy/c/2005-03-09/U398P1T1D6036781F1394DT20050309164148.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 11:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 11:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://image2.sina.com.cn/dy/c/2005-03-09/U398P1T1D6036781F1394DT20050309164148.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A000481', '1', 't1', '_qc_state_valid', 'A00005', '1', 'A00048', '361', null, 'http://image2.sina.com.cn/dy/c/2005-03-09/U398P1T1D6036781F1394DT20050309164148.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 11:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 11:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://image2.sina.com.cn/dy/c/2005-03-09/U398P1T1D6036781F1394DT20050309164148.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A000491', '1', 't1', '_qc_state_valid', 'A00005', '1', 'A00049', '361', null, 'http://image2.sina.com.cn/dy/c/2005-03-09/U398P1T1D6036781F1395DT20050309164148.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 11:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 11:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://image2.sina.com.cn/dy/c/2005-03-09/U398P1T1D6036781F1395DT20050309164148.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00050', '1', 't1', '_qc_state_valid', 'A00005', '1', 'A00050', '361', null, 'http://blog.xmnn.cn/images/article/00/01/A0/4F.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 13:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 13:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://blog.xmnn.cn/images/article/00/01/A0/4F.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00051', '1', 't1', '_qc_state_valid', 'A00005', '1', 'A00051', '361', null, 'http://www.hb.xinhuanet.com/newscenter/2008-03/04/xin_0230305041043281116237.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.hb.xinhuanet.com/newscenter/2008-03/04/xin_0230305041043281116237.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00053', '1', 't1', '_qc_state_valid', 'A00005', '1', 'A00052', '361', null, 'http://info.tgnet.cn/Info/Images/2007/11/15/1812963703_266590.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://info.tgnet.cn/Info/Images/2007/11/15/1812963703_266590.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00001', '1', 't1', '_qc_state_valid', 'A00001', '1', 'A00001', '361', null, 'http://images.beijing-2008.org/20070412/Img214033995.jpg', 106.59974098205601, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 12:02:10', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 12:02:10', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', 2, 'http://images.beijing-2008.org/20070412/Img214033995.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00020', '1', 't1', '_qc_state_valid', 'A00002', '1', 'A00020', '361', null, 'http://pic.nipic.com/2007-09-24/200792418596290_2.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('16-09-2009 17:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('16-09-2009 17:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://pic.nipic.com/2007-09-24/200792418596290_2.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00021', '1', 't1', '_qc_state_valid', 'A00003', '1', 'A00021', '361', null, 'http://a4.att.hudong.com/53/67/01300000167882121549678966552.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('16-09-2009 17:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('16-09-2009 17:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://a4.att.hudong.com/53/67/01300000167882121549678966552.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00022', '1', 't1', '_qc_state_valid', 'A00003', '1', 'A00022', '361', null, 'http://a0.att.hudong.com/84/80/01300000167882121549804420930.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('16-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('16-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://a0.att.hudong.com/84/80/01300000167882121549804420930.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00023', '1', 't1', '_qc_state_valid', 'A00003', '1', 'A00023', '361', null, 'http://pic1.nipic.com/2008-08-26/200882614120475_2.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://pic1.nipic.com/2008-08-26/200882614120475_2.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00024', '1', 't1', '_qc_state_valid', 'A00003', '1', 'A00024', '361', null, 'http://www.chinajnjpw.com/uploads/allimg/090505/2146000.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.chinajnjpw.com/uploads/allimg/090505/2146000.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00025', '1', 't1', '_qc_state_valid', 'A00003', '1', 'A00025', '361', null, 'http://www.sinaimg.cn/dy/c/p/2007-07-09/U414P1T1D13406623F23DT20070709111015.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.sinaimg.cn/dy/c/p/2007-07-09/U414P1T1D13406623F23DT20070709111015.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00026', '1', 't1', '_qc_state_valid', 'A00003', '1', 'A00026', '361', null, 'http://i0.sinaimg.cn/dy/c/p/2008-03-25/U2468P1T1D15218630F21DT20080325075855.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://i0.sinaimg.cn/dy/c/p/2008-03-25/U2468P1T1D15218630F21DT20080325075855.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00027', '1', 't1', '_qc_state_valid', 'A00003', '1', 'A00027', '361', null, 'http://www.dzhltw.com/upload/100(1).jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.dzhltw.com/upload/100(1).jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00028', '1', 't1', '_qc_state_valid', 'A00003', '1', 'A00028', '361', null, 'http://pic3.nipic.com/20090508/225028_022330146_2.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://pic3.nipic.com/20090508/225028_022330146_2.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00029', '1', 't1', '_qc_state_valid', 'A00003', '1', 'A00029', '361', null, 'http://www.szbaepb.gov.cn/editFiles/2008122112032471.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.szbaepb.gov.cn/editFiles/2008122112032471.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00030', '1', 't1', '_qc_state_valid', 'A00003', '1', 'A00030', '361', null, 'http://www.tjnkhwj.gov.cn/hwjFlack2.0/Uploads/Image/3_(2).JPG', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 17:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 17:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.tjnkhwj.gov.cn/hwjFlack2.0/Uploads/Image/3_(2).JPG', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00031', '1', 't1', '_qc_state_valid', 'A00003', '1', 'A00031', '361', null, 'http://pic.nipic.com/2008-07-23/2008723102642358_2.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 09:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 09:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://pic.nipic.com/2008-07-23/2008723102642358_2.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00032', '1', 't1', '_qc_state_valid', 'A00003', '1', 'A00032', '361', null, 'http://images.rednet.cn/articleimage/2008/10/20/010337402.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 13:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 13:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://images.rednet.cn/articleimage/2008/10/20/010337402.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00033', '1', 't1', '_qc_state_valid', 'A00004', '1', 'A00033', '361', null, 'http://i01.c.aliimg.com/club/upload/user/5/7/5/1/57517227cda6da7787f99f0f31869632.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 16:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 16:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://i01.c.aliimg.com/club/upload/user/5/7/5/1/57517227cda6da7787f99f0f31869632.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00002', '1', 't1', '_qc_state_valid', 'A00001', '1', 'A00002', '1', null, 'http://www.dreams-travel.com/pic/Three%20Gorges/����ҹ��2.jpg', 106.59974098205601, 29.6006256449822, '_qc_type_dynamic', null, to_date('13-09-2009 12:33:54', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('10-08-2009', 'dd-mm-yyyy'), null, 't1', null, 'N', 3, null, 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00003', '1', 't1', '_qc_state_valid', 'A00001', '1', 'A00003', '361', null, 'http://upload.17u.com/uploadfile/2005/09/22/3/2005092216050981398.jpg', 106.59974098205601, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 16:58:03', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 16:58:03', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://upload.17u.com/uploadfile/2005/09/22/3/2005092216050981398.jpg', null);
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00004', '1', 't1', '_qc_state_valid', 'A00001', '1', 'A00004', '361', null, 'http://image2.sina.com.cn/dy/c/2007-04-01/U50P1T1D12668215F1394DT20070402000802.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 10:01:22', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 10:01:22', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', 2, 'http://image2.sina.com.cn/dy/c/2007-04-01/U50P1T1D12668215F1394DT20070402000802.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00005', '1', 't1', '_qc_state_valid', 'A00001', '1', 'A00005', '361', null, 'http://news.xinhuanet.com/politics/2007-10/09/xinsrc_31210040911056562371715.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 17:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 17:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://news.xinhuanet.com/politics/2007-10/09/xinsrc_31210040911056562371715.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00006', '1', 't1', '_qc_state_valid', 'A00001', '1', 'A00006', '361', null, 'http://202.120.96.5/ylwhvod/pic/YL_01STHJ.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', 9, 'http://202.120.96.5/ylwhvod/pic/YL_01STHJ.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00007', '1', 't1', '_qc_state_valid', 'A00001', '1', 'A00007', '361', null, 'http://www.hnbrj.com/Files/ѧ���ڰĴ����ǵ�ס����Χ����.JPG', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 14:01:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 14:01:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.hnbrj.com/Files/ѧ���ڰĴ����ǵ�ס����Χ����.JPG', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00054', '1', 't1', '_qc_state_valid', 'A00006', '1', 'A00054', '361', null, 'http://bbs.chla.com.cn/space/upload/2008/06/19/6269325005789.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://bbs.chla.com.cn/space/upload/2008/06/19/6269325005789.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00055', '1', 't1', '_qc_state_valid', 'A00006', '1', 'A00055', '361', null, 'http://i.weather.com.cn/i/c/images/2008/20081217/4948b9b6_6e47a.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://i.weather.com.cn/i/c/images/2008/20081217/4948b9b6_6e47a.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00056', '1', 't1', '_qc_state_valid', 'A00006', '1', 'A00055', '361', null, 'http://longhoo.net/gb/longhoo/news/pic/world/images/00145527.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://longhoo.net/gb/longhoo/news/pic/world/images/00145527.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00057', '1', 't1', '_qc_state_valid', 'A00006', '1', 'A00055', '361', null, 'http://kmgd.xxgk.yn.gov.cn/uploadfile/kmimage_20010518/8037.JPG', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://kmgd.xxgk.yn.gov.cn/uploadfile/kmimage_20010518/8037.JPG', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00058', '1', 't1', '_qc_state_valid', 'A00006', '1', 'A00055', '361', null, 'http://qyp.ncedu.gov.cn/UploadFiles/2008121510434176.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://qyp.ncedu.gov.cn/UploadFiles/2008121510434176.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00059', '1', 't1', '_qc_state_valid', 'A00006', '1', 'A00059', '361', null, 'http://www.lsl.gov.cn:81/lyxw/UploadFiles_8420/200607/20060704090033528.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.lsl.gov.cn:81/lyxw/UploadFiles_8420/200607/20060704090033528.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00060', '1', 't1', '_qc_state_valid', 'A00006', '1', 'A00060', '361', null, 'http://219.239.227.61:7070/upload/080602/CMS4J_0806021659259590.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 17:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 17:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://219.239.227.61:7070/upload/080602/CMS4J_0806021659259590.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00061', '1', 't1', '_qc_state_valid', 'A00006', '1', 'A00061', '361', null, 'http://i0.sinaimg.cn/dy/c/p/2008-12-01/U2596P1T1D16759335F23DT20081201101551.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 17:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 17:00:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://i0.sinaimg.cn/dy/c/p/2008-12-01/U2596P1T1D16759335F23DT20081201101551.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00008', '1', 't1', '_qc_state_valid', 'A00001', '1', 'A00008', '361', null, 'http://www.zhangye.gov.cn/zynews/UploadFiles_6887/200609/20069715342587.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 14:01:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 14:02:10', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.zhangye.gov.cn/zynews/UploadFiles_6887/200609/20069715342587.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00009', '1', 't1', '_qc_state_valid', 'A00001', '1', 'A00009', '361', null, 'http://www.lan27.com/Article/UploadFiles/200810/20081019175920509.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('13-09-2009 14:01:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-09-2009 10:00:10', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.lan27.com/Article/UploadFiles/200810/20081019175920509.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00010', '1', 't1', '_qc_state_valid', 'A00001', '1', 'A00010', '361', null, 'http://www.cnzyff.com/article/UploadPic/2009-1/2009181185877.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('14-09-2009 12:01:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-09-2009 12:01:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.cnzyff.com/article/UploadPic/2009-1/2009181185877.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00011', '1', 't1', '_qc_state_valid', 'A00002', '1', 'A00011', '361', null, 'http://pic.moobol.com/user_pic/060902/liujunfeng/060902/s/live_20070206092739.JPG', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 12:02:10', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 12:02:10', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://pic.moobol.com/user_pic/060902/liujunfeng/060902/s/live_20070206092739.JPG', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00012', '1', 't1', '_qc_state_valid', 'A00002', '1', 'A00012', '361', null, 'http://gb.cri.cn/mmsource/images/2007/04/20/cc070420010.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('16-09-2009 16:58:03', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('16-09-2009 16:58:03', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://gb.cri.cn/mmsource/images/2007/04/20/cc070420010.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00013', '1', 't1', '_qc_state_valid', 'A00002', '1', 'A00013', '361', null, 'http://pic.moobol.com/user_pic/060902/liujunfeng/060902/s/live_20070206092820.JPG', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 17:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 17:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://pic.moobol.com/user_pic/060902/liujunfeng/060902/s/live_20070206092820.JPG', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00014', '1', 't1', '_qc_state_valid', 'A00002', '1', 'A00014', '361', null, 'http://image1.chinanews.com.cn/07p/PhotoN/070115/070115023a_3.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 14:01:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 14:01:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://image1.chinanews.com.cn/07p/PhotoN/070115/070115023a_3.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00015', '1', 't1', '_qc_state_valid', 'A00002', '1', 'A00015', '361', null, 'http://202.120.96.5/ylwhvod/pic/YL_01HJHX.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 10:01:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 10:01:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://202.120.96.5/ylwhvod/pic/YL_01HJHX.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00016', '1', 't1', '_qc_state_valid', 'A00002', '1', 'A00016', '361', null, 'http://www.chinadialogue.net/UserFiles/Image/xinjiangforest2.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 12:01:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 12:01:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://www.chinadialogue.net/UserFiles/Image/xinjiangforest2.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00017', '1', 't1', '_qc_state_valid', 'A00002', '1', 'A00017', '361', null, 'http://image2.sina.com.cn/dy/c/2005-11-24/U1473P1T1D8394688F23DT20051125070340.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 11:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 11:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://image2.sina.com.cn/dy/c/2005-11-24/U1473P1T1D8394688F23DT20051125070340.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00018', '1', 't1', '_qc_state_valid', 'A00002', '1', 'A00018', '361', null, 'http://pic1.nipic.com/2008-08-26/200882614162215_2.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('16-09-2009 13:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('16-09-2009 13:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://pic1.nipic.com/2008-08-26/200882614162215_2.jpg', 'http://localhost:6033/test.flv');
insert into QUALITY (QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, ROADID, MATERIAL, LONGITUDE, LATITUDE, TYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values ('A00019', '1', 't1', '_qc_state_valid', 'A00002', '1', 'A00019', '361', null, 'http://pic1.nipic.com/2008-08-26/2008826141417471_2.jpg', 106.599740982056, 29.6006256449822, '_qc_type_normal', null, to_date('15-09-2009 16:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2009 16:59:00', 'dd-mm-yyyy hh24:mi:ss'), null, 't1', null, 'N', null, 'http://pic1.nipic.com/2008-08-26/2008826141417471_2.jpg', 'http://localhost:6033/test.flv');
commit;
prompt 66 records loaded
prompt Loading RESOURCEITEM...
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('trashentrancenew', 'res_trashentrancenew', 'trashentrancenew', '/Views/Quality/TrashEntranceEdit.aspx', '���ڼ�ص�����', '���ڼ�ص����', '/Quality', null, 'N', to_date('25-09-2009', 'dd-mm-yyyy'), 'admin', to_date('25-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('trashentranceedit', 'res_trashentranceedit', 'trashentranceedit', '/Views/Quality/TrashEntranceEdit.aspx', '���ڼ�ص�༭', '���ڼ�ص����', '/Quality', null, 'N', to_date('25-09-2009', 'dd-mm-yyyy'), 'admin', to_date('25-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('trashentranceview', 'res_trashentranceview', 'trashentranceview', '/Views/Quality/TrashEntranceView.aspx', '���ڼ�ص����', '���ڼ�ص����', '/Quality', null, 'N', to_date('25-09-2009', 'dd-mm-yyyy'), 'admin', to_date('25-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('trashentrancelist', 'res_trashentrancelist', 'trashentrancelist', '/Views/Quality/TrashEntranceList.aspx', '���ڼ�ص��б�', '���ڼ�ص����', '/Quality', null, 'N', to_date('25-09-2009', 'dd-mm-yyyy'), 'admin', to_date('25-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('accidentnew', 'res_accidentnew', 'accidentnew', '/Views/Quality/AccidentEdit.aspx', '�¹��ֳ�����', '�¹��ֳ�����', '/Quality', null, 'N', to_date('25-09-2009', 'dd-mm-yyyy'), 'admin', to_date('25-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('accidentedit', 'res_accidentedit', 'accidentedit', '/Views/Quality/AccidentEdit.aspx', '�¹��ֳ��༭', '�¹��ֳ�����', '/Quality', null, 'N', to_date('25-09-2009', 'dd-mm-yyyy'), 'admin', to_date('25-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('accidentview', 'res_accidentview', 'accidentview', '/Views/Quality/AccidentView.aspx', '�¹��ֳ����', '�¹��ֳ�����', '/Quality', null, 'N', to_date('25-09-2009', 'dd-mm-yyyy'), 'admin', to_date('25-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('accidentlist', 'res_accidentlist', 'accidentlist', '/Views/Quality/AccidentList.aspx', '�¹��ֳ��б�', '�¹��ֳ�����', '/Quality', null, 'N', to_date('25-09-2009', 'dd-mm-yyyy'), 'admin', to_date('25-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('emergencyedit', 'res_emergencyedit', 'emergencyedit', '/Views/Quality/EmergencyEventEdit.aspx', 'Ӧ���¼��༭', 'Ӧ���¼�����', '/Quality', null, 'N', to_date('22-09-2009', 'dd-mm-yyyy'), 'admin', to_date('22-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('emergencynew', 'res_emergencynew', 'emergencynew', '/Views/Quality/EmergencyEventEdit.aspx', 'Ӧ���¼�����', 'Ӧ���¼�����', '/Quality', null, 'N', to_date('22-09-2009', 'dd-mm-yyyy'), 'admin', to_date('22-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('emergencyview', 'res_emergencyview', 'emergencyview', '/Views/Quality/EmergencyEventView.aspx', 'Ӧ���¼����', 'Ӧ���¼�����', '/Quality', null, 'N', to_date('22-09-2009', 'dd-mm-yyyy'), 'admin', to_date('22-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('emergencylist', 'res_emergencylist', 'emergencylist', '/Views/Quality/EmergencyEventList.aspx', 'Ӧ���¼��б�', 'Ӧ���¼�����', '/Quality', null, 'N', to_date('22-09-2009', 'dd-mm-yyyy'), 'admin', to_date('22-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('1', 'RE-633892526221098173', 'EmergencyMonitor', '/Views/Quality/EmergencyMonitor.aspx', 'Ӧ���¼����', null, null, null, 'N', to_date('22-09-2009 21:44:34', 'dd-mm-yyyy hh24:mi:ss'), 't2', to_date('22-09-2009 21:46:41', 'dd-mm-yyyy hh24:mi:ss'), 't2', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('projectview', 'res_projectview', 'projectview', '/Views/Project/ProjectView.aspx', '��Ŀ���', '��Ŀ����', '/Project', null, 'N', to_date('25-08-2009', 'dd-mm-yyyy'), 'admin', to_date('25-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('roadview', 'res_roadview', 'roadview', '/Views/Road/RoadView.aspx', '·�����', '·�ι���', '/Road', null, 'N', to_date('25-08-2009', 'dd-mm-yyyy'), 'admin', to_date('25-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('mpedit', 'RES_mpedit', 'mpedit', '/Views/Quality/MonitorPointEdit.aspx', '��ص�༭', '��ص����', '/Quality', null, 'N', to_date('31-08-2009', 'dd-mm-yyyy'), 'admin', to_date('31-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('mpnew', 'RES_mpnew', 'mpnew', '/Views/Quality/MonitorPointEdit.aspx', '��ص�����', '��ص����', '/Quality', null, 'N', to_date('31-08-2009', 'dd-mm-yyyy'), 'admin', to_date('31-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('mpview', 'RES_mpview', 'mpview', '/Views/Quality/MonitorPointView.aspx', '��ص����', '��ص����', '/Quality', null, 'N', to_date('31-08-2009', 'dd-mm-yyyy'), 'admin', to_date('31-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('mplist', 'RES_mplist', 'mplist', '/Views/Quality/MonitorPointList.aspx', '��ص��б�', '��ص����', '/Quality', null, 'N', to_date('31-08-2009', 'dd-mm-yyyy'), 'admin', to_date('31-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('projectlist', 'RES00028', 'projectlist', '/Views/Project/ProjectList.aspx', '��Ŀ�б�', '��Ŀ����', '/Project', null, 'N', to_date('23-08-2009', 'dd-mm-yyyy'), 'admin', to_date('23-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('projectedit', 'RES00029', 'projectedit', '/Views/Project/ProjectEdit.aspx', '��Ŀ�༭', '��Ŀ����', '/Project', null, 'N', to_date('23-08-2009', 'dd-mm-yyyy'), 'admin', to_date('23-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t24', 'RES00028', 'OrganizationView', '/Views/Basedata/OrganizationView.aspx', '��֯���', '��֯����', '/Basedata', null, 'N', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t25', 'RES00029', 'OrganizationEdit', '/Views/Basedata/OrganizationEdit.aspx', '��֯�༭', '��֯����', '/Basedata', null, 'N', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t26', 'RES00030', 'OrganizationList', '/Views/Basedata/OrganizationList.aspx', '��֯�б�', '��֯����', '/Basedata', null, 'N', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t27', 'RES00031', 'OrganizationNew', '/Views/Basedata/OrganizationEdit.aspx', '��֯����', '��֯����', '/Basedata', null, 'N', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('AjaxVideo', 'RES00025', 'AjaxServicesQualityControlVideo', '/Views/AjaxServices/QualityControl/Video.aspx', '��ƵAJAX����', '�������', '/AjaxServices/QualityControl', null, 'N', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('MunicipalAdminMonitor', 'RES0016', 'QualityMunicipalAdminMonitor', '/Views/Quality/MunicipalAdminMonitor.aspx', '���������������', '�������', '/Quality', null, 'N', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('SanitationOfficeMonitor', 'RES0017', 'QualitySanitationOfficeMonitor', '/Views/Quality/SanitationOfficeMonitor.aspx', '�����ල�������', '�������', '/Quality', null, 'N', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('CompanyQualityMonitor', 'RES0003', 'QualityCompanyQualityMonitor', '/Views/Quality/CompanyQualityMonitor.aspx', '������˾�������', '�������', '/Quality', null, 'N', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('MonitorPoint', 'RES0005', 'AjaxServicesQualityControlMonitorPoint', '/Views/AjaxServices/QualityControl/MonitorPoint.aspx', '��ص�AJAX����', '�������', '/AjaxServices/QualityControl', null, 'N', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('QualityMonitorPointMap', 'RES0004', 'QualityQualityMonitorPointMap', '/Views/Quality/QualityMonitorPointMap.aspx', '��ص��ͼ����', '�������', '/Quality', null, 'N', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('MonitorPointDetail', 'RES0006', 'QualityMonitorPointDetail', '/Views/Quality/MonitorPointDetail.aspx', '��ص���ϸ��Ϣ���', '�������', '/Quality', null, 'N', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('RoadEdit', 'RES00026', 'roadedit', '/Views/Road/RoadEdit.aspx', '·�α༭', '·�ι���', '/Road', null, 'N', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('RoadList', 'RES0018', 'roadlist', '/Views/Road/RoadList.aspx', '·���б�', '·�ι���', '/Road', null, 'N', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t3', 'RES0005', 'operationedit', '/Views/Basedata/OperationEdit.aspx', '�����༭', '��������', '/Basedata', null, 'N', to_date('08-08-2009', 'dd-mm-yyyy'), 'admin', to_date('08-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t4', 'RES0006', 'operationview', '/Views/Basedata/OperationView.aspx', '�������', '��������', '/Basedata', null, 'N', to_date('08-08-2009', 'dd-mm-yyyy'), 'admin', to_date('08-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t5', 'RES0007', 'employeelist', '/Views/Basedata/EmployeeList.aspx', 'ְԱ�б�', 'ְԱ����', '/Basedata', null, 'N', to_date('08-08-2009', 'dd-mm-yyyy'), 'admin', to_date('08-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t15', 'RES00016', 'equnew', '/Views/Basedata/EquipmentEdit.aspx', '�豸����', '�豸����', '/Basedata', null, 'N', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t16', 'RES00017', 'equedit', '/Views/Basedata/EquipmentEdit.aspx', '�豸�༭', '�豸����', '/Basedata', null, 'N', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009 15:29:55', 'dd-mm-yyyy hh24:mi:ss'), 't1', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t17', 'RES00018', 'equview', '/Views/Basedata/EquipmentView.aspx', '�豸���', '�豸����', '/Basedata', null, 'N', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t18', 'RES00019', 'equlist', '/Views/Basedata/EquipmentList.aspx', '�豸�б�', '�豸����', '/Basedata', null, 'N', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('15-08-2009 16:04:01', 'dd-mm-yyyy hh24:mi:ss'), 't1', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t19', 'RES00020', 'resnew', '/Views/Basedata/ResourceEdit.aspx', '��Դ����', '��Դ����', '/Basedata', null, 'N', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t20', 'RES00021', 'resedit', '/Views/Basedata/ResourceEdit.aspx', '��Դ�༭', '��Դ����', '/Basedata', null, 'N', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t21', 'RES00022', 'resview', '/Views/Basedata/ResourceView.aspx', '��Դ���', '��Դ����', '/Basedata', null, 'N', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t22', 'RES00023', 'reslist', '/Views/Basedata/ResourceList.aspx', '��Դ�б�', '��Դ����', '/Basedata', null, 'N', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t6', 'RES0008', 'companyqualitymonitor', '/Views/Quality/CompanyQualityMonitor.aspx', '�������', '�������', '/Quality', null, 'N', to_date('10-08-2009', 'dd-mm-yyyy'), 'admin', to_date('10-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t7', 'RES0009', 'operationlist', '/Views/Basedata/OperationList.aspx', '�����б�', '��������', '/Basedata', null, 'N', to_date('10-08-2009', 'dd-mm-yyyy'), 'admin', to_date('10-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t8', 'RES0010', 'employeenew', '/Views/Basedata/EmployeeEdit.aspx', 'ְԱ����', 'ְԱ����', '/Basedata', null, 'N', to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t9', 'RES00012', 'rolelist', '/Views/Basedata/RoleList.aspx', '��ɫ�б�', '��ɫ����', '/Basedata', null, 'N', to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t12', 'RES13', 'roleedit', '/Views/Basedata/RoleEdit.aspx', '��ɫ�༭', '��ɫ����', '/Basedata', null, 'N', to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t13', 'RES00014', 'rolenew', '/Views/Basedata/RoleEdit.aspx', '��ɫ����', '��ɫ����', '/Basedata', null, 'N', to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t14', 'RES00015', 'roleview', '/Views/Basedata/RoleView.aspx', '��ɫ���', '��ɫ����', '/Basedata', null, 'N', to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('vtlist', 'res_vtlist', 'vtlist', '/Views/Vehicle/VehicleTaskList.aspx', '�г������б�', '�г��������', '/Vehicle', null, 'N', to_date('29-09-2009', 'dd-mm-yyyy'), 'admin', to_date('29-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('vtedit', 'res_vtedit', 'vtedit', '/Views/Vehicle/VehicleTaskEdit.aspx', '�г�����༭', '�г��������', '/Vehicle', null, 'N', to_date('29-09-2009', 'dd-mm-yyyy'), 'admin', to_date('29-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('vtview', 'res_vtview', 'vtview', '/Views/Vehicle/VehicleTaskView.aspx', '�г��������', '�г��������', '/Vehicle', null, 'N', to_date('29-09-2009', 'dd-mm-yyyy'), 'admin', to_date('29-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('vtnew', 'res_vtnew', 'vtnew', '/Views/Vehicle/VehicleTaskEdit.aspx', '�г���������', '�г��������', '/Vehicle', null, 'N', to_date('29-09-2009', 'dd-mm-yyyy'), 'admin', to_date('29-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('vehiclemonitor', 'res_vehiclemonitor', 'vehiclemonitor', '/Views/Vehicle/VehicleMonitor.aspx', '�г��켣���', '�г��켣���', '/Vehicle', null, 'N', to_date('30-09-2009', 'dd-mm-yyyy'), 'admin', to_date('30-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('7', 'RE-633905199529375000', 'VehicleMonitor', '/Views/Vehicle/VehicleMonitor.aspx', '�г�������', null, null, null, 'N', to_date('07-10-2009 13:46:48', 'dd-mm-yyyy hh24:mi:ss'), 't2', to_date('07-10-2009 14:44:32', 'dd-mm-yyyy hh24:mi:ss'), 't2', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('9', 'RE-633905213223281250', 'VehicleTaskAjaxSvc', '/Views/AjaxServices/VehicleMission/VehicleMission.aspx', '�г�������Ajax����', null, null, null, 'N', to_date('07-10-2009 14:09:43', 'dd-mm-yyyy hh24:mi:ss'), 't2', to_date('07-10-2009 14:44:25', 'dd-mm-yyyy hh24:mi:ss'), 't2', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t10', 'RES0001', 'employeeedit', '/Views/Basedata/EmployeeEdit.aspx', 'ְԱ�༭', 'ְԱ����', '/Basedata', null, 'N', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t11', 'RES0002', 'employeeview', '/Views/Basedata/EmployeeView.aspx', 'ְԱ���', 'ְԱ����', '/Basedata', null, 'N', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t23', 'RES00024', 'operationnew', '/Views/Basedata/OperationEdit.aspx', '��������', '��������', '/Basedata', null, 'N', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('RoadNew', 'RES00027', 'roadnew', '/Views/Road/RoadEdit.aspx', '·������', '·�ι���', '/Road', null, 'N', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('qualityappraisal', 'res_qualityappraisal', 'qualityappraisal', '/Views/Quality/QualityAppraisal.aspx', '��������', '�������', '/Quality', null, 'N', to_date('04-09-2009', 'dd-mm-yyyy'), 'admin', to_date('04-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('qualityappraisallist', 'res_qualityappraisallist', 'qalist', '/Views/Quality/QualityAppraisalList.aspx', '���������б�', '�������', '/Quality', null, 'N', to_date('04-09-2009', 'dd-mm-yyyy'), 'admin', to_date('04-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('timeschemanew', 'res_timeschemanew', 'timeschemanew', '/Views/Quality/TimeSchemaEdit.aspx', 'ʱ�����������', '�������', '/Quality', null, 'N', to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('timeschemaedit', 'res_timeschemaedit', 'timeschemaedit', '/Views/Quality/TimeSchemaEdit.aspx', 'ʱ������ñ༭', '�������', '/Quality', null, 'N', to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('timeschemalist', 'res_timeschemalist', 'timeschemalist', '/Views/Quality/TimeSchemaList.aspx', 'ʱ��������б�', '�������', '/Quality', null, 'N', to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('timeschemaview', 'res_timeschemaview', 'timeschemaview', '/Views/Quality/TimeSchemaView.aspx', 'ʱ����������', '�������', '/Quality', null, 'N', to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('qualityinfo', 'res_qualityinfo', 'qualityinfo', '/Views/AjaxServices/QualityControl/QualityInfo.aspx', '�ʿ���Ϣ', '�������', '/AjaxServices', null, 'N', to_date('13-09-2009', 'dd-mm-yyyy'), 'admin', to_date('13-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, MEMO, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('projectnew', 'RES00030', 'projectnew', '/Views/Project/ProjectEdit.aspx', '��Ŀ����', '��Ŀ����', '/Project', null, 'N', to_date('23-08-2009', 'dd-mm-yyyy'), 'admin', to_date('23-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
commit;
prompt 71 records loaded
prompt Loading ROLE...
insert into ROLE (ROLEID, ROLECODE, ROLENAME, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('t4', 'R0003', '��ʾ��ɫ', 'N', 'ϵͳ��ʾʹ�ý�ɫ', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009 10:51:52', 'dd-mm-yyyy hh24:mi:ss'), 't2', 't1', null);
insert into ROLE (ROLEID, ROLECODE, ROLENAME, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('150', 'test', 'test', 'N', 'asdfasdfasdf', to_date('13-09-2009', 'dd-mm-yyyy'), 'admin', to_date('13-09-2009', 'dd-mm-yyyy'), 'admin', 't1', null);
insert into ROLE (ROLEID, ROLECODE, ROLENAME, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('t1', 'R0001', '��ɫһ', 'N', '�����ɫһ������', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('15-08-2009 22:09:45', 'dd-mm-yyyy hh24:mi:ss'), 't1', 't1', null);
insert into ROLE (ROLEID, ROLECODE, ROLENAME, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('t2', 'R0002', '��ɫ��', 'N', '�����ɫ��������', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1', null);
insert into ROLE (ROLEID, ROLECODE, ROLENAME, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('t3', 'R0003', '��ɫ��', 'N', '�����ɫ��������', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1', null);
commit;
prompt 5 records loaded
prompt Loading RESPERMISSION...
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't24', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't25', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't25', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't25', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't25', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't25', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't26', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't26', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't26', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't26', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't26', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't27', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't27', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't27', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't27', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't27', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectview', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectview', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectview', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectview', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectview', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectview', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'roadview', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'roadview', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'roadview', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'roadview', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'roadview', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'roadview', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemaedit', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemaedit', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemaedit', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemaedit', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemaedit', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemaedit', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemanew', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemanew', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemanew', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemanew', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemanew', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemanew', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemaview', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemaview', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemaview', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemaview', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemaview', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemaview', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemalist', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemalist', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemalist', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemalist', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemalist', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'timeschemalist', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'qualityappraisal', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'qualityappraisal', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'qualityappraisallist', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'qualityappraisallist', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'qualityinfo', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'qualityinfo', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencyedit', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencyedit', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencyedit', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencyedit', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencyedit', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencyedit', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencynew', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencynew', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencynew', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencynew', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencynew', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencynew', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencyview', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencyview', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencyview', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencyview', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencyview', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencyview', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencylist', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencylist', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencylist', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencylist', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencylist', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'emergencylist', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values (null, 't4', '1', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values (null, 't4', '1', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values (null, 't4', '1', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values (null, 't4', '1', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values (null, 't4', '1', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values (null, 't4', '1', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentedit', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentedit', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentedit', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentedit', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentedit', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentedit', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentnew', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentnew', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentnew', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentnew', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentnew', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentnew', 'edit');
commit;
prompt 100 records committed...
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentlist', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentlist', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentlist', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentlist', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentlist', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentlist', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentview', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentview', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentview', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentview', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentview', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'accidentview', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentranceedit', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentranceedit', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentranceedit', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentranceedit', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentranceedit', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentranceedit', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentrancenew', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentrancenew', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentrancenew', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentrancenew', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentrancenew', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentrancenew', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentrancelist', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentrancelist', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentrancelist', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentrancelist', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentrancelist', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentrancelist', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentranceview', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentranceview', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentranceview', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentranceview', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentranceview', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'trashentranceview', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpedit', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpedit', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpedit', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpedit', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpedit', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpedit', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpnew', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpnew', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpnew', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpnew', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpnew', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpnew', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpview', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpview', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpview', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpview', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpview', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mpview', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mplist', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mplist', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mplist', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mplist', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mplist', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'mplist', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectlist', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectlist', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectlist', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectlist', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectlist', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectedit', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectedit', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectedit', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectedit', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectedit', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectnew', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectnew', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectnew', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectnew', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'projectnew', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 'RoadNew', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values (null, 't2', 't6', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values (null, 't2', 't19', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values (null, 't2', 't20', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values (null, 't2', 't21', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values (null, 't2', 't22', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values (null, 't1', 't19', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values (null, 't1', 't20', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values (null, 't1', 't21', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values (null, 't1', 't22', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't10', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 't10', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't11', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 't11', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't12', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 't12', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't13', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 't13', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't14', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 't14', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't15', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't16', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 't16', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 't16', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't17', 'default');
commit;
prompt 200 records committed...
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 't17', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 't17', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't18', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 't18', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't23', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't3', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 't3', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't4', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 't4', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't5', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 't5', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't6', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't7', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 't7', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't8', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 't8', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't1', 't9', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 't9', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 'CompanyQualityMonitor', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 'MonitorPoint', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 'MonitorPointDetail', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 'QualityMonitorPointMap', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 'MunicipalAdminMonitor', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 'SanitationOfficeMonitor', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 'AjaxVideo', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 'RoadEdit', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't2', 'RoadList', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'AjaxVideo', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MonitorPoint', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'CompanyQualityMonitor', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MonitorPointDetail', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MunicipalAdminMonitor', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'QualityMonitorPointMap', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadEdit', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadList', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadNew', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'SanitationOfficeMonitor', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't10', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't11', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't12', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't13', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't14', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't15', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't16', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't17', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't18', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't19', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't20', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't21', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't22', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't23', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't3', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't4', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't5', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't6', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't7', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't8', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't9', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', '7', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', '7', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', '7', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', '7', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', '7', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', '7', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', '9', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', '9', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', '9', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', '9', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', '9', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', '9', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vehiclemonitor', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vehiclemonitor', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't24', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't25', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't26', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't27', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadEdit', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadEdit', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadEdit', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadEdit', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadEdit', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadList', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadList', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadList', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadList', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadList', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadNew', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadNew', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadNew', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadNew', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'RoadNew', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't3', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't3', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't3', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't3', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't3', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't4', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't4', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't4', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't4', 'edit');
commit;
prompt 300 records committed...
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't4', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't7', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't7', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't7', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't7', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't7', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't23', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't23', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't23', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't23', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't23', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't9', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't9', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't9', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't9', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't9', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't12', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't12', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't12', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't12', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't12', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't13', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't13', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't13', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't13', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't13', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't14', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't14', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't14', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't14', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't14', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't15', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't15', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't15', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't15', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't15', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't16', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't16', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't16', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't16', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't16', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't17', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't17', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't17', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't17', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't17', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't18', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't18', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't18', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't18', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't18', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't5', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't5', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't5', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't5', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't5', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't8', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't8', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't8', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't8', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't8', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't10', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't10', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't10', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't10', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't10', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't11', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't11', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't11', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't11', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't11', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'AjaxVideo', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'AjaxVideo', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'AjaxVideo', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'AjaxVideo', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'AjaxVideo', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MunicipalAdminMonitor', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MunicipalAdminMonitor', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MunicipalAdminMonitor', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MunicipalAdminMonitor', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MunicipalAdminMonitor', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'SanitationOfficeMonitor', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'SanitationOfficeMonitor', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'SanitationOfficeMonitor', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'SanitationOfficeMonitor', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'SanitationOfficeMonitor', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'CompanyQualityMonitor', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'CompanyQualityMonitor', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'CompanyQualityMonitor', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'CompanyQualityMonitor', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'CompanyQualityMonitor', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MonitorPoint', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MonitorPoint', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MonitorPoint', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MonitorPoint', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MonitorPoint', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'QualityMonitorPointMap', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'QualityMonitorPointMap', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'QualityMonitorPointMap', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'QualityMonitorPointMap', 'edit');
commit;
prompt 400 records committed...
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'QualityMonitorPointMap', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MonitorPointDetail', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MonitorPointDetail', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MonitorPointDetail', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MonitorPointDetail', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'MonitorPointDetail', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't6', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't6', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't6', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't6', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't6', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't19', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't19', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't19', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't19', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't19', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't20', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't20', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't20', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't20', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't20', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't21', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't21', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't21', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't21', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't21', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't22', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't22', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't22', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't22', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't22', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't24', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't24', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't24', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 't24', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtedit', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtedit', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtedit', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtedit', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtedit', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtedit', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtnew', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtnew', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtnew', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtnew', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtnew', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtnew', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtview', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtview', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtview', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtview', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtview', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtview', 'edit');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtlist', 'default');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtlist', 'delete');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtlist', 'saveandnew');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtlist', 'view');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtlist', 'create');
insert into RESPERMISSION (ORGANIZATIONID, ROLEID, RESID, OPID)
values ('t1', 't4', 'vtlist', 'edit');
commit;
prompt 459 records loaded
prompt Loading TIMEITEM...
prompt Table is empty
prompt Loading USERROLE...
insert into USERROLE (ROLEID, PASSPORTID, ORGANIZATIONID)
values ('150', '1', 't1');
insert into USERROLE (ROLEID, PASSPORTID, ORGANIZATIONID)
values ('t1', '1', 't1');
insert into USERROLE (ROLEID, PASSPORTID, ORGANIZATIONID)
values ('t1', 't1', 't1');
insert into USERROLE (ROLEID, PASSPORTID, ORGANIZATIONID)
values ('t2', '1', 't1');
insert into USERROLE (ROLEID, PASSPORTID, ORGANIZATIONID)
values ('t2', 't1', 't1');
insert into USERROLE (ROLEID, PASSPORTID, ORGANIZATIONID)
values ('t4', '1', 't1');
insert into USERROLE (ROLEID, PASSPORTID, ORGANIZATIONID)
values ('t4', 't2', 't1');
commit;
prompt 7 records loaded
prompt Loading VEHICLETASK...
insert into VEHICLETASK (TASKID, TASKNAME, PUBLICTIME, STARTTIME, ENDTIME, MODEL, TASKTYPE, CHARGEMAN, LICENSEPLATENUM, ISGASSUPPLIED, ISWATERSUPPLIED, ISREPAIRED, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, TASKCODE, MEMO, TRACE)
values ('A00001', '��������', to_date('05-10-2009', 'dd-mm-yyyy'), to_date('05-10-2009', 'dd-mm-yyyy'), to_date('05-10-2009', 'dd-mm-yyyy'), '����A00', '_road_type_triple_confuse', '1', '��A123456', 'Y', 'Y', 'N', to_date('05-10-2009', 'dd-mm-yyyy'), 't2', to_date('07-10-2009 14:04:01', 'dd-mm-yyyy hh24:mi:ss'), 't2', 'N', 'VE-639918590375000', null, '[{"Lat":29.621221113784504,"Lng": 106.58669471740722},' || chr(13) || '' || chr(10) || '{"Lat":29.622414924968726,"Lng": 106.58849716186523},' || chr(13) || '' || chr(10) || '{"Lat":29.622713375554912,"Lng": 106.59004211425781},' || chr(13) || '' || chr(10) || '{"Lat":29.622489537698147,"Lng": 106.59201622009277},' || chr(13) || '' || chr(10) || '{"Lat":29.622564150372326,"Lng": 106.59356117248535},' || chr(13) || '' || chr(10) || '{"Lat":29.622489537698147,"Lng": 106.59510612487793},' || chr(13) || '' || chr(10) || '{"Lat":29.622489537698147,"Lng": 106.59690856933594},' || chr(13) || '' || chr(10) || '{"Lat":29.62219108644898,"Lng": 106.59871101379394},' || chr(13) || '' || chr(10) || '{"Lat":29.62181802114448,"Lng": 106.60128593444824},' || chr(13) || '' || chr(10) || '{"Lat":29.621370340955955,"Lng": 106.6032600402832},' || chr(13) || '' || chr(10) || '{"Lat":29.62151956790645,"Lng": 106.60557746887207},' || chr(13) || '' || chr(10) || '{"Lat":29.62189263431587,"Lng": 106.60737991333008},' || chr(13) || '' || chr(10) || '{"Lat":29.62219108644898,"Lng": 106.6087532043457},' || chr(13) || '' || chr(10) || '{"Lat":29.62323566195374,"Lng": 106.61064147949219},' || chr(13) || '' || chr(10) || '{"Lat":29.62338488614188,"Lng": 106.61184310913086},' || chr(13) || '' || chr(10) || '{"Lat":29.62323566195374,"Lng": 106.61381721496582},' || chr(13) || '' || chr(10) || '{"Lat":29.622787988063347,"Lng": 106.61476135253906},' || chr(13) || '' || chr(10) || '{"Lat":29.622713375554912,"Lng": 106.61622047424316},' || chr(13) || '' || chr(10) || '{"Lat":29.62353411010904,"Lng": 106.6171646118164},' || chr(13) || '' || chr(10) || '{"Lat":29.62435483797815,"Lng": 106.61836624145508},' || chr(13) || '' || chr(10) || '{"Lat":29.624877115868713,"Lng": 106.6208553314209},' || chr(13) || '' || chr(10) || '{"Lat":29.62525016984733,"Lng": 106.62257194519043},' || chr(13) || '' || chr(10) || '{"Lat":29.625026337625893,"Lng": 106.62420272827148},' || chr(13) || '' || chr(10) || '{"Lat":29.624504060508844,"Lng": 106.62549018859863},' || chr(13) || '' || chr(10) || '{"Lat":29.624131003767722,"Lng": 106.62703514099121},' || chr(13) || '' || chr(10) || '{"Lat":29.623011825257162,"Lng": 106.62849426269531},' || chr(13) || '' || chr(10) || '{"Lat":29.62129572739784,"Lng": 106.62952423095703},' || chr(13) || '' || chr(10) || '{"Lat":29.619952673904883,"Lng": 106.63089752197265},' || chr(13) || '' || chr(10) || '{"Lat":29.61950498542964,"Lng": 106.63235664367676},' || chr(13) || '' || chr(10) || '{"Lat":29.61913191018105,"Lng": 106.63390159606933},' || chr(13) || '' || chr(10) || '{"Lat":29.617042663267018,"Lng": 106.63561820983887},' || chr(13) || '' || chr(10) || '{"Lat":29.615624935338807,"Lng": 106.63613319396972},' || chr(13) || '' || chr(10) || '{"Lat":29.612938659314945,"Lng": 106.63613319396972},' || chr(13) || '' || chr(10) || '{"Lat":29.610103068072462,"Lng": 106.6362190246582},' || chr(13) || '' || chr(10) || '{"Lat":29.607565892513594,"Lng": 106.63639068603515},' || chr(13) || '' || chr(10) || '{"Lat":29.605401780554935,"Lng": 106.6387939453125},' || chr(13) || '' || chr(10) || '{"Lat":29.605401780554935,"Lng": 106.64059638977051},' || chr(13) || '' || chr(10) || '{"Lat":29.605252529742266,"Lng": 106.6431713104248},' || chr(13) || '' || chr(10) || '{"Lat":29.60428239407528,"Lng": 106.64523124694824},' || chr(13) || '' || chr(10) || '{"Lat":29.602789859440022,"Lng": 106.64703369140625},' || chr(13) || '' || chr(10) || '{"Lat":29.601670443967144,"Lng": 106.64849281311035},' || chr(13) || '' || chr(10) || '{"Lat":29.601073417301073,"Lng": 106.64960861206054},' || chr(13) || '' || chr(10) || '{"Lat":29.60062564498216,"Lng": 106.65244102478027}]');
insert into VEHICLETASK (TASKID, TASKNAME, PUBLICTIME, STARTTIME, ENDTIME, MODEL, TASKTYPE, CHARGEMAN, LICENSEPLATENUM, ISGASSUPPLIED, ISWATERSUPPLIED, ISREPAIRED, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, TASKCODE, MEMO, TRACE)
values ('2', 'dsfsdd', to_date('30-09-2009', 'dd-mm-yyyy'), to_date('30-09-2009', 'dd-mm-yyyy'), to_date('30-09-2009', 'dd-mm-yyyy'), 'dsfs', 'watervehicle', '117', '33224', 'd', '7', 'f', to_date('30-09-2009', 'dd-mm-yyyy'), 't2', to_date('30-09-2009', 'dd-mm-yyyy'), 't2', 'N', 'VE-633899185903750000', 'asdfasfa', '[{"Lat":29.621221113784504,"Lng": 106.58669471740722},' || chr(13) || '' || chr(10) || '{"Lat":29.622414924968726,"Lng": 106.58849716186523},' || chr(13) || '' || chr(10) || '{"Lat":29.622713375554912,"Lng": 106.59004211425781},' || chr(13) || '' || chr(10) || '{"Lat":29.622489537698147,"Lng": 106.59201622009277},' || chr(13) || '' || chr(10) || '{"Lat":29.622564150372326,"Lng": 106.59356117248535},' || chr(13) || '' || chr(10) || '{"Lat":29.622489537698147,"Lng": 106.59510612487793},' || chr(13) || '' || chr(10) || '{"Lat":29.622489537698147,"Lng": 106.59690856933594},' || chr(13) || '' || chr(10) || '{"Lat":29.62219108644898,"Lng": 106.59871101379394},' || chr(13) || '' || chr(10) || '{"Lat":29.62181802114448,"Lng": 106.60128593444824},' || chr(13) || '' || chr(10) || '{"Lat":29.621370340955955,"Lng": 106.6032600402832},' || chr(13) || '' || chr(10) || '{"Lat":29.62151956790645,"Lng": 106.60557746887207},' || chr(13) || '' || chr(10) || '{"Lat":29.62189263431587,"Lng": 106.60737991333008},' || chr(13) || '' || chr(10) || '{"Lat":29.62219108644898,"Lng": 106.6087532043457},' || chr(13) || '' || chr(10) || '{"Lat":29.62323566195374,"Lng": 106.61064147949219},' || chr(13) || '' || chr(10) || '{"Lat":29.62338488614188,"Lng": 106.61184310913086},' || chr(13) || '' || chr(10) || '{"Lat":29.62323566195374,"Lng": 106.61381721496582},' || chr(13) || '' || chr(10) || '{"Lat":29.622787988063347,"Lng": 106.61476135253906},' || chr(13) || '' || chr(10) || '{"Lat":29.622713375554912,"Lng": 106.61622047424316},' || chr(13) || '' || chr(10) || '{"Lat":29.62353411010904,"Lng": 106.6171646118164},' || chr(13) || '' || chr(10) || '{"Lat":29.62435483797815,"Lng": 106.61836624145508},' || chr(13) || '' || chr(10) || '{"Lat":29.624877115868713,"Lng": 106.6208553314209},' || chr(13) || '' || chr(10) || '{"Lat":29.62525016984733,"Lng": 106.62257194519043},' || chr(13) || '' || chr(10) || '{"Lat":29.625026337625893,"Lng": 106.62420272827148},' || chr(13) || '' || chr(10) || '{"Lat":29.624504060508844,"Lng": 106.62549018859863},' || chr(13) || '' || chr(10) || '{"Lat":29.624131003767722,"Lng": 106.62703514099121},' || chr(13) || '' || chr(10) || '{"Lat":29.623011825257162,"Lng": 106.62849426269531},' || chr(13) || '' || chr(10) || '{"Lat":29.62129572739784,"Lng": 106.62952423095703},' || chr(13) || '' || chr(10) || '{"Lat":29.619952673904883,"Lng": 106.63089752197265},' || chr(13) || '' || chr(10) || '{"Lat":29.61950498542964,"Lng": 106.63235664367676},' || chr(13) || '' || chr(10) || '{"Lat":29.61913191018105,"Lng": 106.63390159606933},' || chr(13) || '' || chr(10) || '{"Lat":29.617042663267018,"Lng": 106.63561820983887},' || chr(13) || '' || chr(10) || '{"Lat":29.615624935338807,"Lng": 106.63613319396972},' || chr(13) || '' || chr(10) || '{"Lat":29.612938659314945,"Lng": 106.63613319396972},' || chr(13) || '' || chr(10) || '{"Lat":29.610103068072462,"Lng": 106.6362190246582},' || chr(13) || '' || chr(10) || '{"Lat":29.607565892513594,"Lng": 106.63639068603515},' || chr(13) || '' || chr(10) || '{"Lat":29.605401780554935,"Lng": 106.6387939453125},' || chr(13) || '' || chr(10) || '{"Lat":29.605401780554935,"Lng": 106.64059638977051},' || chr(13) || '' || chr(10) || '{"Lat":29.605252529742266,"Lng": 106.6431713104248},' || chr(13) || '' || chr(10) || '{"Lat":29.60428239407528,"Lng": 106.64523124694824},' || chr(13) || '' || chr(10) || '{"Lat":29.602789859440022,"Lng": 106.64703369140625},' || chr(13) || '' || chr(10) || '{"Lat":29.601670443967144,"Lng": 106.64849281311035},' || chr(13) || '' || chr(10) || '{"Lat":29.601073417301073,"Lng": 106.64960861206054},' || chr(13) || '' || chr(10) || '{"Lat":29.60062564498216,"Lng": 106.65244102478027}]');
insert into VEHICLETASK (TASKID, TASKNAME, PUBLICTIME, STARTTIME, ENDTIME, MODEL, TASKTYPE, CHARGEMAN, LICENSEPLATENUM, ISGASSUPPLIED, ISWATERSUPPLIED, ISREPAIRED, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, TASKCODE, MEMO, TRACE)
values ('43', '��������2', to_date('11-10-2009', 'dd-mm-yyyy'), to_date('11-10-2009', 'dd-mm-yyyy'), to_date('11-10-2009', 'dd-mm-yyyy'), null, 'watervehicle', '361', '��B��HF202', '0', 'e', 'b', to_date('11-10-2009', 'dd-mm-yyyy'), 't2', to_date('11-10-2009', 'dd-mm-yyyy'), 't2', 'N', 'VE-633908944220000000', '�ط��Ƿ�', '[{"Lat":29.621221113784504,"Lng": 106.58669471740722},' || chr(13) || '' || chr(10) || '{"Lat":29.622414924968726,"Lng": 106.58849716186523},' || chr(13) || '' || chr(10) || '{"Lat":29.622713375554912,"Lng": 106.59004211425781},' || chr(13) || '' || chr(10) || '{"Lat":29.622489537698147,"Lng": 106.59201622009277},' || chr(13) || '' || chr(10) || '{"Lat":29.622564150372326,"Lng": 106.59356117248535},' || chr(13) || '' || chr(10) || '{"Lat":29.622489537698147,"Lng": 106.59510612487793},' || chr(13) || '' || chr(10) || '{"Lat":29.622489537698147,"Lng": 106.59690856933594},' || chr(13) || '' || chr(10) || '{"Lat":29.62219108644898,"Lng": 106.59871101379394},' || chr(13) || '' || chr(10) || '{"Lat":29.62181802114448,"Lng": 106.60128593444824},' || chr(13) || '' || chr(10) || '{"Lat":29.621370340955955,"Lng": 106.6032600402832},' || chr(13) || '' || chr(10) || '{"Lat":29.62151956790645,"Lng": 106.60557746887207},' || chr(13) || '' || chr(10) || '{"Lat":29.62189263431587,"Lng": 106.60737991333008},' || chr(13) || '' || chr(10) || '{"Lat":29.62219108644898,"Lng": 106.6087532043457},' || chr(13) || '' || chr(10) || '{"Lat":29.62323566195374,"Lng": 106.61064147949219},' || chr(13) || '' || chr(10) || '{"Lat":29.62338488614188,"Lng": 106.61184310913086},' || chr(13) || '' || chr(10) || '{"Lat":29.62323566195374,"Lng": 106.61381721496582},' || chr(13) || '' || chr(10) || '{"Lat":29.622787988063347,"Lng": 106.61476135253906},' || chr(13) || '' || chr(10) || '{"Lat":29.622713375554912,"Lng": 106.61622047424316},' || chr(13) || '' || chr(10) || '{"Lat":29.62353411010904,"Lng": 106.6171646118164},' || chr(13) || '' || chr(10) || '{"Lat":29.62435483797815,"Lng": 106.61836624145508},' || chr(13) || '' || chr(10) || '{"Lat":29.624877115868713,"Lng": 106.6208553314209},' || chr(13) || '' || chr(10) || '{"Lat":29.62525016984733,"Lng": 106.62257194519043},' || chr(13) || '' || chr(10) || '{"Lat":29.625026337625893,"Lng": 106.62420272827148},' || chr(13) || '' || chr(10) || '{"Lat":29.624504060508844,"Lng": 106.62549018859863},' || chr(13) || '' || chr(10) || '{"Lat":29.624131003767722,"Lng": 106.62703514099121},' || chr(13) || '' || chr(10) || '{"Lat":29.623011825257162,"Lng": 106.62849426269531},' || chr(13) || '' || chr(10) || '{"Lat":29.62129572739784,"Lng": 106.62952423095703},' || chr(13) || '' || chr(10) || '{"Lat":29.619952673904883,"Lng": 106.63089752197265},' || chr(13) || '' || chr(10) || '{"Lat":29.61950498542964,"Lng": 106.63235664367676},' || chr(13) || '' || chr(10) || '{"Lat":29.61913191018105,"Lng": 106.63390159606933},' || chr(13) || '' || chr(10) || '{"Lat":29.617042663267018,"Lng": 106.63561820983887},' || chr(13) || '' || chr(10) || '{"Lat":29.615624935338807,"Lng": 106.63613319396972},' || chr(13) || '' || chr(10) || '{"Lat":29.612938659314945,"Lng": 106.63613319396972},' || chr(13) || '' || chr(10) || '{"Lat":29.610103068072462,"Lng": 106.6362190246582},' || chr(13) || '' || chr(10) || '{"Lat":29.607565892513594,"Lng": 106.63639068603515},' || chr(13) || '' || chr(10) || '{"Lat":29.605401780554935,"Lng": 106.6387939453125},' || chr(13) || '' || chr(10) || '{"Lat":29.605401780554935,"Lng": 106.64059638977051},' || chr(13) || '' || chr(10) || '{"Lat":29.605252529742266,"Lng": 106.6431713104248},' || chr(13) || '' || chr(10) || '{"Lat":29.60428239407528,"Lng": 106.64523124694824},' || chr(13) || '' || chr(10) || '{"Lat":29.602789859440022,"Lng": 106.64703369140625},' || chr(13) || '' || chr(10) || '{"Lat":29.601670443967144,"Lng": 106.64849281311035},' || chr(13) || '' || chr(10) || '{"Lat":29.601073417301073,"Lng": 106.64960861206054},' || chr(13) || '' || chr(10) || '{"Lat":29.60062564498216,"Lng": 106.65244102478027}]');
commit;
prompt 3 records loaded
prompt Loading VEHICLETASKDATA...
insert into VEHICLETASKDATA (VTDID, TASKID, VIDEOURL, LATITUDE, LONGITUDE, IMAGEURL, TICKETID, TICKETTYPE, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID)
values ('1', 'A00001', null, 29.6224895376981, 106.592016220093, '/test.jpg', 'CQG232554', '��Ʊ', to_date('08-10-2009', 'dd-mm-yyyy'), null, to_date('08-10-2009', 'dd-mm-yyyy'), null, 'N');
insert into VEHICLETASKDATA (VTDID, TASKID, VIDEOURL, LATITUDE, LONGITUDE, IMAGEURL, TICKETID, TICKETTYPE, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID)
values ('2', 'A00001', null, 29.6224895376981, 106.592016220093, '/test.jpg', 'CQG232554', '��Ʊ', to_date('08-10-2009 13:35:32', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('08-10-2009 13:35:32', 'dd-mm-yyyy hh24:mi:ss'), null, 'N');
insert into VEHICLETASKDATA (VTDID, TASKID, VIDEOURL, LATITUDE, LONGITUDE, IMAGEURL, TICKETID, TICKETTYPE, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID)
values ('3', 'A00001', null, 29.6224895376981, 106.592016220093, '/test.jpg', 'CQG232554', '��Ʊ', to_date('08-10-2009 13:35:32', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('08-10-2009 13:35:32', 'dd-mm-yyyy hh24:mi:ss'), null, 'N');
insert into VEHICLETASKDATA (VTDID, TASKID, VIDEOURL, LATITUDE, LONGITUDE, IMAGEURL, TICKETID, TICKETTYPE, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID)
values ('4', 'A00001', null, 29.6224895376981, 106.592016220093, '/test.jpg', 'CQG232554', '��Ʊ', to_date('08-10-2009 13:36:11', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('08-10-2009 13:36:11', 'dd-mm-yyyy hh24:mi:ss'), null, 'N');
insert into VEHICLETASKDATA (VTDID, TASKID, VIDEOURL, LATITUDE, LONGITUDE, IMAGEURL, TICKETID, TICKETTYPE, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID)
values ('5', 'A00001', '/test.flv', 29.6218926343159, 106.60737991333001, null, 'CQG232554', '��Ʊ', to_date('08-10-2009 13:46:13', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('08-10-2009 13:46:13', 'dd-mm-yyyy hh24:mi:ss'), null, 'N');
commit;
prompt 5 records loaded
prompt Loading VIDEO...
insert into VIDEO (VIDEOID, EVENTID, VIDEONAME, MEMO, VIDEOURL, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, DURATION, TRACE)
values ('A00001', null, '������Ƶ', null, 'http://locahost:6033/test.flv', to_date('11-10-2009 23:21:35', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-10-2009 23:21:35', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, 'N', null, '[{"Lat":29.621221113784504,"Lng": 106.58669471740722},' || chr(13) || '' || chr(10) || '{"Lat":29.622414924968726,"Lng": 106.58849716186523},' || chr(13) || '' || chr(10) || '{"Lat":29.622713375554912,"Lng": 106.59004211425781},' || chr(13) || '' || chr(10) || '{"Lat":29.622489537698147,"Lng": 106.59201622009277},' || chr(13) || '' || chr(10) || '{"Lat":29.622564150372326,"Lng": 106.59356117248535},' || chr(13) || '' || chr(10) || '{"Lat":29.622489537698147,"Lng": 106.59510612487793},' || chr(13) || '' || chr(10) || '{"Lat":29.622489537698147,"Lng": 106.59690856933594},' || chr(13) || '' || chr(10) || '{"Lat":29.62219108644898,"Lng": 106.59871101379394},' || chr(13) || '' || chr(10) || '{"Lat":29.62181802114448,"Lng": 106.60128593444824},' || chr(13) || '' || chr(10) || '{"Lat":29.621370340955955,"Lng": 106.6032600402832},' || chr(13) || '' || chr(10) || '{"Lat":29.62151956790645,"Lng": 106.60557746887207},' || chr(13) || '' || chr(10) || '{"Lat":29.62189263431587,"Lng": 106.60737991333008},' || chr(13) || '' || chr(10) || '{"Lat":29.62219108644898,"Lng": 106.6087532043457},' || chr(13) || '' || chr(10) || '{"Lat":29.62323566195374,"Lng": 106.61064147949219},' || chr(13) || '' || chr(10) || '{"Lat":29.62338488614188,"Lng": 106.61184310913086},' || chr(13) || '' || chr(10) || '{"Lat":29.62323566195374,"Lng": 106.61381721496582},' || chr(13) || '' || chr(10) || '{"Lat":29.622787988063347,"Lng": 106.61476135253906},' || chr(13) || '' || chr(10) || '{"Lat":29.622713375554912,"Lng": 106.61622047424316},' || chr(13) || '' || chr(10) || '{"Lat":29.62353411010904,"Lng": 106.6171646118164},' || chr(13) || '' || chr(10) || '{"Lat":29.62435483797815,"Lng": 106.61836624145508},' || chr(13) || '' || chr(10) || '{"Lat":29.624877115868713,"Lng": 106.6208553314209},' || chr(13) || '' || chr(10) || '{"Lat":29.62525016984733,"Lng": 106.62257194519043},' || chr(13) || '' || chr(10) || '{"Lat":29.625026337625893,"Lng": 106.62420272827148},' || chr(13) || '' || chr(10) || '{"Lat":29.624504060508844,"Lng": 106.62549018859863},' || chr(13) || '' || chr(10) || '{"Lat":29.624131003767722,"Lng": 106.62703514099121},' || chr(13) || '' || chr(10) || '{"Lat":29.623011825257162,"Lng": 106.62849426269531},' || chr(13) || '' || chr(10) || '{"Lat":29.62129572739784,"Lng": 106.62952423095703},' || chr(13) || '' || chr(10) || '{"Lat":29.619952673904883,"Lng": 106.63089752197265},' || chr(13) || '' || chr(10) || '{"Lat":29.61950498542964,"Lng": 106.63235664367676},' || chr(13) || '' || chr(10) || '{"Lat":29.61913191018105,"Lng": 106.63390159606933},' || chr(13) || '' || chr(10) || '{"Lat":29.617042663267018,"Lng": 106.63561820983887},' || chr(13) || '' || chr(10) || '{"Lat":29.615624935338807,"Lng": 106.63613319396972},' || chr(13) || '' || chr(10) || '{"Lat":29.612938659314945,"Lng": 106.63613319396972},' || chr(13) || '' || chr(10) || '{"Lat":29.610103068072462,"Lng": 106.6362190246582},' || chr(13) || '' || chr(10) || '{"Lat":29.607565892513594,"Lng": 106.63639068603515},' || chr(13) || '' || chr(10) || '{"Lat":29.605401780554935,"Lng": 106.6387939453125},' || chr(13) || '' || chr(10) || '{"Lat":29.605401780554935,"Lng": 106.64059638977051},' || chr(13) || '' || chr(10) || '{"Lat":29.605252529742266,"Lng": 106.6431713104248},' || chr(13) || '' || chr(10) || '{"Lat":29.60428239407528,"Lng": 106.64523124694824},' || chr(13) || '' || chr(10) || '{"Lat":29.602789859440022,"Lng": 106.64703369140625},' || chr(13) || '' || chr(10) || '{"Lat":29.601670443967144,"Lng": 106.64849281311035},' || chr(13) || '' || chr(10) || '{"Lat":29.601073417301073,"Lng": 106.64960861206054},' || chr(13) || '' || chr(10) || '{"Lat":29.60062564498216,"Lng": 106.65244102478027}]');
commit;
prompt 1 records loaded
prompt Enabling foreign key constraints for GEO...
alter table GEO enable constraint FK_GEO_RELGEO_GEO;
prompt Enabling foreign key constraints for ORGANIZATION...
alter table ORGANIZATION enable constraint FK_ORGANIZA_REFERENCE_ENUMERAT;
alter table ORGANIZATION enable constraint FK_ORGANIZA_RELORGCIT_GEO;
alter table ORGANIZATION enable constraint FK_ORGANIZA_RELORGCOU_GEO;
alter table ORGANIZATION enable constraint FK_ORGANIZA_RELORGPRO_GEO;
alter table ORGANIZATION enable constraint FK_ORGANIZA_RELPARENT_ORGANIZA;
prompt Enabling foreign key constraints for EMPLOYEE...
alter table EMPLOYEE enable constraint FK_EMPLOYEE_EMP_DEPT__ORGANIZA;
alter table EMPLOYEE enable constraint FK_EMPLOYEE_EMP_ORG_R_ORGANIZA;
alter table EMPLOYEE enable constraint FK_EMPLOYEE_REFERENCE_ENUMERAT;
alter table EMPLOYEE enable constraint FK_EMPLOYEE_RELATIONS_ENUMERAT;
alter table EMPLOYEE enable constraint FK_EMPLOYEE_RELEQUBIN_EQUIPMEN;
prompt Enabling foreign key constraints for EMERGENCYEVENT...
alter table EMERGENCYEVENT enable constraint FK_EMERGENC_REFERENCE_EMPLOYEE;
alter table EMERGENCYEVENT enable constraint FK_EMERGENC_REFERENCE_TIMESCHE;
prompt Enabling foreign key constraints for PROJECT...
alter table PROJECT enable constraint FK_PROJECT_REFERENCE_EMPLOYEE;
prompt Enabling foreign key constraints for ROAD...
alter table ROAD enable constraint FK_ROAD_RELATIONS_PROJECT;
prompt Enabling foreign key constraints for MPASSIGNMENT...
alter table MPASSIGNMENT enable constraint FK_MPASSIGN_REFERENCE_EMERGENC;
alter table MPASSIGNMENT enable constraint FK_MPASSIGN_REFERENCE_ENUMERAT;
alter table MPASSIGNMENT enable constraint FK_MPASSIGN_REFERENCE_TIMESCHE;
alter table MPASSIGNMENT enable constraint FK_MPASSIGN_RELATIONS_ROAD;
prompt Enabling foreign key constraints for MONITORPOINTINVIDEO...
alter table MONITORPOINTINVIDEO enable constraint FK_MONITORP_REFERENCE_MPASSIGN;
prompt Enabling foreign key constraints for PASSPORT...
alter table PASSPORT enable constraint FK_PASSPORT_EMPPASSPO_EMPLOYEE;
prompt Enabling foreign key constraints for QUALITY...
alter table QUALITY enable constraint FK_QUALITY_REFERENCE_ROAD;
alter table QUALITY enable constraint FK_QUALITY_RELATIONS_ENUMERAT;
alter table QUALITY enable constraint FK_QUALITY_RELCHARGE_EMPLOYEE;
alter table QUALITY enable constraint FK_QUALITY_RELEMERGE_EMPLOYEE;
alter table QUALITY enable constraint FK_QUALITY_RELEMPLOY_EMPLOYEE;
alter table QUALITY enable constraint FK_QUALITY_RELWORKUN_ORGANIZA;
prompt Enabling foreign key constraints for RESPERMISSION...
alter table RESPERMISSION enable constraint FK_RESPERMI_REFERENCE_OPERATIO;
alter table RESPERMISSION enable constraint FK_RESPERMI_REFERENCE_RESOURCE;
alter table RESPERMISSION enable constraint FK_RESPERMI_REFERENCE_ROLE;
prompt Enabling foreign key constraints for TIMEITEM...
alter table TIMEITEM enable constraint FK_TIMEITEM_REFERENCE_TIMESCHE;
prompt Enabling foreign key constraints for USERROLE...
alter table USERROLE enable constraint FK_USERROLE_USERROLE2_PASSPORT;
alter table USERROLE enable constraint FK_USERROLE_USERROLE_ROLE;
prompt Enabling foreign key constraints for VEHICLETASK...
alter table VEHICLETASK enable constraint FK_VEHICLET_REFERENCE_EMPLOYEE;
alter table VEHICLETASK enable constraint FK_VEHICLET_REFERENCE_ENUMERAT;
prompt Enabling foreign key constraints for VEHICLETASKDATA...
alter table VEHICLETASKDATA enable constraint FK_VEHICLET_REFERENCE_VEHICLET;
prompt Enabling triggers for ENUMERATION...
alter table ENUMERATION enable all triggers;
prompt Enabling triggers for EQUIPMENT...
alter table EQUIPMENT enable all triggers;
prompt Enabling triggers for GEO...
alter table GEO enable all triggers;
prompt Enabling triggers for ORGANIZATION...
alter table ORGANIZATION enable all triggers;
prompt Enabling triggers for EMPLOYEE...
alter table EMPLOYEE enable all triggers;
prompt Enabling triggers for TIMESCHEMA...
alter table TIMESCHEMA enable all triggers;
prompt Enabling triggers for EMERGENCYEVENT...
alter table EMERGENCYEVENT enable all triggers;
prompt Enabling triggers for LOG...
alter table LOG enable all triggers;
prompt Enabling triggers for MENU...
alter table MENU enable all triggers;
prompt Enabling triggers for PROJECT...
alter table PROJECT enable all triggers;
prompt Enabling triggers for ROAD...
alter table ROAD enable all triggers;
prompt Enabling triggers for MPASSIGNMENT...
alter table MPASSIGNMENT enable all triggers;
prompt Enabling triggers for MONITORPOINTINVIDEO...
alter table MONITORPOINTINVIDEO enable all triggers;
prompt Enabling triggers for OPERATION...
alter table OPERATION enable all triggers;
prompt Enabling triggers for PASSPORT...
alter table PASSPORT enable all triggers;
prompt Enabling triggers for QUALITY...
alter table QUALITY enable all triggers;
prompt Enabling triggers for RESOURCEITEM...
alter table RESOURCEITEM enable all triggers;
prompt Enabling triggers for ROLE...
alter table ROLE enable all triggers;
prompt Enabling triggers for RESPERMISSION...
alter table RESPERMISSION enable all triggers;
prompt Enabling triggers for TIMEITEM...
alter table TIMEITEM enable all triggers;
prompt Enabling triggers for USERROLE...
alter table USERROLE enable all triggers;
prompt Enabling triggers for VEHICLETASK...
alter table VEHICLETASK enable all triggers;
prompt Enabling triggers for VEHICLETASKDATA...
alter table VEHICLETASKDATA enable all triggers;
prompt Enabling triggers for VIDEO...
alter table VIDEO enable all triggers;
set feedback on
set define on
prompt Done.
