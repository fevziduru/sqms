/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     2009-8-11 3:45:47                            */
/*==============================================================*/


ALTER TABLE DEPARTMENT
   DROP CONSTRAINT FK_DEPARTME_ORGDEPT_ORAGANIZ;

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

ALTER TABLE QUALITY
   DROP CONSTRAINT FK_QUALITY_RELWORKUN_ORAGANIZ;

ALTER TABLE SUITE
   DROP CONSTRAINT FK_SUITE_FK_SUITE__DATABASE;

DROP TABLE DATABASE CASCADE CONSTRAINTS;

DROP INDEX RELDATABASE_FK;

DROP INDEX RELSUITE_FK;

DROP INDEX RELPARENTORG_FK;

DROP INDEX RELORGCOUNTRY_FK;

DROP INDEX RELORGCITY_FK;

DROP INDEX RELORGPROVINCE_FK;

DROP TABLE ORAGANIZATION CASCADE CONSTRAINTS;

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
'机构';

COMMENT ON COLUMN ORAGANIZATION.ORGID IS
'机构ID';

COMMENT ON COLUMN ORAGANIZATION.COUNTRY IS
'国家';

COMMENT ON COLUMN ORAGANIZATION.CITY IS
'市';

COMMENT ON COLUMN ORAGANIZATION.PARENTORG IS
'上级机构';

COMMENT ON COLUMN ORAGANIZATION.PROVINCE IS
'省';

COMMENT ON COLUMN ORAGANIZATION.SUITEID IS
'账套';

COMMENT ON COLUMN ORAGANIZATION.DATABASEID IS
'数据库';

COMMENT ON COLUMN ORAGANIZATION.ORGCODE IS
'机构编码';

COMMENT ON COLUMN ORAGANIZATION.ORGNAME IS
'机构名称';

COMMENT ON COLUMN ORAGANIZATION.ORGTYPE IS
'机构类型';

COMMENT ON COLUMN ORAGANIZATION.ORGALIAS IS
'简称';

COMMENT ON COLUMN ORAGANIZATION.ORGSTATUS IS
'机构概况';

COMMENT ON COLUMN ORAGANIZATION.ORGADDRESS IS
'机构地址';

COMMENT ON COLUMN ORAGANIZATION.ZIPCODE IS
'邮编';

COMMENT ON COLUMN ORAGANIZATION.CONTACT IS
'联系人';

COMMENT ON COLUMN ORAGANIZATION.CONTACTTEL IS
'联系电话';

COMMENT ON COLUMN ORAGANIZATION.EMAIL IS
'Email';

COMMENT ON COLUMN ORAGANIZATION.MEMO IS
'备注';

COMMENT ON COLUMN ORAGANIZATION.CREATED IS
'创建时间';

COMMENT ON COLUMN ORAGANIZATION.CREATEDBY IS
'创建人';

COMMENT ON COLUMN ORAGANIZATION.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN ORAGANIZATION.ISVOID IS
'禁用';

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
/* Index: I_SUITE_DATABASE_FK                                   */
/*==============================================================*/
CREATE INDEX I_SUITE_DATABASE_FK ON SUITE (
   DATABASEID ASC
);

ALTER TABLE ORAGANIZATION
   ADD CONSTRAINT FK_ORAGANIZ_FK_ORAGAN_DATABASE FOREIGN KEY (DATABASEID)
      REFERENCES DATABASE (DATABASEID);

ALTER TABLE ORAGANIZATION
   ADD CONSTRAINT FK_ORAGANIZ_FK_ORAGAN_SUITE FOREIGN KEY (SUITEID)
      REFERENCES SUITE (SUITEID);
/*
ALTER TABLE ORAGANIZATION
   ADD CONSTRAINT FK_ORAGANIZ_RELORGCIT_GEO FOREIGN KEY (CITY)
      REFERENCES GEO (GEOID);

ALTER TABLE ORAGANIZATION
   ADD CONSTRAINT FK_ORAGANIZ_RELORGCOU_GEO FOREIGN KEY (COUNTRY)
      REFERENCES GEO (GEOID);

ALTER TABLE ORAGANIZATION
   ADD CONSTRAINT FK_ORAGANIZ_RELORGPRO_GEO FOREIGN KEY (PROVINCE)
      REFERENCES GEO (GEOID);
*/

ALTER TABLE ORAGANIZATION
   ADD CONSTRAINT FK_ORAGANIZ_RELPARENT_ORAGANIZ FOREIGN KEY (PARENTORG)
      REFERENCES ORAGANIZATION (ORGID);

ALTER TABLE SUITE
   ADD CONSTRAINT FK_SUITE_FK_SUITE__DATABASE FOREIGN KEY (DATABASEID)
      REFERENCES DATABASE (DATABASEID);

