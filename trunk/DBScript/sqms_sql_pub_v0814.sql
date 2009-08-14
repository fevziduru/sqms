/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     2009-8-14 21:08:31                           */
/*==============================================================*/


ALTER TABLE DEPARTMENT
   DROP CONSTRAINT FK_DEPARTME_ORGDEPT_ORGANIZA;

ALTER TABLE DEPARTMENT
   DROP CONSTRAINT FK_DEPARTME_RELDEPTCI_GEO;

ALTER TABLE DEPARTMENT
   DROP CONSTRAINT FK_DEPARTME_RELDEPTCO_GEO;

ALTER TABLE DEPARTMENT
   DROP CONSTRAINT FK_DEPARTME_RELDEPTPR_GEO;

ALTER TABLE EMPLOYEE
   DROP CONSTRAINT FK_EMPLOYEE_EMP_DEPT__ORGANIZA;

ALTER TABLE EMPLOYEE
   DROP CONSTRAINT FK_EMPLOYEE_EMP_ORG_R_ORGANIZA;

ALTER TABLE EMPLOYEE
   DROP CONSTRAINT FK_EMPLOYEE_REFERENCE_ENUMERAT;

ALTER TABLE EMPLOYEE
   DROP CONSTRAINT FK_EMPLOYEE_RELATIONS_ENUMERAT;

ALTER TABLE GEO
   DROP CONSTRAINT FK_GEO_RELGEO_GEO;

ALTER TABLE ORGANIZATION
   DROP CONSTRAINT FK_ORGANIZA_REFERENCE_ENUMERAT;

ALTER TABLE ORGANIZATION
   DROP CONSTRAINT FK_ORGANIZA_RELORGCIT_GEO;

ALTER TABLE ORGANIZATION
   DROP CONSTRAINT FK_ORGANIZA_RELORGCOU_GEO;

ALTER TABLE ORGANIZATION
   DROP CONSTRAINT FK_ORGANIZA_RELORGPRO_GEO;

ALTER TABLE ORGANIZATION
   DROP CONSTRAINT FK_ORGANIZA_RELPARENT_ORGANIZA;

ALTER TABLE QUALITY
   DROP CONSTRAINT FK_QUALITY_RELATIONS_ENUMERAT;

ALTER TABLE QUALITY
   DROP CONSTRAINT FK_QUALITY_RELWORKUN_ORGANIZA;

ALTER TABLE SUITE
   DROP CONSTRAINT FK_SUITE_FK_SUITE__DATABASE;

DROP TABLE DATABASE CASCADE CONSTRAINTS;

DROP TABLE ENUMERATION CASCADE CONSTRAINTS;

DROP INDEX RELGEO_FK;

DROP TABLE GEO CASCADE CONSTRAINTS;

DROP INDEX ORG_SUITEID;

DROP INDEX RELPARENTORG_FK;

DROP INDEX RELORGCOUNTRY_FK;

DROP INDEX RELORGCITY_FK;

DROP INDEX RELORGPROVINCE_FK;

DROP TABLE ORGANIZATION CASCADE CONSTRAINTS;

DROP INDEX I_SUITE_DATABASE_FK;

DROP TABLE SUITE CASCADE CONSTRAINTS;

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
   ISVOID               VARCHAR2(1),
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

COMMENT ON COLUMN GEO.ISVOID IS
'����';

/*==============================================================*/
/* Index: RELGEO_FK                                             */
/*==============================================================*/
CREATE INDEX RELGEO_FK ON GEO (
   PARENTGEO ASC
);

/*==============================================================*/
/* Table: ORGANIZATION                                          */
/*==============================================================*/
CREATE TABLE ORGANIZATION  (
   ORGID                VARCHAR2(40)                    NOT NULL,
   COUNTRY              VARCHAR2(40),
   CITY                 VARCHAR2(40),
   PARENTORG            VARCHAR2(40),
   PROVINCE             VARCHAR2(40),
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
   MODIFIED             DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIEDBY           VARCHAR2(40),
   ISVOID               CHAR(1),
   SUITEID              VARCHAR2(40),
   DATABASEID           VARCHAR2(40),
   ORGANIZATIONID           VARCHAR2(40),
   CONSTRAINT PK_ORGANIZATION PRIMARY KEY (ORGID)
);

COMMENT ON TABLE ORGANIZATION IS
'����';

COMMENT ON COLUMN ORGANIZATION.ORGID IS
'����ID';

COMMENT ON COLUMN ORGANIZATION.COUNTRY IS
'����';

