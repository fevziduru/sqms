/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     2009-8-7 3:35:13                             */
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
   DROP CONSTRAINT FK_RESPERMI_PERMRESOU_PERMISSI;

ALTER TABLE RESPERMISSION
   DROP CONSTRAINT FK_RESPERMI_PERMRESOU_RESOURCE;

ALTER TABLE RESPERMISSION
   DROP CONSTRAINT FK_RESPERMI_PERMRESOU_OPERATIO;

ALTER TABLE ROLEPERMISSION
   DROP CONSTRAINT FK_ROLEPERM_ROLEPERMI_ROLE;

ALTER TABLE ROLEPERMISSION
   DROP CONSTRAINT FK_ROLEPERM_ROLEPERMI_PERMISSI;

ALTER TABLE USERROLE
   DROP CONSTRAINT FK_USERROLE_USERROLE_ROLE;

ALTER TABLE USERROLE
   DROP CONSTRAINT FK_USERROLE_USERROLE2_PASSPORT;

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

DROP TABLE PERMISSION CASCADE CONSTRAINTS;

DROP TABLE "RESOURCE" CASCADE CONSTRAINTS;

DROP INDEX PERMRESOURCE3_FK;

DROP INDEX PERMRESOURCE2_FK;

DROP INDEX PERMRESOURCE_FK;

DROP INDEX PERMRESOURCE_PK;

DROP TABLE RESPERMISSION CASCADE CONSTRAINTS;

DROP TABLE ROLE CASCADE CONSTRAINTS;

DROP INDEX ROLEPERMISSION2_FK;

DROP INDEX ROLEPERMISSION_FK;

DROP TABLE ROLEPERMISSION CASCADE CONSTRAINTS;

DROP INDEX USERROLE2_FK;

DROP INDEX USERROLE_FK;

DROP TABLE USERROLE CASCADE CONSTRAINTS;

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
/* Table: PERMISSION                                            */
/*==============================================================*/
CREATE TABLE PERMISSION  (
   PERMISSIONID         VARCHAR2(40)                    NOT NULL,
   PERMISSIONCODE       VARCHAR2(40)                    NOT NULL,
   PERMISSIONNAME       VARCHAR2(60)                    NOT NULL,
   ISVOID               CHAR(1),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   CONSTRAINT PK_PERMISSION PRIMARY KEY (PERMISSIONID)
);

COMMENT ON TABLE PERMISSION IS
'Ȩ��';

COMMENT ON COLUMN PERMISSION.PERMISSIONID IS
'Ȩ��ID';

COMMENT ON COLUMN PERMISSION.PERMISSIONCODE IS
'Ȩ�ޱ���';

COMMENT ON COLUMN PERMISSION.PERMISSIONNAME IS
'Ȩ������';

COMMENT ON COLUMN PERMISSION.ISVOID IS
'����';

COMMENT ON COLUMN PERMISSION.CREATED IS
'����ʱ��';

COMMENT ON COLUMN PERMISSION.CREATEDBY IS
'������';

COMMENT ON COLUMN PERMISSION.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN PERMISSION.MODIFIEDBY IS
'�޸���';

/*==============================================================*/
/* Table: "RESOURCE"                                            */
/*==============================================================*/
CREATE TABLE "RESOURCE"  (
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
   CONSTRAINT PK_RESOURCE PRIMARY KEY (RESID)
);

COMMENT ON TABLE "RESOURCE" IS
'��Դ';

COMMENT ON COLUMN "RESOURCE".RESID IS
'��ԴID';

COMMENT ON COLUMN "RESOURCE".RESCODE IS
'��Դ����';

COMMENT ON COLUMN "RESOURCE".RESNAME IS
'��Դ����';

COMMENT ON COLUMN "RESOURCE".RESTYPE IS
'��Դ����';

COMMENT ON COLUMN "RESOURCE".LOCATION IS
'��Դλ��';

COMMENT ON COLUMN "RESOURCE".ISVOID IS
'����';

COMMENT ON COLUMN "RESOURCE".MEMO IS
'��ע';

COMMENT ON COLUMN "RESOURCE".CREATED IS
'����ʱ��';

COMMENT ON COLUMN "RESOURCE".CREATEDBY IS
'������';

COMMENT ON COLUMN "RESOURCE".MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN "RESOURCE".MODIFIEDBY IS
'�޸���';

/*==============================================================*/
/* Table: RESPERMISSION                                         */
/*==============================================================*/
CREATE TABLE RESPERMISSION  (
   PERMISSIONID         VARCHAR2(40)                    NOT NULL,
   RESID                VARCHAR2(40)                    NOT NULL,
   OPID                 VARCHAR2(40)                    NOT NULL,
   CONSTRAINT PK_RESPERMISSION PRIMARY KEY (PERMISSIONID, RESID, OPID)
);

COMMENT ON TABLE RESPERMISSION IS
'��ԴȨ��';

COMMENT ON COLUMN RESPERMISSION.PERMISSIONID IS
'Ȩ��ID';

COMMENT ON COLUMN RESPERMISSION.RESID IS
'��ԴID';

COMMENT ON COLUMN RESPERMISSION.OPID IS
'����ID';

/*==============================================================*/
/* Index: PERMRESOURCE_PK                                       */
/*==============================================================*/
CREATE UNIQUE INDEX PERMRESOURCE_PK ON RESPERMISSION (
   PERMISSIONID ASC,
   RESID ASC
);

/*==============================================================*/
/* Index: PERMRESOURCE_FK                                       */
/*==============================================================*/
CREATE INDEX PERMRESOURCE_FK ON RESPERMISSION (
   PERMISSIONID ASC
);

/*==============================================================*/
/* Index: PERMRESOURCE2_FK                                      */
/*==============================================================*/
CREATE INDEX PERMRESOURCE2_FK ON RESPERMISSION (
   RESID ASC
);

/*==============================================================*/
/* Index: PERMRESOURCE3_FK                                      */
/*==============================================================*/
CREATE INDEX PERMRESOURCE3_FK ON RESPERMISSION (
   OPID ASC
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

ALTER TABLE RESPERMISSION
   ADD CONSTRAINT FK_RESPERMI_PERMRESOU_PERMISSI FOREIGN KEY (PERMISSIONID)
      REFERENCES PERMISSION (PERMISSIONID);

ALTER TABLE RESPERMISSION
   ADD CONSTRAINT FK_RESPERMI_PERMRESOU_RESOURCE FOREIGN KEY (RESID)
      REFERENCES "RESOURCE" (RESID);

ALTER TABLE RESPERMISSION
   ADD CONSTRAINT FK_RESPERMI_PERMRESOU_OPERATIO FOREIGN KEY (OPID)
      REFERENCES OPERATION (OPID);

ALTER TABLE ROLEPERMISSION
   ADD CONSTRAINT FK_ROLEPERM_ROLEPERMI_ROLE FOREIGN KEY (ROLEID)
      REFERENCES ROLE (ROLEID);

ALTER TABLE ROLEPERMISSION
   ADD CONSTRAINT FK_ROLEPERM_ROLEPERMI_PERMISSI FOREIGN KEY (PERMISSIONID)
      REFERENCES PERMISSION (PERMISSIONID);

ALTER TABLE USERROLE
   ADD CONSTRAINT FK_USERROLE_USERROLE_ROLE FOREIGN KEY (ROLEID)
      REFERENCES ROLE (ROLEID);

ALTER TABLE USERROLE
   ADD CONSTRAINT FK_USERROLE_USERROLE2_PASSPORT FOREIGN KEY (PASSPORTID)
      REFERENCES PASSPORT (PASSPORTID);
