/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     2009-9-7 20:48:13                            */
/*==============================================================*/


ALTER TABLE PUBGEO
   DROP CONSTRAINT FK_PUBGEO_REFERENCE_PUBGEO;

ALTER TABLE PUBORGANIZATION
   DROP CONSTRAINT FK_PUBORGAN_REF_ORG_G_PUBGEO2;

ALTER TABLE PUBORGANIZATION
   DROP CONSTRAINT FK_PUBORGAN_REF_ORG_G_PUBGEO;

ALTER TABLE PUBORGANIZATION
   DROP CONSTRAINT FK_PUBORGAN_REF_ORG_G_PUBGEO3;

ALTER TABLE PUBORGANIZATION
   DROP CONSTRAINT FK_PUBORGAN_REF_ORG_O_PUBENUME;

ALTER TABLE PUBORGANIZATION
   DROP CONSTRAINT FK_PUBORGAN_REFERENCE_DATABASE;

ALTER TABLE PUBORGANIZATION
   DROP CONSTRAINT FK_PUBORGAN_REFERENCE_SUITE;

ALTER TABLE SUITE
   DROP CONSTRAINT FK_SUITE_FK_SUITE__DATABASE;

DROP TABLE DATABASE CASCADE CONSTRAINTS;

DROP INDEX IDX_ENUMERATION_ENUMTYPE;

DROP TABLE PUBENUMERATION CASCADE CONSTRAINTS;

DROP INDEX IDX_GEO_GEOID_FK;

DROP TABLE PUBGEO CASCADE CONSTRAINTS;

DROP INDEX IDX_LOG_ORGANIZATIONID;

DROP TABLE PUBLOG CASCADE CONSTRAINTS;

DROP INDEX IDX_ORGANIZATION_CITY;

DROP INDEX IDX_ORGANIZATION_PROVINCE;

DROP INDEX IDX_ORGANIZATION_COUNTRY;

DROP INDEX IDX_ORGANIZATION_PARENTORG_FK2;

DROP TABLE PUBORGANIZATION CASCADE CONSTRAINTS;

DROP INDEX IDX_SUITE_DATABASEID_FK;

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
   PROVIDER             VARCHAR2(60),
   NAME                 VARCHAR2(60),
   CONSTRAINT PK_DATABASE PRIMARY KEY (DATABASEID)
);

COMMENT ON TABLE DATABASE IS
'���ݿ�';

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

COMMENT ON COLUMN DATABASE.PROVIDER IS
'PROVIDER';

COMMENT ON COLUMN DATABASE.NAME IS
'NAME';

/*==============================================================*/
/* Table: PUBENUMERATION                                        */
/*==============================================================*/
CREATE TABLE PUBENUMERATION  (
   ENUMID               VARCHAR2(40)                    NOT NULL,
   ENUMCODE             VARCHAR2(40),
   ENUMNAME             VARCHAR2(60),
   ENUMTYPE             VARCHAR2(60),
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   CONSTRAINT PK_PUBENUMERATION PRIMARY KEY (ENUMID)
);

COMMENT ON TABLE PUBENUMERATION IS
'ö��';

COMMENT ON COLUMN PUBENUMERATION.ENUMID IS
'ö��ID';

COMMENT ON COLUMN PUBENUMERATION.ENUMCODE IS
'ö�ٱ���';

COMMENT ON COLUMN PUBENUMERATION.ENUMNAME IS
'ö������';

COMMENT ON COLUMN PUBENUMERATION.ENUMTYPE IS
'ö������';

COMMENT ON COLUMN PUBENUMERATION.MEMO IS
'��ע';

COMMENT ON COLUMN PUBENUMERATION.CREATED IS
'����ʱ��';

COMMENT ON COLUMN PUBENUMERATION.CREATEDBY IS
'������';

COMMENT ON COLUMN PUBENUMERATION.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN PUBENUMERATION.MODIFIEDBY IS
'�޸���';

/*==============================================================*/
/* Index: IDX_ENUMERATION_ENUMTYPE                              */
/*==============================================================*/
CREATE INDEX IDX_ENUMERATION_ENUMTYPE ON PUBENUMERATION (
   ENUMTYPE ASC
);

/*==============================================================*/
/* Table: PUBGEO                                                */
/*==============================================================*/
CREATE TABLE PUBGEO  (
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
   CONSTRAINT PK_PUBGEO PRIMARY KEY (GEOID)
);

COMMENT ON TABLE PUBGEO IS
'����';

COMMENT ON COLUMN PUBGEO.GEOID IS
'����ID';