COMMENT ON COLUMN ORGANIZATION.CITY IS
'��';

COMMENT ON COLUMN ORGANIZATION.PARENTORG IS
'�ϼ�����';

COMMENT ON COLUMN ORGANIZATION.PROVINCE IS
'ʡ';

COMMENT ON COLUMN ORGANIZATION.ORGCODE IS
'��������';

COMMENT ON COLUMN ORGANIZATION.ORGNAME IS
'��������';

COMMENT ON COLUMN ORGANIZATION.ORGTYPE IS
'��������';

COMMENT ON COLUMN ORGANIZATION.ORGALIAS IS
'���';

COMMENT ON COLUMN ORGANIZATION.ORGSTATUS IS
'�����ſ�';

COMMENT ON COLUMN ORGANIZATION.ORGADDRESS IS
'������ַ';

COMMENT ON COLUMN ORGANIZATION.ZIPCODE IS
'�ʱ�';

COMMENT ON COLUMN ORGANIZATION.CONTACT IS
'��ϵ��';

COMMENT ON COLUMN ORGANIZATION.CONTACTTEL IS
'��ϵ�绰';

COMMENT ON COLUMN ORGANIZATION.EMAIL IS
'Email';

COMMENT ON COLUMN ORGANIZATION.MEMO IS
'��ע';

COMMENT ON COLUMN ORGANIZATION.CREATED IS
'����ʱ��';

COMMENT ON COLUMN ORGANIZATION.CREATEDBY IS
'������';

COMMENT ON COLUMN ORGANIZATION.MODIFIEDBY IS
'�޸���';

COMMENT ON COLUMN ORGANIZATION.ISVOID IS
'����';

COMMENT ON COLUMN ORGANIZATION.SUITEID IS
'SUITEID';

COMMENT ON COLUMN ORGANIZATION.DATABASEID IS
'DATABASEID';

/*==============================================================*/
/* Index: RELORGPROVINCE_FK                                     */
/*==============================================================*/
CREATE INDEX RELORGPROVINCE_FK ON ORGANIZATION (
   PROVINCE ASC
);

/*==============================================================*/
/* Index: RELORGCITY_FK                                         */
/*==============================================================*/
CREATE INDEX RELORGCITY_FK ON ORGANIZATION (
   CITY ASC
);

/*==============================================================*/
/* Index: RELORGCOUNTRY_FK                                      */
/*==============================================================*/
CREATE INDEX RELORGCOUNTRY_FK ON ORGANIZATION (
   COUNTRY ASC
);

/*==============================================================*/
/* Index: RELPARENTORG_FK                                       */
/*==============================================================*/
CREATE INDEX RELPARENTORG_FK ON ORGANIZATION (
   PARENTORG ASC
);

/*==============================================================*/
/* Index: ORG_SUITEID                                           */
/*==============================================================*/
CREATE INDEX ORG_SUITEID ON ORGANIZATION (
   SUITEID ASC
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

ALTER TABLE GEO
   ADD CONSTRAINT FK_GEO_RELGEO_GEO FOREIGN KEY (PARENTGEO)
      REFERENCES GEO (GEOID);

ALTER TABLE ORGANIZATION
   ADD CONSTRAINT FK_ORGANIZA_REFERENCE_ENUMERAT FOREIGN KEY (ORGTYPE)
      REFERENCES ENUMERATION (ENUMID);

ALTER TABLE ORGANIZATION
   ADD CONSTRAINT FK_ORGANIZA_RELORGCIT_GEO FOREIGN KEY (CITY)
      REFERENCES GEO (GEOID);

ALTER TABLE ORGANIZATION
   ADD CONSTRAINT FK_ORGANIZA_RELORGCOU_GEO FOREIGN KEY (COUNTRY)
      REFERENCES GEO (GEOID);

ALTER TABLE ORGANIZATION
   ADD CONSTRAINT FK_ORGANIZA_RELORGPRO_GEO FOREIGN KEY (PROVINCE)
      REFERENCES GEO (GEOID);

ALTER TABLE ORGANIZATION
   ADD CONSTRAINT FK_ORGANIZA_RELPARENT_ORGANIZA FOREIGN KEY (PARENTORG)
      REFERENCES ORGANIZATION (ORGID);

ALTER TABLE SUITE
   ADD CONSTRAINT FK_SUITE_FK_SUITE__DATABASE FOREIGN KEY (DATABASEID)
      REFERENCES DATABASE (DATABASEID);

