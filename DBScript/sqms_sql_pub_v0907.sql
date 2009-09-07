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
'数据库';

COMMENT ON COLUMN DATABASE.DATABASEID IS
'数据库ID';

COMMENT ON COLUMN DATABASE.CONNECTIONSTRING IS
'连接字符串';

COMMENT ON COLUMN DATABASE.ISVOID IS
'是否停用';

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
'枚举';

COMMENT ON COLUMN PUBENUMERATION.ENUMID IS
'枚举ID';

COMMENT ON COLUMN PUBENUMERATION.ENUMCODE IS
'枚举编码';

COMMENT ON COLUMN PUBENUMERATION.ENUMNAME IS
'枚举名称';

COMMENT ON COLUMN PUBENUMERATION.ENUMTYPE IS
'枚举类型';

COMMENT ON COLUMN PUBENUMERATION.MEMO IS
'备注';

COMMENT ON COLUMN PUBENUMERATION.CREATED IS
'创建时间';

COMMENT ON COLUMN PUBENUMERATION.CREATEDBY IS
'创建人';

COMMENT ON COLUMN PUBENUMERATION.MODIFIED IS
'修改时间';

COMMENT ON COLUMN PUBENUMERATION.MODIFIEDBY IS
'修改人';

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
'地区';

COMMENT ON COLUMN PUBGEO.GEOID IS
'地区ID';

COMMENT ON COLUMN PUBGEO.PARENTGEO IS
'上级地区';

COMMENT ON COLUMN PUBGEO.GEOCODE IS
'地区编码';

COMMENT ON COLUMN PUBGEO.GEONAME IS
'地区名称';

COMMENT ON COLUMN PUBGEO.MEMO IS
'备注';

COMMENT ON COLUMN PUBGEO.CREATED IS
'创建时间';

COMMENT ON COLUMN PUBGEO.CREATEDBY IS
'创建人';

COMMENT ON COLUMN PUBGEO.MODIFIED IS
'修改时间';

COMMENT ON COLUMN PUBGEO.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN PUBGEO.ISVOID IS
'禁用';

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
'日志';

COMMENT ON COLUMN PUBLOG.LOGID IS
'日志ID';

COMMENT ON COLUMN PUBLOG.LOGCODE IS
'日志编码';

COMMENT ON COLUMN PUBLOG.LOGTYPE IS
'类型';

COMMENT ON COLUMN PUBLOG."LEVEL" IS
'级别';

COMMENT ON COLUMN PUBLOG.LOGSOURCE IS
'来源';

COMMENT ON COLUMN PUBLOG.CONTENT IS
'内容';

COMMENT ON COLUMN PUBLOG.RECORDTIME IS
'记录时间';

COMMENT ON COLUMN PUBLOG.ISVOID IS
'禁用';

COMMENT ON COLUMN PUBLOG.CREATED IS
'创建时间';

COMMENT ON COLUMN PUBLOG.CREATEDBY IS
'创建人';

COMMENT ON COLUMN PUBLOG.MODIFIED IS
'修改时间';

COMMENT ON COLUMN PUBLOG.MODIFIEDBY IS
'修改人';

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
'公共机构';

COMMENT ON COLUMN PUBORGANIZATION.ORGID IS
'机构ID';

COMMENT ON COLUMN PUBORGANIZATION.PARENTORG IS
'上级机构';

COMMENT ON COLUMN PUBORGANIZATION.ORGCODE IS
'机构编码';

COMMENT ON COLUMN PUBORGANIZATION.ORGNAME IS
'机构名称';

COMMENT ON COLUMN PUBORGANIZATION.ORGTYPE IS
'机构类型';

COMMENT ON COLUMN PUBORGANIZATION.COUNTRY IS
'国家';

COMMENT ON COLUMN PUBORGANIZATION.PROVINCE IS
'省';

COMMENT ON COLUMN PUBORGANIZATION.CITY IS
'城市';

COMMENT ON COLUMN PUBORGANIZATION.ORGALIAS IS
'简称';

COMMENT ON COLUMN PUBORGANIZATION.ORGSTATUS IS
'机构概况';

COMMENT ON COLUMN PUBORGANIZATION.ORGADDRESS IS
'机构地址';

COMMENT ON COLUMN PUBORGANIZATION.ZIPCODE IS
'邮编';

COMMENT ON COLUMN PUBORGANIZATION.CONTACT IS
'联系人';

COMMENT ON COLUMN PUBORGANIZATION.CONTACTTEL IS
'联系电话';

COMMENT ON COLUMN PUBORGANIZATION.EMAIL IS
'Email';

COMMENT ON COLUMN PUBORGANIZATION.MEMO IS
'备注';

COMMENT ON COLUMN PUBORGANIZATION.CREATED IS
'创建时间';

COMMENT ON COLUMN PUBORGANIZATION.CREATEDBY IS
'创建人';

COMMENT ON COLUMN PUBORGANIZATION.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN PUBORGANIZATION.ISVOID IS
'禁用';

COMMENT ON COLUMN PUBORGANIZATION.SUITEID IS
'SUITEID';

COMMENT ON COLUMN PUBORGANIZATION.DATABASEID IS
'DATABASEID';

COMMENT ON COLUMN PUBORGANIZATION.MODIFIED IS
'修改时间';

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
'账套';

COMMENT ON COLUMN SUITE.SUITEID IS
'帐套ID';

COMMENT ON COLUMN SUITE.DATABASEID IS
'数据库ID';

COMMENT ON COLUMN SUITE.ISUSING IS
'帐套是否正在使用';

COMMENT ON COLUMN SUITE.VERSION IS
'帐套版本';

COMMENT ON COLUMN SUITE.ISVOID IS
'是否停用';

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

