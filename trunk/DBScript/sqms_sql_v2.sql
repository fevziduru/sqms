/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     2009-8-8 0:55:03                             */
/*==============================================================*/


ALTER TABLE DEPARTMENT
   DROP CONSTRAINT FK_DEPARTME_ORGDEPT_ORAGANIZ;

ALTER TABLE DEPARTMENT
   DROP CONSTRAINT FK_DEPARTME_RELDEPTCI_GEO;

ALTER TABLE DEPARTMENT
   DROP CONSTRAINT FK_DEPARTME_RELDEPTCO_GEO;

ALTER TABLE DEPARTMENT
   DROP CONSTRAINT FK_DEPARTME_RELDEPTPR_GEO;

ALTER TABLE DEPARTMENT
   DROP CONSTRAINT FK_DEPARTME_RELPARENT_DEPARTME;

ALTER TABLE EMPLOYEE
   DROP CONSTRAINT FK_EMPLOYEE_RELATIONS_ENUMERAT;

ALTER TABLE EMPLOYEE
   DROP CONSTRAINT FK_EMPLOYEE_RELDEPTEM_DEPARTME;

ALTER TABLE EMPLOYEE
   DROP CONSTRAINT FK_EMPLOYEE_RELEQUBIN_EQUIPMEN;

ALTER TABLE GEO
   DROP CONSTRAINT FK_GEO_RELGEO_GEO;

ALTER TABLE MPASSIGNMENT
   DROP CONSTRAINT FK_MPASSIGN_RELATIONS_ROAD;

ALTER TABLE ORAGANIZATION
   DROP CONSTRAINT FK_ORAGANIZ_FK_ORAGAN_DATABASE;

ALTER TABLE ORAGANIZATION
   DROP CONSTRAINT FK_ORAGANIZ_FK_ORAGAN_SUITE;

ALTER TABLE ORAGANIZATION
   DROP CONSTRAINT FK_ORAGANIZ_RELORGCIT_GEO;

ALTER TABLE ORAGANIZATION
   DROP CONSTRAINT FK_ORAGANIZ_RELORGCOU_GEO;

ALTER TABLE ORAGANIZATION
   DROP CONSTRAINT FK_ORAGANIZ_RELORGPRO_GEO;

ALTER TABLE ORAGANIZATION
   DROP CONSTRAINT FK_ORAGANIZ_RELPARENT_ORAGANIZ;

ALTER TABLE PASSPORT
   DROP CONSTRAINT FK_PASSPORT_EMPPASSPO_EMPLOYEE;

ALTER TABLE QUALITY
   DROP CONSTRAINT FK_QUALITY_RELATIONS_MPASSIGN;

ALTER TABLE QUALITY
   DROP CONSTRAINT FK_QUALITY_RELATIONS_ENUMERAT;

ALTER TABLE QUALITY
   DROP CONSTRAINT FK_QUALITY_RELCHARGE_EMPLOYEE;

ALTER TABLE QUALITY
   DROP CONSTRAINT FK_QUALITY_RELEMERGE_EMPLOYEE;

ALTER TABLE QUALITY
   DROP CONSTRAINT FK_QUALITY_RELEMPLOY_EMPLOYEE;

ALTER TABLE QUALITY
   DROP CONSTRAINT FK_QUALITY_RELWORKUN_ORAGANIZ;

ALTER TABLE RESPERMISSION
   DROP CONSTRAINT FK_RESPERMI_PERMRESOU_RESOURCE;

ALTER TABLE RESPERMISSION
   DROP CONSTRAINT FK_RESPERMI_PERMRESOU_OPERATIO;

ALTER TABLE RESPERMISSION
   DROP CONSTRAINT FK_RESPERMI_REFERENCE_ROLE;

ALTER TABLE ROAD
   DROP CONSTRAINT FK_ROAD_RELATIONS_PROJECT;

ALTER TABLE ROLEPERMISSION
   DROP CONSTRAINT FK_ROLEPERM_ROLEPERMI_ROLE;

ALTER TABLE ROLEPERMISSION
   DROP CONSTRAINT FK_ROLEPERM_ROLEPERMI_PERMISSI;

ALTER TABLE SUITE
   DROP CONSTRAINT FK_SUITE_FK_SUITE__DATABASE;

ALTER TABLE USERROLE
   DROP CONSTRAINT FK_USERROLE_USERROLE_ROLE;

ALTER TABLE USERROLE
   DROP CONSTRAINT FK_USERROLE_USERROLE2_PASSPORT;

DROP TABLE DATABASE CASCADE CONSTRAINTS;

DROP INDEX ORGDEPT_FK;

DROP INDEX RELPARENTDEPT_FK;

DROP INDEX RELDEPTCITY_FK;

DROP INDEX RELDEPTPROVINCE_FK;

DROP INDEX RELDEPTCOUNTRY_FK;

DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;

DROP INDEX RELATIONSHIP_14_FK;

DROP INDEX RELEQUBIND_FK;

DROP INDEX RELDEPTEMP_FK;

DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;

DROP TABLE ENUMERATION CASCADE CONSTRAINTS;

DROP TABLE EQUIPMENT CASCADE CONSTRAINTS;

DROP INDEX RELGEO_FK;

DROP TABLE GEO CASCADE CONSTRAINTS;

DROP TABLE LOG CASCADE CONSTRAINTS;

DROP INDEX RELATIONSHIP_7_FK;

DROP TABLE MPASSIGNMENT CASCADE CONSTRAINTS;

DROP TABLE OPERATION CASCADE CONSTRAINTS;

DROP INDEX RELDATABASE_FK;

DROP INDEX RELSUITE_FK;

DROP INDEX RELPARENTORG_FK;

DROP INDEX RELORGCOUNTRY_FK;

DROP INDEX RELORGCITY_FK;

DROP INDEX RELORGPROVINCE_FK;

DROP TABLE ORAGANIZATION CASCADE CONSTRAINTS;

DROP INDEX EMPPASSPORT_FK;

DROP TABLE PASSPORT CASCADE CONSTRAINTS;

DROP TABLE PROJECT CASCADE CONSTRAINTS;

DROP INDEX RELATIONSHIP_8_FK;

DROP INDEX RELATIONSHIP_6_FK;

DROP INDEX RELWORKUNIT_FK;

DROP INDEX RELEMPLOYEE_FK;

DROP INDEX RELEMERGENCYPERSON_FK;

DROP INDEX RELCHARGEPERSON_FK;

DROP TABLE QUALITY CASCADE CONSTRAINTS;