COMMENT ON COLUMN PUBGEO.PARENTGEO IS
'�ϼ�����';

COMMENT ON COLUMN PUBGEO.GEOCODE IS
'��������';

COMMENT ON COLUMN PUBGEO.GEONAME IS
'��������';

COMMENT ON COLUMN PUBGEO.MEMO IS
'��ע';

COMMENT ON COLUMN PUBGEO.CREATED IS
'����ʱ��';

COMMENT ON COLUMN PUBGEO.CREATEDBY IS
'������';

COMMENT ON COLUMN PUBGEO.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN PUBGEO.MODIFIEDBY IS
'�޸���';

COMMENT ON COLUMN PUBGEO.ISVOID IS
'����';

/*==============================================================*/
/* Index: IDX_GEO_GEOID_FK                                      */
/*==============================================================*/
CREATE INDEX IDX_GEO_GEOID_FK ON PUBGEO (
   PARENTGEO ASC
);

/*==============================================================*/
/* Table: PUBLOG                                                */
/*==============================================================*/
CREATE TABLE PUBLOG  (
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
   ORGANIZATIONID       VARCHAR2(40),
   SUITEID              VARCHAR2(40),
   CONSTRAINT PK_PUBLOG PRIMARY KEY (LOGID)
);

COMMENT ON TABLE PUBLOG IS
'��־';

COMMENT ON COLUMN PUBLOG.LOGID IS
'��־ID';

COMMENT ON COLUMN PUBLOG.LOGCODE IS
'��־����';

COMMENT ON COLUMN PUBLOG.LOGTYPE IS
'����';

COMMENT ON COLUMN PUBLOG."LEVEL" IS
'����';

COMMENT ON COLUMN PUBLOG.LOGSOURCE IS
'��Դ';

COMMENT ON COLUMN PUBLOG.CONTENT IS
'����';

COMMENT ON COLUMN PUBLOG.RECORDTIME IS
'��¼ʱ��';

COMMENT ON COLUMN PUBLOG.ISVOID IS
'����';

COMMENT ON COLUMN PUBLOG.CREATED IS
'����ʱ��';

COMMENT ON COLUMN PUBLOG.CREATEDBY IS
'������';

COMMENT ON COLUMN PUBLOG.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN PUBLOG.MODIFIEDBY IS
'�޸���';

COMMENT ON COLUMN PUBLOG.ORGANIZATIONID IS
'ORGANIZATIONID';

COMMENT ON COLUMN PUBLOG.SUITEID IS
'SUITEID';

/*==============================================================*/
/* Index: IDX_LOG_ORGANIZATIONID                                */
/*==============================================================*/
CREATE INDEX IDX_LOG_ORGANIZATIONID ON PUBLOG (
   ORGANIZATIONID ASC
);

/*==============================================================*/
/* Table: PUBORGANIZATION                                       */
/*==============================================================*/
CREATE TABLE PUBORGANIZATION  (
   ORGID                VARCHAR2(40)                    NOT NULL,
   PARENTORG            VARCHAR2(40),
   ORGCODE              VARCHAR2(40)                    NOT NULL,
   ORGNAME              VARCHAR2(60),
   ORGTYPE              VARCHAR2(40),
   COUNTRY              VARCHAR2(40),
   PROVINCE             VARCHAR2(40),
   CITY                 VARCHAR2(40),
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
   SUITEID              VARCHAR2(40),
   DATABASEID           VARCHAR2(40),
   MODIFIED             DATE,
   ORGANIZATIONID       VARCHAR2(40),
   CONSTRAINT PK_PUBORGANIZATION PRIMARY KEY (ORGID)
);

COMMENT ON TABLE PUBORGANIZATION IS
'��������';

COMMENT ON COLUMN PUBORGANIZATION.ORGID IS
'����ID';

COMMENT ON COLUMN PUBORGANIZATION.PARENTORG IS
'�ϼ�����';

COMMENT ON COLUMN PUBORGANIZATION.ORGCODE IS
'��������';

COMMENT ON COLUMN PUBORGANIZATION.ORGNAME IS
'��������';

COMMENT ON COLUMN PUBORGANIZATION.ORGTYPE IS
'��������';

COMMENT ON COLUMN PUBORGANIZATION.COUNTRY IS
'����';

COMMENT ON COLUMN PUBORGANIZATION.PROVINCE IS
'ʡ';

COMMENT ON COLUMN PUBORGANIZATION.CITY IS
'����';

COMMENT ON COLUMN PUBORGANIZATION.ORGALIAS IS
'���';

COMMENT ON COLUMN PUBORGANIZATION.ORGSTATUS IS
'�����ſ�';