DROP TABLE RESOURCEITEM CASCADE CONSTRAINTS;

DROP INDEX PERMRESOURCE3_FK;

DROP INDEX PERMRESOURCE2_FK;

DROP INDEX PERMRESOURCE_PK;

DROP TABLE RESPERMISSION CASCADE CONSTRAINTS;

DROP INDEX RELATIONSHIP_5_FK;

DROP TABLE ROAD CASCADE CONSTRAINTS;

DROP TABLE ROLE CASCADE CONSTRAINTS;

DROP INDEX ROLEPERMISSION2_FK;

DROP INDEX ROLEPERMISSION_FK;

DROP TABLE ROLEPERMISSION CASCADE CONSTRAINTS;

DROP INDEX I_SUITE_DATABASE_FK;

DROP TABLE SUITE CASCADE CONSTRAINTS;

DROP INDEX USERROLE2_FK;

DROP INDEX USERROLE_FK;

DROP TABLE USERROLE CASCADE CONSTRAINTS;

/*==============================================================*/
/* Table: DATABASE                                              */
/*==============================================================*/
CREATE TABLE DATABASE  (
   DATABASEID           VARCHAR2(40)                    NOT NULL,
   CONNECTIONSTRING     VARCHAR2(255),
   ISVOID               CHAR(1)                        DEFAULT 'N',
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   CONSTRAINT PK_DATABASE PRIMARY KEY (DATABASEID)
);

COMMENT ON TABLE DATABASE IS
'Database';

COMMENT ON COLUMN DATABASE.DATABASEID IS
'���ݿ�ID';

COMMENT ON COLUMN DATABASE.CONNECTIONSTRING IS
'�����ַ���';

COMMENT ON COLUMN DATABASE.ISVOID IS
'�Ƿ�ͣ��';

COMMENT ON COLUMN DATABASE.CREATED IS
'Created';

COMMENT ON COLUMN DATABASE.CREATEDBY IS
'CreatedBy';

COMMENT ON COLUMN DATABASE.MODIFIED IS
'Modified';

COMMENT ON COLUMN DATABASE.MODIFIEDBY IS
'ModifiedBy';

/*==============================================================*/
/* Table: DEPARTMENT                                            */
/*==============================================================*/
CREATE TABLE DEPARTMENT  (
   DEPTID               VARCHAR2(40)                    NOT NULL,
   PARENTDEPT           VARCHAR2(40),
   COUNTRY              VARCHAR2(40),
   PROVINCE             VARCHAR2(40),
   ORGID                VARCHAR2(40),
   CITY                 VARCHAR2(40),
   DEPTCODE             VARCHAR2(40)                    NOT NULL,
   DEPTNAME             VARCHAR2(60)                    NOT NULL,
   ISVOID               CHAR(1),
   CONTACTTEL           VARCHAR2(20),
   ADDRESS              VARCHAR2(200),
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIEDBY           VARCHAR2(40),
   CONSTRAINT PK_DEPARTMENT PRIMARY KEY (DEPTID)
);

COMMENT ON TABLE DEPARTMENT IS
'����';

COMMENT ON COLUMN DEPARTMENT.DEPTID IS
'����ID';

COMMENT ON COLUMN DEPARTMENT.PARENTDEPT IS
'�ϼ�����';

COMMENT ON COLUMN DEPARTMENT.COUNTRY IS
'����';

COMMENT ON COLUMN DEPARTMENT.PROVINCE IS
'ʡ';

COMMENT ON COLUMN DEPARTMENT.ORGID IS
'��������';

COMMENT ON COLUMN DEPARTMENT.CITY IS
'��';

COMMENT ON COLUMN DEPARTMENT.DEPTCODE IS
'���ű���';

COMMENT ON COLUMN DEPARTMENT.DEPTNAME IS
'��������';

COMMENT ON COLUMN DEPARTMENT.ISVOID IS
'����';

COMMENT ON COLUMN DEPARTMENT.CONTACTTEL IS
'��ϵ�绰';

COMMENT ON COLUMN DEPARTMENT.ADDRESS IS
'��ַ';

COMMENT ON COLUMN DEPARTMENT.MEMO IS
'��ע';

COMMENT ON COLUMN DEPARTMENT.CREATED IS
'����ʱ��';

COMMENT ON COLUMN DEPARTMENT.CREATEDBY IS
'������';

COMMENT ON COLUMN DEPARTMENT.MODIFIEDBY IS
'�޸���';

/*==============================================================*/
/* Index: RELDEPTCOUNTRY_FK                                     */
/*==============================================================*/
CREATE INDEX RELDEPTCOUNTRY_FK ON DEPARTMENT (
   COUNTRY ASC
);

/*==============================================================*/
/* Index: RELDEPTPROVINCE_FK                                    */
/*==============================================================*/
CREATE INDEX RELDEPTPROVINCE_FK ON DEPARTMENT (
   PROVINCE ASC
);

/*==============================================================*/
/* Index: RELDEPTCITY_FK                                        */
/*==============================================================*/
CREATE INDEX RELDEPTCITY_FK ON DEPARTMENT (
   CITY ASC
);

/*==============================================================*/
/* Index: RELPARENTDEPT_FK                                      */
/*==============================================================*/
CREATE INDEX RELPARENTDEPT_FK ON DEPARTMENT (
   PARENTDEPT ASC
);

/*==============================================================*/
/* Index: ORGDEPT_FK                                            */
/*==============================================================*/
CREATE INDEX ORGDEPT_FK ON DEPARTMENT (
   ORGID ASC
);

/*==============================================================*/
/* Table: EMPLOYEE                                              */
/*==============================================================*/
CREATE TABLE EMPLOYEE  (
   EMPID                VARCHAR2(40)                    NOT NULL,
   DEPTID               VARCHAR2(40),
   EQUID                VARCHAR2(40),
   SEX                  VARCHAR2(40),
   EMPNAME              VARCHAR2(60)                    NOT NULL,
   EMPCODE              VARCHAR2(40)                    NOT NULL,
   EMPSTATUS            VARCHAR2(20),
   MOBILE               VARCHAR2(20),
   ISVOID               CHAR(1),
   JOBTITLE             VARCHAR2(40),
   CONTACTTEL           VARCHAR2(20),
   BIRTHDAY             DATE,
   DEGREE               VARCHAR2(20),
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIEDBY           VARCHAR2(40),
   MODIFIED             DATE,
   CONSTRAINT PK_EMPLOYEE PRIMARY KEY (EMPID)
);

COMMENT ON TABLE EMPLOYEE IS
'ְԱ';