COMMENT ON COLUMN PUBORGANIZATION.ORGADDRESS IS
'������ַ';

COMMENT ON COLUMN PUBORGANIZATION.ZIPCODE IS
'�ʱ�';

COMMENT ON COLUMN PUBORGANIZATION.CONTACT IS
'��ϵ��';

COMMENT ON COLUMN PUBORGANIZATION.CONTACTTEL IS
'��ϵ�绰';

COMMENT ON COLUMN PUBORGANIZATION.EMAIL IS
'Email';

COMMENT ON COLUMN PUBORGANIZATION.MEMO IS
'��ע';

COMMENT ON COLUMN PUBORGANIZATION.CREATED IS
'����ʱ��';

COMMENT ON COLUMN PUBORGANIZATION.CREATEDBY IS
'������';

COMMENT ON COLUMN PUBORGANIZATION.MODIFIEDBY IS
'�޸���';

COMMENT ON COLUMN PUBORGANIZATION.ISVOID IS
'����';

COMMENT ON COLUMN PUBORGANIZATION.SUITEID IS
'SUITEID';

COMMENT ON COLUMN PUBORGANIZATION.DATABASEID IS
'DATABASEID';

COMMENT ON COLUMN PUBORGANIZATION.MODIFIED IS
'�޸�ʱ��';

COMMENT ON COLUMN PUBORGANIZATION.ORGANIZATIONID IS
'ORGANIZATIONID';

/*==============================================================*/
/* Index: IDX_ORGANIZATION_PARENTORG_FK2                        */
/*==============================================================*/
CREATE INDEX IDX_ORGANIZATION_PARENTORG_FK2 ON PUBORGANIZATION (
   PARENTORG ASC
);

/*==============================================================*/
/* Index: IDX_ORGANIZATION_COUNTRY                              */
/*==============================================================*/
CREATE INDEX IDX_ORGANIZATION_COUNTRY ON PUBORGANIZATION (
   COUNTRY ASC
);

/*==============================================================*/
/* Index: IDX_ORGANIZATION_PROVINCE                             */
/*==============================================================*/
CREATE INDEX IDX_ORGANIZATION_PROVINCE ON PUBORGANIZATION (
   PROVINCE ASC
);

/*==============================================================*/
/* Index: IDX_ORGANIZATION_CITY                                 */
/*==============================================================*/
CREATE INDEX IDX_ORGANIZATION_CITY ON PUBORGANIZATION (
   CITY ASC
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
'����';

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
/* Index: IDX_SUITE_DATABASEID_FK                               */
/*==============================================================*/
CREATE INDEX IDX_SUITE_DATABASEID_FK ON SUITE (
   DATABASEID ASC
);

ALTER TABLE PUBGEO
   ADD CONSTRAINT FK_PUBGEO_REFERENCE_PUBGEO FOREIGN KEY (PARENTGEO)
      REFERENCES PUBGEO (GEOID);

ALTER TABLE PUBORGANIZATION
   ADD CONSTRAINT FK_PUBORGAN_REF_ORG_G_PUBGEO2 FOREIGN KEY (CITY)
      REFERENCES PUBGEO (GEOID);

ALTER TABLE PUBORGANIZATION
   ADD CONSTRAINT FK_PUBORGAN_REF_ORG_G_PUBGEO FOREIGN KEY (COUNTRY)
      REFERENCES PUBGEO (GEOID);

ALTER TABLE PUBORGANIZATION
   ADD CONSTRAINT FK_PUBORGAN_REF_ORG_G_PUBGEO3 FOREIGN KEY (PROVINCE)
      REFERENCES PUBGEO (GEOID);

ALTER TABLE PUBORGANIZATION
   ADD CONSTRAINT FK_PUBORGAN_REF_ORG_O_PUBENUME FOREIGN KEY (ORGTYPE)
      REFERENCES PUBENUMERATION (ENUMID);

ALTER TABLE PUBORGANIZATION
   ADD CONSTRAINT FK_PUBORGAN_REFERENCE_DATABASE FOREIGN KEY (DATABASEID)
      REFERENCES DATABASE (DATABASEID);

ALTER TABLE PUBORGANIZATION
   ADD CONSTRAINT FK_PUBORGAN_REFERENCE_SUITE FOREIGN KEY (SUITEID)
      REFERENCES SUITE (SUITEID);

ALTER TABLE SUITE
   ADD CONSTRAINT FK_SUITE_FK_SUITE__DATABASE FOREIGN KEY (DATABASEID)
      REFERENCES DATABASE (DATABASEID);