COMMENT ON COLUMN EMPLOYEE.EMPID IS
'ְԱID';

COMMENT ON COLUMN EMPLOYEE.DEPTID IS
'��������';

COMMENT ON COLUMN EMPLOYEE.EQUID IS
'�ƶ��豸';

COMMENT ON COLUMN EMPLOYEE.SEX IS
'�Ա�';

COMMENT ON COLUMN EMPLOYEE.EMPNAME IS
'ְԱ����';

COMMENT ON COLUMN EMPLOYEE.EMPCODE IS
'ְԱ����';

COMMENT ON COLUMN EMPLOYEE.EMPSTATUS IS
'ְԱ״̬';

COMMENT ON COLUMN EMPLOYEE.MOBILE IS
'�ƶ��绰';

COMMENT ON COLUMN EMPLOYEE.ISVOID IS
'����';

COMMENT ON COLUMN EMPLOYEE.JOBTITLE IS
'ְλ';

COMMENT ON COLUMN EMPLOYEE.CONTACTTEL IS
'��ϵ�绰';

COMMENT ON COLUMN EMPLOYEE.BIRTHDAY IS
'��������';

COMMENT ON COLUMN EMPLOYEE.DEGREE IS
'ѧ��';

COMMENT ON COLUMN EMPLOYEE.MEMO IS
'��ע';

COMMENT ON COLUMN EMPLOYEE.CREATED IS
'����ʱ��';

COMMENT ON COLUMN EMPLOYEE.CREATEDBY IS
'������';

COMMENT ON COLUMN EMPLOYEE.MODIFIEDBY IS
'�޸���';

COMMENT ON COLUMN EMPLOYEE.MODIFIED IS
'�޸�ʱ��';

/*==============================================================*/
/* Index: RELDEPTEMP_FK                                         */
/*==============================================================*/
CREATE INDEX RELDEPTEMP_FK ON EMPLOYEE (
   DEPTID ASC
);

/*==============================================================*/
/* Index: RELEQUBIND_FK                                         */
/*==============================================================*/
CREATE INDEX RELEQUBIND_FK ON EMPLOYEE (
   EQUID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
CREATE INDEX RELATIONSHIP_14_FK ON EMPLOYEE (
   SEX ASC
);

/*==============================================================*/
/* Table: ENUMERATION                                           */
/*==============================================================*/
CREATE TABLE ENUMERATION  (
   ENUMID               VARCHAR2(40)                    NOT NULL,
   ENUMCODE             VARCHAR2(40),
   ENUMNAME             VARCHAR2(60),
   ENUMTYPE             VARCHAR2(60),
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   CONSTRAINT PK_ENUMERATION PRIMARY KEY (ENUMID)
);

COMMENT ON TABLE ENUMERATION IS
'ö��';

COMMENT ON COLUMN ENUMERATION.ENUMID IS
'ö��ID';

COMMENT ON COLUMN ENUMERATION.ENUMCODE IS
'ö�ٱ���';

COMMENT ON COLUMN ENUMERATION.ENUMNAME IS
'ö������';

COMMENT ON COLUMN ENUMERATION.ENUMTYPE IS
'ö������';

COMMENT ON COLUMN ENUMERATION.MEMO IS
'��ע';

COMMENT ON COLUMN ENUMERATION.CREATED IS
'����ʱ��';

COMMENT ON COLUMN ENUMERATION.CREATEDBY IS
'������';

COMMENT ON COLUMN ENUMERATION.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN ENUMERATION.MODIFIEDBY IS
'�޸���';

/*==============================================================*/
/* Table: EQUIPMENT                                             */
/*==============================================================*/
CREATE TABLE EQUIPMENT  (
   EQUID                VARCHAR2(40)                    NOT NULL,
   EQUCODE              VARCHAR2(40)                    NOT NULL,
   EQUNAME              VARCHAR2(60)                    NOT NULL,
   IDENTIFY             VARCHAR2(40)                    NOT NULL,
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   CONSTRAINT PK_EQUIPMENT PRIMARY KEY (EQUID)
);

COMMENT ON TABLE EQUIPMENT IS
'�豸';

COMMENT ON COLUMN EQUIPMENT.EQUID IS
'�豸ID';

COMMENT ON COLUMN EQUIPMENT.EQUCODE IS
'�豸����';

COMMENT ON COLUMN EQUIPMENT.EQUNAME IS
'�豸����';

COMMENT ON COLUMN EQUIPMENT.IDENTIFY IS
'�豸��ʶ';

COMMENT ON COLUMN EQUIPMENT.MEMO IS
'��ע';

COMMENT ON COLUMN EQUIPMENT.CREATED IS
'����ʱ��';

COMMENT ON COLUMN EQUIPMENT.CREATEDBY IS
'������';

COMMENT ON COLUMN EQUIPMENT.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN EQUIPMENT.MODIFIEDBY IS
'�޸���';

/*==============================================================*/
/* Table: GEO                                                   */
/*==============================================================*/
CREATE TABLE GEO  (
   GEOID                VARCHAR2(40)                    NOT NULL,
   PARENTGEO            VARCHAR2(40),
   GEOCODE              VARCHAR2(40)                    NOT NULL,
   GEONAME              VARCHAR2(60)                    NOT NULL,
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   CONSTRAINT PK_GEO PRIMARY KEY (GEOID)
);

COMMENT ON TABLE GEO IS
'����';

COMMENT ON COLUMN GEO.GEOID IS
'����ID';

COMMENT ON COLUMN GEO.PARENTGEO IS
'�ϼ�����';

COMMENT ON COLUMN GEO.GEOCODE IS
'��������';

COMMENT ON COLUMN GEO.GEONAME IS
'��������';

COMMENT ON COLUMN GEO.MEMO IS
'��ע';

COMMENT ON COLUMN GEO.CREATED IS
'����ʱ��';

COMMENT ON COLUMN GEO.CREATEDBY IS
'������';

COMMENT ON COLUMN GEO.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN GEO.MODIFIEDBY IS
'�޸���';

/*==============================================================*/
/* Index: RELGEO_FK                                             */
/*==============================================================*/
CREATE INDEX RELGEO_FK ON GEO (
   PARENTGEO ASC
);

/*==============================================================*/
/* Table: LOG                                                   */
/*==============================================================*/
CREATE TABLE LOG  (
   LOGID                VARCHAR2(40)                    NOT NULL,
   LOGCODE              VARCHAR2(40)                    NOT NULL,
   LOGTYPE              VARCHAR2(20)                    NOT NULL,
   "LEVEL"              VARCHAR2(20)                    NOT NULL,
   LOGSOURCE            VARCHAR2(200)                   NOT NULL,
   CONTENT              VARCHAR2(1000),
   RECORDTIME           DATE                            NOT NULL,
   ISVOID               CHAR(1),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   CONSTRAINT PK_LOG PRIMARY KEY (LOGID)
);

COMMENT ON TABLE LOG IS
'��־';

COMMENT ON COLUMN LOG.LOGID IS
'��־ID';

COMMENT ON COLUMN LOG.LOGCODE IS
'��־����';

COMMENT ON COLUMN LOG.LOGTYPE IS
'����';

COMMENT ON COLUMN LOG."LEVEL" IS
'����';

COMMENT ON COLUMN LOG.LOGSOURCE IS
'��Դ';

COMMENT ON COLUMN LOG.CONTENT IS
'����';

COMMENT ON COLUMN LOG.RECORDTIME IS
'��¼ʱ��';

COMMENT ON COLUMN LOG.ISVOID IS
'����';

COMMENT ON COLUMN LOG.CREATED IS
'����ʱ��';

COMMENT ON COLUMN LOG.CREATEDBY IS
'������';

COMMENT ON COLUMN LOG.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN LOG.MODIFIEDBY IS
'�޸���';

/*==============================================================*/
/* Table: MPASSIGNMENT                                          */
/*==============================================================*/
CREATE TABLE MPASSIGNMENT  (
   MPID                 VARCHAR2(40)                    NOT NULL,
   ROADID               VARCHAR2(40),
   MPCODE               VARCHAR2(40),
   MPNAME               VARCHAR2(200),
   LONGITUDE            NUMBER(3,10),
   LATITUDE             NUMBER(3,10),
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   CONSTRAINT PK_MPASSIGNMENT PRIMARY KEY (MPID)
);

COMMENT ON TABLE MPASSIGNMENT IS
'��ص����';

COMMENT ON COLUMN MPASSIGNMENT.MPID IS
'��ص�ID';

COMMENT ON COLUMN MPASSIGNMENT.ROADID IS
'·��ID';

COMMENT ON COLUMN MPASSIGNMENT.MPCODE IS
'��ص����';

COMMENT ON COLUMN MPASSIGNMENT.MPNAME IS
'��ص�����';

COMMENT ON COLUMN MPASSIGNMENT.LONGITUDE IS
'����';

COMMENT ON COLUMN MPASSIGNMENT.LATITUDE IS
'γ��';

COMMENT ON COLUMN MPASSIGNMENT.MEMO IS
'��ע';

COMMENT ON COLUMN MPASSIGNMENT.CREATED IS
'����ʱ��';

COMMENT ON COLUMN MPASSIGNMENT.CREATEDBY IS
'������';

COMMENT ON COLUMN MPASSIGNMENT.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN MPASSIGNMENT.MODIFIEDBY IS
'�޸���';

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
CREATE INDEX RELATIONSHIP_7_FK ON MPASSIGNMENT (
   ROADID ASC
);

/*==============================================================*/
/* Table: OPERATION                                             */
/*==============================================================*/
CREATE TABLE OPERATION  (
   OPID                 VARCHAR2(40)                    NOT NULL,
   OPCODE               VARCHAR2(40)                    NOT NULL,
   OPNAME               VARCHAR2(60)                    NOT NULL,
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   CONSTRAINT PK_OPERATION PRIMARY KEY (OPID)
);

COMMENT ON TABLE OPERATION IS
'����';

COMMENT ON COLUMN OPERATION.OPID IS
'����ID';

COMMENT ON COLUMN OPERATION.OPCODE IS
'��������';

COMMENT ON COLUMN OPERATION.OPNAME IS
'��������';

COMMENT ON COLUMN OPERATION.MEMO IS
'��ע';

COMMENT ON COLUMN OPERATION.CREATED IS
'����ʱ��';

COMMENT ON COLUMN OPERATION.CREATEDBY IS
'������';

COMMENT ON COLUMN OPERATION.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN OPERATION.MODIFIEDBY IS
'�޸���';

/*==============================================================*/
/* Table: ORAGANIZATION                                         */
/*==============================================================*/
CREATE TABLE ORAGANIZATION  (
   ORGID                VARCHAR2(40)                    NOT NULL,
   COUNTRY              VARCHAR2(40),
   CITY                 VARCHAR2(40),
   PARENTORG            VARCHAR2(40),
   PROVINCE             VARCHAR2(40),
   SUITEID              VARCHAR2(40),
   DATABASEID           VARCHAR2(40),
   ORGCODE              VARCHAR2(40)                    NOT NULL,
   ORGNAME              VARCHAR2(60),
   ORGTYPE              VARCHAR2(60),
   ORGALIAS             VARCHAR2(60),
   ORGSTATUS            VARCHAR2(2000),
   ORGADDRESS           VARCHAR2(200),
   ZIPCODE              VARCHAR2(20),
   CONTACT              VARCHAR2(20),
   CONTACTTEL           VARCHAR2(20),
   EMAIL                VARCHAR2(100),
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIEDBY           VARCHAR2(40),
   ISVOID               CHAR(1),
   CONSTRAINT PK_ORAGANIZATION PRIMARY KEY (ORGID)
);

COMMENT ON TABLE ORAGANIZATION IS
'����';

COMMENT ON COLUMN ORAGANIZATION.ORGID IS
'����ID';

COMMENT ON COLUMN ORAGANIZATION.COUNTRY IS
'����';

COMMENT ON COLUMN ORAGANIZATION.CITY IS
'��';

COMMENT ON COLUMN ORAGANIZATION.PARENTORG IS
'�ϼ�����';

COMMENT ON COLUMN ORAGANIZATION.PROVINCE IS
'ʡ';

COMMENT ON COLUMN ORAGANIZATION.SUITEID IS
'SuiteId';

COMMENT ON COLUMN ORAGANIZATION.DATABASEID IS
'DatabaseId';

COMMENT ON COLUMN ORAGANIZATION.ORGCODE IS
'��������';

COMMENT ON COLUMN ORAGANIZATION.ORGNAME IS
'��������';

COMMENT ON COLUMN ORAGANIZATION.ORGTYPE IS
'��������';

COMMENT ON COLUMN ORAGANIZATION.ORGALIAS IS
'���';

COMMENT ON COLUMN ORAGANIZATION.ORGSTATUS IS
'�����ſ�';

COMMENT ON COLUMN ORAGANIZATION.ORGADDRESS IS
'������ַ';

COMMENT ON COLUMN ORAGANIZATION.ZIPCODE IS
'�ʱ�';

COMMENT ON COLUMN ORAGANIZATION.CONTACT IS
'��ϵ��';

COMMENT ON COLUMN ORAGANIZATION.CONTACTTEL IS
'��ϵ�绰';

COMMENT ON COLUMN ORAGANIZATION.EMAIL IS
'Email';

COMMENT ON COLUMN ORAGANIZATION.MEMO IS
'��ע';

COMMENT ON COLUMN ORAGANIZATION.CREATED IS
'����ʱ��';

COMMENT ON COLUMN ORAGANIZATION.CREATEDBY IS
'������';

COMMENT ON COLUMN ORAGANIZATION.MODIFIEDBY IS
'�޸���';

COMMENT ON COLUMN ORAGANIZATION.ISVOID IS
'����';

/*==============================================================*/
/* Index: RELORGPROVINCE_FK                                     */
/*==============================================================*/
CREATE INDEX RELORGPROVINCE_FK ON ORAGANIZATION (
   PROVINCE ASC
);

/*==============================================================*/
/* Index: RELORGCITY_FK                                         */
/*==============================================================*/
CREATE INDEX RELORGCITY_FK ON ORAGANIZATION (
   CITY ASC
);

/*==============================================================*/
/* Index: RELORGCOUNTRY_FK                                      */
/*==============================================================*/
CREATE INDEX RELORGCOUNTRY_FK ON ORAGANIZATION (
   COUNTRY ASC
);

/*==============================================================*/
/* Index: RELPARENTORG_FK                                       */
/*==============================================================*/
CREATE INDEX RELPARENTORG_FK ON ORAGANIZATION (
   PARENTORG ASC
);

/*==============================================================*/
/* Index: RELSUITE_FK                                           */
/*==============================================================*/
CREATE UNIQUE INDEX RELSUITE_FK ON ORAGANIZATION (
   SUITEID ASC
);

/*==============================================================*/
/* Index: RELDATABASE_FK                                        */
/*==============================================================*/
CREATE INDEX RELDATABASE_FK ON ORAGANIZATION (
   DATABASEID ASC
);

/*==============================================================*/
/* Table: PASSPORT                                              */
/*==============================================================*/
CREATE TABLE PASSPORT  (
   PASSPORTID           VARCHAR2(40)                    NOT NULL,
   EMPID                VARCHAR2(40)                    NOT NULL,
   PASSPORTCODE         VARCHAR2(40)                    NOT NULL,
   PASSPORT             VARCHAR2(60)                    NOT NULL,
   PASSWORD             VARCHAR2(20),
   ISVOID               CHAR(1),
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   CONSTRAINT PK_PASSPORT PRIMARY KEY (PASSPORTID)
);

COMMENT ON TABLE PASSPORT IS
'�˺�';

COMMENT ON COLUMN PASSPORT.PASSPORTID IS
'�˺�ID';

COMMENT ON COLUMN PASSPORT.EMPID IS
'ְԱ';

COMMENT ON COLUMN PASSPORT.PASSPORTCODE IS
'�˺ű���';

COMMENT ON COLUMN PASSPORT.PASSPORT IS
'�˺�';

COMMENT ON COLUMN PASSPORT.PASSWORD IS
'����';

COMMENT ON COLUMN PASSPORT.ISVOID IS
'����';

COMMENT ON COLUMN PASSPORT.MEMO IS
'��ע';

COMMENT ON COLUMN PASSPORT.CREATED IS
'����ʱ��';

COMMENT ON COLUMN PASSPORT.CREATEDBY IS
'������';

COMMENT ON COLUMN PASSPORT.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN PASSPORT.MODIFIEDBY IS
'�޸���';

/*==============================================================*/
/* Index: EMPPASSPORT_FK                                        */
/*==============================================================*/
CREATE INDEX EMPPASSPORT_FK ON PASSPORT (
   EMPID ASC
);

/*==============================================================*/
/* Table: PROJECT                                               */
/*==============================================================*/
CREATE TABLE PROJECT  (
   PROJECTID            VARCHAR2(40)                    NOT NULL,
   PROJECTCODE          VARCHAR2(40),
   PROJECTNAME          VARCHAR2(600),
   TOTALWORKTIME        NUMBER(12,4),
   TOTALSCALE           NUMBER(12,4),
   ASSISTAMOUNT         INTEGER,
   LEADERAMOUNT         INTEGER,
   VISELEADERAMOUNT     INTEGER,
   TOTALWORKERAMOUNT    INTEGER,
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   CONSTRAINT PK_PROJECT PRIMARY KEY (PROJECTID)
);

COMMENT ON TABLE PROJECT IS
'��Ŀ';

COMMENT ON COLUMN PROJECT.PROJECTID IS
'��ĿID';

COMMENT ON COLUMN PROJECT.PROJECTCODE IS
'��Ŀ����';

COMMENT ON COLUMN PROJECT.PROJECTNAME IS
'��Ŀ����';

COMMENT ON COLUMN PROJECT.TOTALWORKTIME IS
'����ҵʱ��';

COMMENT ON COLUMN PROJECT.TOTALSCALE IS
'�ܹ�ģ';

COMMENT ON COLUMN PROJECT.ASSISTAMOUNT IS
'��������';

COMMENT ON COLUMN PROJECT.LEADERAMOUNT IS
'�鳤����';

COMMENT ON COLUMN PROJECT.VISELEADERAMOUNT IS
'���鳤����';

COMMENT ON COLUMN PROJECT.TOTALWORKERAMOUNT IS
'�ܹ�����';

COMMENT ON COLUMN PROJECT.MEMO IS
'��ע';

COMMENT ON COLUMN PROJECT.CREATED IS
'����ʱ��';

COMMENT ON COLUMN PROJECT.CREATEDBY IS
'������';

COMMENT ON COLUMN PROJECT.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN PROJECT.MODIFIEDBY IS
'�޸���';

/*==============================================================*/
/* Table: QUALITY                                               */
/*==============================================================*/
CREATE TABLE QUALITY  (
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   QMID                 VARCHAR2(40)                    NOT NULL,
   CHARGEPERSON         VARCHAR2(40),
   WORKUNIT             VARCHAR2(40),
   STATUS               VARCHAR2(40),
   MPID                 VARCHAR2(40),
   EMERGENCYPERSON      VARCHAR2(40),
   QMCODE               VARCHAR2(40),
   CHECKPERSON          VARCHAR2(40),
   MATERIAL             VARCHAR2(2000)                  NOT NULL,
   LONGITUDE            NUMBER(3,10),
   LATITUDE             NUMBER(3,10),
   CONSTRAINT PK_QUALITY PRIMARY KEY (QMID)
);

COMMENT ON TABLE QUALITY IS
'��������';

COMMENT ON COLUMN QUALITY.MEMO IS
'��ע';

COMMENT ON COLUMN QUALITY.CREATED IS
'����ʱ��';

COMMENT ON COLUMN QUALITY.CREATEDBY IS
'������';

COMMENT ON COLUMN QUALITY.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN QUALITY.MODIFIEDBY IS
'�޸���';

COMMENT ON COLUMN QUALITY.QMID IS
'QMID';

COMMENT ON COLUMN QUALITY.CHARGEPERSON IS
'������';

COMMENT ON COLUMN QUALITY.WORKUNIT IS
'��ҵ��λ';

COMMENT ON COLUMN QUALITY.STATUS IS
'״̬';

COMMENT ON COLUMN QUALITY.MPID IS
'��ص�ID';

COMMENT ON COLUMN QUALITY.EMERGENCYPERSON IS
'Ӧ������������';

COMMENT ON COLUMN QUALITY.QMCODE IS
'�ʿر���';

COMMENT ON COLUMN QUALITY.CHECKPERSON IS
'Ѳ��Ա';

COMMENT ON COLUMN QUALITY.MATERIAL IS
'����';

COMMENT ON COLUMN QUALITY.LONGITUDE IS
'���ݲɼ��ص㾭��';

COMMENT ON COLUMN QUALITY.LATITUDE IS
'���ݲɼ��ص�γ��';

/*==============================================================*/
/* Index: RELCHARGEPERSON_FK                                    */
/*==============================================================*/
CREATE INDEX RELCHARGEPERSON_FK ON QUALITY (
   CHARGEPERSON ASC
);

/*==============================================================*/
/* Index: RELEMERGENCYPERSON_FK                                 */
/*==============================================================*/
CREATE INDEX RELEMERGENCYPERSON_FK ON QUALITY (
   EMERGENCYPERSON ASC
);

/*==============================================================*/
/* Index: RELEMPLOYEE_FK                                        */
/*==============================================================*/
CREATE INDEX RELEMPLOYEE_FK ON QUALITY (
   CHECKPERSON ASC
);

/*==============================================================*/
/* Index: RELWORKUNIT_FK                                        */
/*==============================================================*/
CREATE INDEX RELWORKUNIT_FK ON QUALITY (
   WORKUNIT ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
CREATE INDEX RELATIONSHIP_6_FK ON QUALITY (
   MPID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
CREATE INDEX RELATIONSHIP_8_FK ON QUALITY (
   STATUS ASC
);

/*==============================================================*/
/* Table: RESOURCEITEM                                          */
/*==============================================================*/
CREATE TABLE RESOURCEITEM  (
   RESID                VARCHAR2(40)                    NOT NULL,
   RESCODE              VARCHAR2(40)                    NOT NULL,
   RESNAME              VARCHAR2(60)                    NOT NULL,
   RESTYPE              VARCHAR2(60),
   LOCATION             VARCHAR2(600)                   NOT NULL,
   ISVOID               CHAR(1),
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   CONSTRAINT PK_RESOURCEITEM PRIMARY KEY (RESID)
);

COMMENT ON TABLE RESOURCEITEM IS
'��Դ';

COMMENT ON COLUMN RESOURCEITEM.RESID IS
'��ԴID';

COMMENT ON COLUMN RESOURCEITEM.RESCODE IS
'��Դ����';

COMMENT ON COLUMN RESOURCEITEM.RESNAME IS
'��Դ����';

COMMENT ON COLUMN RESOURCEITEM.RESTYPE IS
'��Դ����';

COMMENT ON COLUMN RESOURCEITEM.LOCATION IS
'��Դλ��';

COMMENT ON COLUMN RESOURCEITEM.ISVOID IS
'����';

COMMENT ON COLUMN RESOURCEITEM.MEMO IS
'��ע';

COMMENT ON COLUMN RESOURCEITEM.CREATED IS
'����ʱ��';

COMMENT ON COLUMN RESOURCEITEM.CREATEDBY IS
'������';

COMMENT ON COLUMN RESOURCEITEM.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN RESOURCEITEM.MODIFIEDBY IS
'�޸���';

/*==============================================================*/
/* Table: RESPERMISSION                                         */
/*==============================================================*/
CREATE TABLE RESPERMISSION  (
   RESID                VARCHAR2(40)                    NOT NULL,
   OPID                 VARCHAR2(40)                    NOT NULL,
   ROLEID               VARCHAR2(40)                    NOT NULL,
   CONSTRAINT PK_RESPERMISSION PRIMARY KEY (RESID, OPID, ROLEID)
);

COMMENT ON TABLE RESPERMISSION IS
'��ԴȨ��';

COMMENT ON COLUMN RESPERMISSION.RESID IS
'��ԴID';

COMMENT ON COLUMN RESPERMISSION.OPID IS
'����ID';

COMMENT ON COLUMN RESPERMISSION.ROLEID IS
'��ɫID';

/*==============================================================*/
/* Index: PERMRESOURCE_PK                                       */
/*==============================================================*/
CREATE UNIQUE INDEX PERMRESOURCE_PK ON RESPERMISSION (
   RESID ASC
);

/*==============================================================*/
/* Index: PERMRESOURCE2_FK                                      */
/*==============================================================*/
CREATE INDEX PERMRESOURCE2_FK ON RESPERMISSION (
   ROLEID ASC
);

/*==============================================================*/
/* Index: PERMRESOURCE3_FK                                      */
/*==============================================================*/
CREATE INDEX PERMRESOURCE3_FK ON RESPERMISSION (
   OPID ASC
);

/*==============================================================*/
/* Table: ROAD                                                  */
/*==============================================================*/
CREATE TABLE ROAD  (
   ROADID               VARCHAR2(40)                    NOT NULL,
   PROJECTID            VARCHAR2(40),
   ROADCODE             VARCHAR2(40),
   ROADNAME             VARCHAR2(1000),
   ROADTYPE             VARCHAR2(200),
   BEGINTIME            DATE,
   ENDTIME              DATE,
   WORKTIME             NUMBER(12,4),
   WORKERAMOUNT         INTEGER,
   MEMO                 VARCHAR2(2000),
   AVGWORKERAMOUNT      NUMBER(12,4),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   CONSTRAINT PK_ROAD PRIMARY KEY (ROADID)
);

COMMENT ON TABLE ROAD IS
'·��';

COMMENT ON COLUMN ROAD.ROADID IS
'·��ID';

COMMENT ON COLUMN ROAD.PROJECTID IS
'��ĿID';

COMMENT ON COLUMN ROAD.ROADCODE IS
'·�α���';

COMMENT ON COLUMN ROAD.ROADNAME IS
'·������';

COMMENT ON COLUMN ROAD.ROADTYPE IS
'·������';

COMMENT ON COLUMN ROAD.BEGINTIME IS
'��ҵ��ʼʱ��';

COMMENT ON COLUMN ROAD.ENDTIME IS
'��ҵ����ʱ��';

COMMENT ON COLUMN ROAD.WORKTIME IS
'��ҵʱ��';

COMMENT ON COLUMN ROAD.WORKERAMOUNT IS
'��������';

COMMENT ON COLUMN ROAD.MEMO IS
'��ע';

COMMENT ON COLUMN ROAD.AVGWORKERAMOUNT IS
'�����˾���';

COMMENT ON COLUMN ROAD.CREATED IS
'����ʱ��';

COMMENT ON COLUMN ROAD.CREATEDBY IS
'������';

COMMENT ON COLUMN ROAD.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN ROAD.MODIFIEDBY IS
'�޸���';

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
CREATE INDEX RELATIONSHIP_5_FK ON ROAD (
   PROJECTID ASC
);

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
CREATE TABLE ROLE  (
   ROLEID               VARCHAR2(40)                    NOT NULL,
   ROLECODE             VARCHAR2(40)                    NOT NULL,
   ROLENAME             VARCHAR2(60)                    NOT NULL,
   ISVOID               CHAR(1),
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   CONSTRAINT PK_ROLE PRIMARY KEY (ROLEID)
);

COMMENT ON TABLE ROLE IS
'��ɫ';

COMMENT ON COLUMN ROLE.ROLEID IS
'��ɫID';

COMMENT ON COLUMN ROLE.ROLECODE IS
'��ɫ����';

COMMENT ON COLUMN ROLE.ROLENAME IS
'��ɫ����';

COMMENT ON COLUMN ROLE.ISVOID IS
'����';

COMMENT ON COLUMN ROLE.MEMO IS
'��ע';

COMMENT ON COLUMN ROLE.CREATED IS
'����ʱ��';

COMMENT ON COLUMN ROLE.CREATEDBY IS
'������';

COMMENT ON COLUMN ROLE.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN ROLE.MODIFIEDBY IS
'�޸���';

/*==============================================================*/
/* Table: ROLEPERMISSION                                        */
/*==============================================================*/
CREATE TABLE ROLEPERMISSION  (
   ROLEID               VARCHAR2(40)                    NOT NULL,
   PERMISSIONID         VARCHAR2(40)                    NOT NULL,
   CONSTRAINT PK_ROLEPERMISSION PRIMARY KEY (ROLEID, PERMISSIONID)
);

COMMENT ON TABLE ROLEPERMISSION IS
'��ɫȨ��';

COMMENT ON COLUMN ROLEPERMISSION.ROLEID IS
'��ɫID';

COMMENT ON COLUMN ROLEPERMISSION.PERMISSIONID IS
'Ȩ��ID';

/*==============================================================*/
/* Index: ROLEPERMISSION_FK                                     */
/*==============================================================*/
CREATE INDEX ROLEPERMISSION_FK ON ROLEPERMISSION (
   ROLEID ASC
);

/*==============================================================*/
/* Index: ROLEPERMISSION2_FK                                    */
/*==============================================================*/
CREATE INDEX ROLEPERMISSION2_FK ON ROLEPERMISSION (
   PERMISSIONID ASC
);

/*==============================================================*/
/* Table: SUITE                                                 */
/*==============================================================*/
CREATE TABLE SUITE  (
   SUITEID              VARCHAR2(40)                    NOT NULL,
   DATABASEID           VARCHAR2(40),
   ISUSING              CHAR(1)                        DEFAULT 'N',
   VERSION              VARCHAR2(40),
   ISVOID               CHAR(1)                        DEFAULT 'N',
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   CONSTRAINT PK_SUITE PRIMARY KEY (SUITEID)
);

COMMENT ON TABLE SUITE IS
'Suite';

COMMENT ON COLUMN SUITE.SUITEID IS
'����ID';

COMMENT ON COLUMN SUITE.DATABASEID IS
'���ݿ�ID';

COMMENT ON COLUMN SUITE.ISUSING IS
'�����Ƿ�����ʹ��';

COMMENT ON COLUMN SUITE.VERSION IS
'���װ汾';

COMMENT ON COLUMN SUITE.ISVOID IS
'�Ƿ�ͣ��';

COMMENT ON COLUMN SUITE.CREATED IS
'Created';

COMMENT ON COLUMN SUITE.CREATEDBY IS
'CreatedBy';

COMMENT ON COLUMN SUITE.MODIFIED IS
'Modified';

COMMENT ON COLUMN SUITE.MODIFIEDBY IS
'ModifiedBy';

/*==============================================================*/
/* Index: I_SUITE_DATABASE_FK                                   */
/*==============================================================*/
CREATE INDEX I_SUITE_DATABASE_FK ON SUITE (
   DATABASEID ASC
);

/*==============================================================*/
/* Table: USERROLE                                              */
/*==============================================================*/
CREATE TABLE USERROLE  (
   ROLEID               VARCHAR2(40)                    NOT NULL,
   PASSPORTID           VARCHAR2(40)                    NOT NULL,
   CONSTRAINT PK_USERROLE PRIMARY KEY (ROLEID, PASSPORTID)
);

COMMENT ON TABLE USERROLE IS
'�û���ɫ';

COMMENT ON COLUMN USERROLE.ROLEID IS
'��ɫID';

COMMENT ON COLUMN USERROLE.PASSPORTID IS
'�˺�ID';

/*==============================================================*/
/* Index: USERROLE_FK                                           */
/*==============================================================*/
CREATE INDEX USERROLE_FK ON USERROLE (
   ROLEID ASC
);

/*==============================================================*/
/* Index: USERROLE2_FK                                          */
/*==============================================================*/
CREATE INDEX USERROLE2_FK ON USERROLE (
   PASSPORTID ASC
);

ALTER TABLE DEPARTMENT
   ADD CONSTRAINT FK_DEPARTME_ORGDEPT_ORAGANIZ FOREIGN KEY (ORGID)
      REFERENCES ORAGANIZATION (ORGID);

ALTER TABLE DEPARTMENT
   ADD CONSTRAINT FK_DEPARTME_RELDEPTCI_GEO FOREIGN KEY (CITY)
      REFERENCES GEO (GEOID);

ALTER TABLE DEPARTMENT
   ADD CONSTRAINT FK_DEPARTME_RELDEPTCO_GEO FOREIGN KEY (COUNTRY)
      REFERENCES GEO (GEOID);

ALTER TABLE DEPARTMENT
   ADD CONSTRAINT FK_DEPARTME_RELDEPTPR_GEO FOREIGN KEY (PROVINCE)
      REFERENCES GEO (GEOID);

ALTER TABLE DEPARTMENT
   ADD CONSTRAINT FK_DEPARTME_RELPARENT_DEPARTME FOREIGN KEY (PARENTDEPT)
      REFERENCES DEPARTMENT (DEPTID);

ALTER TABLE EMPLOYEE
   ADD CONSTRAINT FK_EMPLOYEE_RELATIONS_ENUMERAT FOREIGN KEY (SEX)
      REFERENCES ENUMERATION (ENUMID);

ALTER TABLE EMPLOYEE
   ADD CONSTRAINT FK_EMPLOYEE_RELDEPTEM_DEPARTME FOREIGN KEY (DEPTID)
      REFERENCES DEPARTMENT (DEPTID);

ALTER TABLE EMPLOYEE
   ADD CONSTRAINT FK_EMPLOYEE_RELEQUBIN_EQUIPMEN FOREIGN KEY (EQUID)
      REFERENCES EQUIPMENT (EQUID);

ALTER TABLE GEO
   ADD CONSTRAINT FK_GEO_RELGEO_GEO FOREIGN KEY (PARENTGEO)
      REFERENCES GEO (GEOID);

ALTER TABLE MPASSIGNMENT
   ADD CONSTRAINT FK_MPASSIGN_RELATIONS_ROAD FOREIGN KEY (ROADID)
      REFERENCES ROAD (ROADID);

ALTER TABLE ORAGANIZATION
   ADD CONSTRAINT FK_ORAGANIZ_FK_ORAGAN_DATABASE FOREIGN KEY (DATABASEID)
      REFERENCES DATABASE (DATABASEID);

ALTER TABLE ORAGANIZATION
   ADD CONSTRAINT FK_ORAGANIZ_FK_ORAGAN_SUITE FOREIGN KEY (SUITEID)
      REFERENCES SUITE (SUITEID);

ALTER TABLE ORAGANIZATION
   ADD CONSTRAINT FK_ORAGANIZ_RELORGCIT_GEO FOREIGN KEY (CITY)
      REFERENCES GEO (GEOID);

ALTER TABLE ORAGANIZATION
   ADD CONSTRAINT FK_ORAGANIZ_RELORGCOU_GEO FOREIGN KEY (COUNTRY)
      REFERENCES GEO (GEOID);

ALTER TABLE ORAGANIZATION
   ADD CONSTRAINT FK_ORAGANIZ_RELORGPRO_GEO FOREIGN KEY (PROVINCE)
      REFERENCES GEO (GEOID);

ALTER TABLE ORAGANIZATION
   ADD CONSTRAINT FK_ORAGANIZ_RELPARENT_ORAGANIZ FOREIGN KEY (PARENTORG)
      REFERENCES ORAGANIZATION (ORGID);

ALTER TABLE PASSPORT
   ADD CONSTRAINT FK_PASSPORT_EMPPASSPO_EMPLOYEE FOREIGN KEY (EMPID)
      REFERENCES EMPLOYEE (EMPID);

ALTER TABLE QUALITY
   ADD CONSTRAINT FK_QUALITY_RELATIONS_MPASSIGN FOREIGN KEY (MPID)
      REFERENCES MPASSIGNMENT (MPID);

ALTER TABLE QUALITY
   ADD CONSTRAINT FK_QUALITY_RELATIONS_ENUMERAT FOREIGN KEY (STATUS)
      REFERENCES ENUMERATION (ENUMID);

ALTER TABLE QUALITY
   ADD CONSTRAINT FK_QUALITY_RELCHARGE_EMPLOYEE FOREIGN KEY (CHARGEPERSON)
      REFERENCES EMPLOYEE (EMPID);

ALTER TABLE QUALITY
   ADD CONSTRAINT FK_QUALITY_RELEMERGE_EMPLOYEE FOREIGN KEY (EMERGENCYPERSON)
      REFERENCES EMPLOYEE (EMPID);

ALTER TABLE QUALITY
   ADD CONSTRAINT FK_QUALITY_RELEMPLOY_EMPLOYEE FOREIGN KEY (CHECKPERSON)
      REFERENCES EMPLOYEE (EMPID);

ALTER TABLE QUALITY
   ADD CONSTRAINT FK_QUALITY_RELWORKUN_ORAGANIZ FOREIGN KEY (WORKUNIT)
      REFERENCES ORAGANIZATION (ORGID);

ALTER TABLE RESPERMISSION
   ADD CONSTRAINT FK_RESPERMI_PERMRESOU_RESOURCE FOREIGN KEY (RESID)
      REFERENCES RESOURCEITEM (RESID);

ALTER TABLE RESPERMISSION
   ADD CONSTRAINT FK_RESPERMI_PERMRESOU_OPERATIO FOREIGN KEY (OPID)
      REFERENCES OPERATION (OPID);

ALTER TABLE RESPERMISSION
   ADD CONSTRAINT FK_RESPERMI_REFERENCE_ROLE FOREIGN KEY (ROLEID)
      REFERENCES ROLE (ROLEID);

ALTER TABLE ROAD
   ADD CONSTRAINT FK_ROAD_RELATIONS_PROJECT FOREIGN KEY (PROJECTID)
      REFERENCES PROJECT (PROJECTID);

ALTER TABLE ROLEPERMISSION
   ADD CONSTRAINT FK_ROLEPERM_ROLEPERMI_ROLE FOREIGN KEY (ROLEID)
      REFERENCES ROLE (ROLEID);

ALTER TABLE SUITE
   ADD CONSTRAINT FK_SUITE_FK_SUITE__DATABASE FOREIGN KEY (DATABASEID)
      REFERENCES DATABASE (DATABASEID);

ALTER TABLE USERROLE
   ADD CONSTRAINT FK_USERROLE_USERROLE_ROLE FOREIGN KEY (ROLEID)
      REFERENCES ROLE (ROLEID);

ALTER TABLE USERROLE
   ADD CONSTRAINT FK_USERROLE_USERROLE2_PASSPORT FOREIGN KEY (PASSPORTID)
      REFERENCES PASSPORT (PASSPORTID);
