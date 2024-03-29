/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     2009-9-1 0:21:06                             */
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

ALTER TABLE EMPLOYEE
   DROP CONSTRAINT FK_EMPLOYEE_RELEQUBIN_EQUIPMEN;

ALTER TABLE GEO
   DROP CONSTRAINT FK_GEO_RELGEO_GEO;

ALTER TABLE MONITORPOINTINVIDEO
   DROP CONSTRAINT FK_MONITORP_REFERENCE_VIDEO;

ALTER TABLE MONITORPOINTINVIDEO
   DROP CONSTRAINT FK_MONITORP_REFERENCE_MPASSIGN;

ALTER TABLE MPASSIGNMENT
   DROP CONSTRAINT FK_MPASSIGN_REFERENCE_TIMESCHE;

ALTER TABLE MPASSIGNMENT
   DROP CONSTRAINT FK_MPASSIGN_RELATIONS_ROAD;

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

ALTER TABLE PASSPORT
   DROP CONSTRAINT FK_PASSPORT_EMPPASSPO_EMPLOYEE;

ALTER TABLE PROJECT
   DROP CONSTRAINT FK_PROJECT_REFERENCE_EMPLOYEE;

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
   DROP CONSTRAINT FK_QUALITY_RELWORKUN_ORGANIZA;

ALTER TABLE QUALITYDATA
   DROP CONSTRAINT FK_QUALITYD_REFERENCE_MPASSIGN;

ALTER TABLE QUALITYDATA
   DROP CONSTRAINT FK_QUALITYD_REFERENCE_ENUMERAT;

ALTER TABLE RESPERMISSION
   DROP CONSTRAINT FK_RESPERMI_REFERENCE_ROLE;

ALTER TABLE RESPERMISSION
   DROP CONSTRAINT FK_RESPERMI_REFERENCE_RESOURCE;

ALTER TABLE RESPERMISSION
   DROP CONSTRAINT FK_RESPERMI_REFERENCE_OPERATIO;

ALTER TABLE ROAD
   DROP CONSTRAINT FK_ROAD_RELATIONS_PROJECT;

ALTER TABLE ROLEPERMISSION
   DROP CONSTRAINT FK_ROLEPERM_ROLEPERMI_ROLE;

ALTER TABLE TIMEITEM
   DROP CONSTRAINT FK_TIMEITEM_REFERENCE_TIME;

ALTER TABLE TIMEITEM
   DROP CONSTRAINT FK_TIMEITEM_REFERENCE_TIMESCHE;

ALTER TABLE USERROLE
   DROP CONSTRAINT FK_USERROLE_USERROLE_ROLE;

ALTER TABLE USERROLE
   DROP CONSTRAINT FK_USERROLE_USERROLE2_PASSPORT;

DROP INDEX IDX_EMPLOYEE_ORGANIZATIONID;

DROP INDEX IDX_EMPLOYEE_SEX_FK;

DROP INDEX IDX_EMPLOYEE_EQUID_FK;

DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;

DROP INDEX IDX_ENUMERATION_ENUMTYPE;

DROP TABLE ENUMERATION CASCADE CONSTRAINTS;

DROP INDEX EQUIPMENT_ORG;

DROP TABLE EQUIPMENT CASCADE CONSTRAINTS;

DROP INDEX IDX_GEO_GEOID_FK;

DROP TABLE GEO CASCADE CONSTRAINTS;

DROP INDEX IDX_LOG_ORGANIZATIONID;

DROP TABLE LOG CASCADE CONSTRAINTS;

DROP TABLE MENU CASCADE CONSTRAINTS;

DROP INDEX IDX_MONITORPOINTVIDEO_MPID_FK;

DROP INDEX IDX_MPV_VIDEOID_FK;

DROP TABLE MONITORPOINTINVIDEO CASCADE CONSTRAINTS;

DROP INDEX IDX_ROAD_ORGANIZATIONID;

DROP INDEX IDX_ROAD_ROADID_FK;

DROP TABLE MPASSIGNMENT CASCADE CONSTRAINTS;

DROP INDEX IDX_OPERATION_ORGANIZATIONID;

DROP TABLE OPERATION CASCADE CONSTRAINTS;

DROP INDEX IDX_ORGANIZATION_SUITEID;

DROP INDEX IDX_ORGANIZATION_PARENTORG_FK;

DROP INDEX IDX_ORGANIZATION_COUNTRY_FK;

DROP INDEX IDX_ORGANIZATION_CITY_FK;

DROP INDEX IDX_ORGANIZATION_PROVINCE_FK;

DROP TABLE ORGANIZATION CASCADE CONSTRAINTS;

DROP INDEX PASSPORT_ORGANIZATIONID;

DROP INDEX IDX_PASSPORT_EMPID_FK;

DROP TABLE PASSPORT CASCADE CONSTRAINTS;

DROP INDEX IDX_PROJECT_ORGANIZATIONID;

DROP INDEX IDX_PROJECT_EMPID_FK;

DROP TABLE PROJECT CASCADE CONSTRAINTS;

DROP INDEX IDX_QUALITY_ORGANIZATIONID;

DROP INDEX IDX_QUALITY_CREATED;

DROP INDEX IDX_QUALITY_STATUS_FK;

DROP INDEX IDX_QUALITY_MPID_FK;

DROP INDEX IDX_QUALITY_WORKUNIT_FK;

DROP INDEX IDX_QUALITY_CHECKPERSON_FK;

DROP INDEX IDX_QUALITY_EMERGENCYPERSON_FK;

DROP INDEX IDX_QUALITY_CHARGEPERSON_FK;

DROP TABLE QUALITY CASCADE CONSTRAINTS;

DROP INDEX RESOURCEITEM_ORGANIZATIONID;

DROP INDEX IDX_U_RESOURCE_RESIDENTITY;

DROP TABLE RESOURCEITEM CASCADE CONSTRAINTS;

DROP INDEX IDX_RESPERMISSION_RESID_FK;

DROP INDEX IDX_RESPERMISSION_OPID_FK;

DROP INDEX IDX_RESPERMISSION_ROLEID_FK;

DROP INDEX IDX_RESPERM_ORGANIZATIONID;

DROP TABLE RESPERMISSION CASCADE CONSTRAINTS;

DROP INDEX IDX_ROAD_ORGAINZATIONID;

DROP INDEX IDX_ROAD_PROJECTID_FK;

DROP TABLE ROAD CASCADE CONSTRAINTS;

DROP INDEX ROLE_ORGANIZATIONID;

DROP TABLE ROLE CASCADE CONSTRAINTS;

DROP TABLE TIME CASCADE CONSTRAINTS;

DROP INDEX IDX_TIMEITEM_ORGANIZATIONID;

DROP TABLE TIMEITEM CASCADE CONSTRAINTS;

DROP INDEX IDX_TIMESCHEMA_ORGANIZATIONID;

DROP TABLE TIMESCHEMA CASCADE CONSTRAINTS;

DROP INDEX IDX_USERROLE_ORGANIZATIONID;

DROP INDEX IDX_USERROLE_PASSPORTID_FK;

DROP INDEX IDX_USERROLE_ROLEID_FK;

DROP TABLE USERROLE CASCADE CONSTRAINTS;

DROP INDEX IDX_ORGANIZATIONID;

DROP TABLE VIDEO CASCADE CONSTRAINTS;

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
   DEGREE               VARCHAR2(40),
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIEDBY           VARCHAR2(40),
   MODIFIED             DATE,
   ORGANIZATIONID       VARCHAR2(40),
   SUITEID              VARCHAR2(40),
   ISEQUACTIVATE        CHAR(1),
   CONSTRAINT PK_EMPLOYEE PRIMARY KEY (EMPID)
);

COMMENT ON TABLE EMPLOYEE IS
'职员';

COMMENT ON COLUMN EMPLOYEE.EMPID IS
'职员ID';

COMMENT ON COLUMN EMPLOYEE.DEPTID IS
'所属部门';

COMMENT ON COLUMN EMPLOYEE.EQUID IS
'移动设备';

COMMENT ON COLUMN EMPLOYEE.SEX IS
'性别';

COMMENT ON COLUMN EMPLOYEE.EMPNAME IS
'职员名称';

COMMENT ON COLUMN EMPLOYEE.EMPCODE IS
'职员编码';

COMMENT ON COLUMN EMPLOYEE.EMPSTATUS IS
'职员状态';

COMMENT ON COLUMN EMPLOYEE.MOBILE IS
'移动电话';

COMMENT ON COLUMN EMPLOYEE.ISVOID IS
'禁用';

COMMENT ON COLUMN EMPLOYEE.JOBTITLE IS
'职位';

COMMENT ON COLUMN EMPLOYEE.CONTACTTEL IS
'联系电话';

COMMENT ON COLUMN EMPLOYEE.BIRTHDAY IS
'出生日期';

COMMENT ON COLUMN EMPLOYEE.DEGREE IS
'学历';

COMMENT ON COLUMN EMPLOYEE.MEMO IS
'备注';

COMMENT ON COLUMN EMPLOYEE.CREATED IS
'创建时间';

COMMENT ON COLUMN EMPLOYEE.CREATEDBY IS
'创建人';

COMMENT ON COLUMN EMPLOYEE.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN EMPLOYEE.MODIFIED IS
'修改时间';

COMMENT ON COLUMN EMPLOYEE.ORGANIZATIONID IS
'ORGANIZATIONID';

COMMENT ON COLUMN EMPLOYEE.SUITEID IS
'SUITEID';

COMMENT ON COLUMN EMPLOYEE.ISEQUACTIVATE IS
'ISEQUACTIVATE';

/*==============================================================*/
/* Index: IDX_EMPLOYEE_EQUID_FK                                 */
/*==============================================================*/
CREATE INDEX IDX_EMPLOYEE_EQUID_FK ON EMPLOYEE (
   EQUID ASC
);

/*==============================================================*/
/* Index: IDX_EMPLOYEE_SEX_FK                                   */
/*==============================================================*/
CREATE INDEX IDX_EMPLOYEE_SEX_FK ON EMPLOYEE (
   SEX ASC
);

/*==============================================================*/
/* Index: IDX_EMPLOYEE_ORGANIZATIONID                           */
/*==============================================================*/
CREATE INDEX IDX_EMPLOYEE_ORGANIZATIONID ON EMPLOYEE (
   ORGANIZATIONID ASC
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
'枚举';

COMMENT ON COLUMN ENUMERATION.ENUMID IS
'枚举ID';

COMMENT ON COLUMN ENUMERATION.ENUMCODE IS
'枚举编码';

COMMENT ON COLUMN ENUMERATION.ENUMNAME IS
'枚举名称';

COMMENT ON COLUMN ENUMERATION.ENUMTYPE IS
'枚举类型';

COMMENT ON COLUMN ENUMERATION.MEMO IS
'备注';

COMMENT ON COLUMN ENUMERATION.CREATED IS
'创建时间';

COMMENT ON COLUMN ENUMERATION.CREATEDBY IS
'创建人';

COMMENT ON COLUMN ENUMERATION.MODIFIED IS
'修改时间';

COMMENT ON COLUMN ENUMERATION.MODIFIEDBY IS
'修改人';

/*==============================================================*/
/* Index: IDX_ENUMERATION_ENUMTYPE                              */
/*==============================================================*/
CREATE INDEX IDX_ENUMERATION_ENUMTYPE ON ENUMERATION (
   ENUMTYPE ASC
);

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
   ISVOID               VARCHAR2(1),
   ORGANIZATIONID       VARCHAR2(40),
   SUITEID              VARCHAR2(40),
   CONSTRAINT PK_EQUIPMENT PRIMARY KEY (EQUID)
);

COMMENT ON TABLE EQUIPMENT IS
'设备';

COMMENT ON COLUMN EQUIPMENT.EQUID IS
'设备ID';

COMMENT ON COLUMN EQUIPMENT.EQUCODE IS
'设备编码';

COMMENT ON COLUMN EQUIPMENT.EQUNAME IS
'设备名称';

COMMENT ON COLUMN EQUIPMENT.IDENTIFY IS
'设备标识';

COMMENT ON COLUMN EQUIPMENT.MEMO IS
'备注';

COMMENT ON COLUMN EQUIPMENT.CREATED IS
'创建时间';

COMMENT ON COLUMN EQUIPMENT.CREATEDBY IS
'创建人';

COMMENT ON COLUMN EQUIPMENT.MODIFIED IS
'修改时间';

COMMENT ON COLUMN EQUIPMENT.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN EQUIPMENT.ISVOID IS
'禁用';

COMMENT ON COLUMN EQUIPMENT.ORGANIZATIONID IS
'ORGANIZATIONID';

COMMENT ON COLUMN EQUIPMENT.SUITEID IS
'SUITEID';

/*==============================================================*/
/* Index: EQUIPMENT_ORG                                         */
/*==============================================================*/
CREATE INDEX EQUIPMENT_ORG ON EQUIPMENT (
   ORGANIZATIONID ASC
);

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
'地区';

COMMENT ON COLUMN GEO.GEOID IS
'地区ID';

COMMENT ON COLUMN GEO.PARENTGEO IS
'上级地区';

COMMENT ON COLUMN GEO.GEOCODE IS
'地区编码';

COMMENT ON COLUMN GEO.GEONAME IS
'地区名称';

COMMENT ON COLUMN GEO.MEMO IS
'备注';

COMMENT ON COLUMN GEO.CREATED IS
'创建时间';

COMMENT ON COLUMN GEO.CREATEDBY IS
'创建人';

COMMENT ON COLUMN GEO.MODIFIED IS
'修改时间';

COMMENT ON COLUMN GEO.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN GEO.ISVOID IS
'禁用';

/*==============================================================*/
/* Index: IDX_GEO_GEOID_FK                                      */
/*==============================================================*/
CREATE INDEX IDX_GEO_GEOID_FK ON GEO (
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
   ORGANIZATIONID       VARCHAR2(40),
   SUITEID              VARCHAR2(40),
   CONSTRAINT PK_LOG PRIMARY KEY (LOGID)
);

COMMENT ON TABLE LOG IS
'日志';

COMMENT ON COLUMN LOG.LOGID IS
'日志ID';

COMMENT ON COLUMN LOG.LOGCODE IS
'日志编码';

COMMENT ON COLUMN LOG.LOGTYPE IS
'类型';

COMMENT ON COLUMN LOG."LEVEL" IS
'级别';

COMMENT ON COLUMN LOG.LOGSOURCE IS
'来源';

COMMENT ON COLUMN LOG.CONTENT IS
'内容';

COMMENT ON COLUMN LOG.RECORDTIME IS
'记录时间';

COMMENT ON COLUMN LOG.ISVOID IS
'禁用';

COMMENT ON COLUMN LOG.CREATED IS
'创建时间';

COMMENT ON COLUMN LOG.CREATEDBY IS
'创建人';

COMMENT ON COLUMN LOG.MODIFIED IS
'修改时间';

COMMENT ON COLUMN LOG.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN LOG.ORGANIZATIONID IS
'ORGANIZATIONID';

COMMENT ON COLUMN LOG.SUITEID IS
'SUITEID';

/*==============================================================*/
/* Index: IDX_LOG_ORGANIZATIONID                                */
/*==============================================================*/
CREATE INDEX IDX_LOG_ORGANIZATIONID ON LOG (
   ORGANIZATIONID ASC
);

/*==============================================================*/
/* Table: MENU                                                  */
/*==============================================================*/
CREATE TABLE MENU  (
   MENUID               VARCHAR2(40)                    NOT NULL,
   TITLE                VARCHAR2(100),
   URL                  VARCHAR2(2000),
   RESOURCEKEY          VARCHAR2(200),
   MEMO                 VARCHAR2(1000),
   PARENTMENU           VARCHAR2(40),
   ITEMORDER            VARCHAR2(600),
   TYPE                 VARCHAR2(40),
   CONSTRAINT PK_MENU PRIMARY KEY (MENUID)
);

COMMENT ON TABLE MENU IS
'菜单';

COMMENT ON COLUMN MENU.MENUID IS
'菜单ID';

COMMENT ON COLUMN MENU.TITLE IS
'标题';

COMMENT ON COLUMN MENU.URL IS
'URL';

COMMENT ON COLUMN MENU.RESOURCEKEY IS
'资源标识';

COMMENT ON COLUMN MENU.MEMO IS
'备注';

COMMENT ON COLUMN MENU.PARENTMENU IS
'父级菜单';

COMMENT ON COLUMN MENU.ITEMORDER IS
'菜单项顺序';

COMMENT ON COLUMN MENU.TYPE IS
'类型';

/*==============================================================*/
/* Table: MONITORPOINTINVIDEO                                   */
/*==============================================================*/
CREATE TABLE MONITORPOINTINVIDEO  (
   VIDEOID              VARCHAR2(40)                    NOT NULL,
   MPID                 VARCHAR2(40)                    NOT NULL,
   CONSTRAINT PK_MONITORPOINTINVIDEO PRIMARY KEY (VIDEOID, MPID)
);

COMMENT ON TABLE MONITORPOINTINVIDEO IS
'监控点与视频关系表，存储视频中包含的监控点';

COMMENT ON COLUMN MONITORPOINTINVIDEO.VIDEOID IS
'视频ID';

COMMENT ON COLUMN MONITORPOINTINVIDEO.MPID IS
'监控点ID';

/*==============================================================*/
/* Index: IDX_MPV_VIDEOID_FK                                    */
/*==============================================================*/
CREATE INDEX IDX_MPV_VIDEOID_FK ON MONITORPOINTINVIDEO (
   VIDEOID ASC
);

/*==============================================================*/
/* Index: IDX_MONITORPOINTVIDEO_MPID_FK                         */
/*==============================================================*/
CREATE INDEX IDX_MONITORPOINTVIDEO_MPID_FK ON MONITORPOINTINVIDEO (
   MPID ASC
);

/*==============================================================*/
/* Table: MPASSIGNMENT                                          */
/*==============================================================*/
CREATE TABLE MPASSIGNMENT  (
   MPID                 VARCHAR2(40)                    NOT NULL,
   ROADID               VARCHAR2(40),
   SCHEMAID             VARCHAR2(40),
   MPCODE               VARCHAR2(40),
   MPNAME               VARCHAR2(200),
   LONGITUDE            NUMBER(17,14),
   LATITUDE             NUMBER(17,14),
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   ORGANIZATIONID       VARCHAR2(40),
   SUITEID              VARCHAR2(40),
   ISVOID               VARCHAR2(1),
   MPLEVEL              NUMBER,
   CONSTRAINT PK_MPASSIGNMENT PRIMARY KEY (MPID)
);

COMMENT ON TABLE MPASSIGNMENT IS
'监控点分配';

COMMENT ON COLUMN MPASSIGNMENT.MPID IS
'监控点ID';

COMMENT ON COLUMN MPASSIGNMENT.ROADID IS
'路段ID';

COMMENT ON COLUMN MPASSIGNMENT.SCHEMAID IS
'时间模版';

COMMENT ON COLUMN MPASSIGNMENT.MPCODE IS
'监控点编码';

COMMENT ON COLUMN MPASSIGNMENT.MPNAME IS
'监控点名称';

COMMENT ON COLUMN MPASSIGNMENT.LONGITUDE IS
'经度';

COMMENT ON COLUMN MPASSIGNMENT.LATITUDE IS
'纬度';

COMMENT ON COLUMN MPASSIGNMENT.MEMO IS
'备注';

COMMENT ON COLUMN MPASSIGNMENT.CREATED IS
'创建时间';

COMMENT ON COLUMN MPASSIGNMENT.CREATEDBY IS
'创建人';

COMMENT ON COLUMN MPASSIGNMENT.MODIFIED IS
'修改时间';

COMMENT ON COLUMN MPASSIGNMENT.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN MPASSIGNMENT.ORGANIZATIONID IS
'ORGANIZATIONID';

COMMENT ON COLUMN MPASSIGNMENT.SUITEID IS
'SUITEID';

COMMENT ON COLUMN MPASSIGNMENT.ISVOID IS
'禁用';

COMMENT ON COLUMN MPASSIGNMENT.MPLEVEL IS
'地图缩放级别';

/*==============================================================*/
/* Index: IDX_ROAD_ROADID_FK                                    */
/*==============================================================*/
CREATE INDEX IDX_ROAD_ROADID_FK ON MPASSIGNMENT (
   ROADID ASC
);

/*==============================================================*/
/* Index: IDX_ROAD_ORGANIZATIONID                               */
/*==============================================================*/
CREATE INDEX IDX_ROAD_ORGANIZATIONID ON MPASSIGNMENT (
   ORGANIZATIONID ASC
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
   ISVOID               VARCHAR2(1),
   ORGANIZATIONID       VARCHAR2(40),
   OPORDER              NUMBER,
   OPIDENTITY           VARCHAR2(40),
   CONSTRAINT PK_OPERATION PRIMARY KEY (OPID)
);

COMMENT ON TABLE OPERATION IS
'操作';

COMMENT ON COLUMN OPERATION.OPID IS
'操作ID';

COMMENT ON COLUMN OPERATION.OPCODE IS
'操作编码';

COMMENT ON COLUMN OPERATION.OPNAME IS
'操作名称';

COMMENT ON COLUMN OPERATION.MEMO IS
'备注';

COMMENT ON COLUMN OPERATION.CREATED IS
'创建时间';

COMMENT ON COLUMN OPERATION.CREATEDBY IS
'创建人';

COMMENT ON COLUMN OPERATION.MODIFIED IS
'修改时间';

COMMENT ON COLUMN OPERATION.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN OPERATION.ISVOID IS
'禁用';

COMMENT ON COLUMN OPERATION.ORGANIZATIONID IS
'ORGANIZATIONID';

COMMENT ON COLUMN OPERATION.OPORDER IS
'OPORDER';

COMMENT ON COLUMN OPERATION.OPIDENTITY IS
'OPIDENTITY';

/*==============================================================*/
/* Index: IDX_OPERATION_ORGANIZATIONID                          */
/*==============================================================*/
CREATE INDEX IDX_OPERATION_ORGANIZATIONID ON OPERATION (
   ORGANIZATIONID ASC
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
   ORGTYPE              VARCHAR2(40),
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
   CONSTRAINT PK_ORGANIZATION PRIMARY KEY (ORGID)
);

COMMENT ON TABLE ORGANIZATION IS
'机构';

COMMENT ON COLUMN ORGANIZATION.ORGID IS
'机构ID';

COMMENT ON COLUMN ORGANIZATION.COUNTRY IS
'国家';

COMMENT ON COLUMN ORGANIZATION.CITY IS
'市';

COMMENT ON COLUMN ORGANIZATION.PARENTORG IS
'上级机构';

COMMENT ON COLUMN ORGANIZATION.PROVINCE IS
'省';

COMMENT ON COLUMN ORGANIZATION.ORGCODE IS
'机构编码';

COMMENT ON COLUMN ORGANIZATION.ORGNAME IS
'机构名称';

COMMENT ON COLUMN ORGANIZATION.ORGTYPE IS
'机构类型';

COMMENT ON COLUMN ORGANIZATION.ORGALIAS IS
'简称';

COMMENT ON COLUMN ORGANIZATION.ORGSTATUS IS
'机构概况';

COMMENT ON COLUMN ORGANIZATION.ORGADDRESS IS
'机构地址';

COMMENT ON COLUMN ORGANIZATION.ZIPCODE IS
'邮编';

COMMENT ON COLUMN ORGANIZATION.CONTACT IS
'联系人';

COMMENT ON COLUMN ORGANIZATION.CONTACTTEL IS
'联系电话';

COMMENT ON COLUMN ORGANIZATION.EMAIL IS
'Email';

COMMENT ON COLUMN ORGANIZATION.MEMO IS
'备注';

COMMENT ON COLUMN ORGANIZATION.CREATED IS
'创建时间';

COMMENT ON COLUMN ORGANIZATION.CREATEDBY IS
'创建人';

COMMENT ON COLUMN ORGANIZATION.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN ORGANIZATION.ISVOID IS
'禁用';

COMMENT ON COLUMN ORGANIZATION.SUITEID IS
'SUITEID';

COMMENT ON COLUMN ORGANIZATION.DATABASEID IS
'DATABASEID';

COMMENT ON COLUMN ORGANIZATION.MODIFIED IS
'修改时间';

COMMENT ON COLUMN ORGANIZATION.ORGANIZATIONID IS
'ORGANIZATIONID';

/*==============================================================*/
/* Index: IDX_ORGANIZATION_PROVINCE_FK                          */
/*==============================================================*/
CREATE INDEX IDX_ORGANIZATION_PROVINCE_FK ON ORGANIZATION (
   PROVINCE ASC
);

/*==============================================================*/
/* Index: IDX_ORGANIZATION_CITY_FK                              */
/*==============================================================*/
CREATE INDEX IDX_ORGANIZATION_CITY_FK ON ORGANIZATION (
   CITY ASC
);

/*==============================================================*/
/* Index: IDX_ORGANIZATION_COUNTRY_FK                           */
/*==============================================================*/
CREATE INDEX IDX_ORGANIZATION_COUNTRY_FK ON ORGANIZATION (
   COUNTRY ASC
);

/*==============================================================*/
/* Index: IDX_ORGANIZATION_PARENTORG_FK                         */
/*==============================================================*/
CREATE INDEX IDX_ORGANIZATION_PARENTORG_FK ON ORGANIZATION (
   PARENTORG ASC
);

/*==============================================================*/
/* Index: IDX_ORGANIZATION_SUITEID                              */
/*==============================================================*/
CREATE INDEX IDX_ORGANIZATION_SUITEID ON ORGANIZATION (
   SUITEID ASC
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
   ORGANIZATIONID       VARCHAR2(40),
   SUITEID              VARCHAR2(40),
   CONSTRAINT PK_PASSPORT PRIMARY KEY (PASSPORTID)
);

COMMENT ON TABLE PASSPORT IS
'账号';

COMMENT ON COLUMN PASSPORT.PASSPORTID IS
'账号ID';

COMMENT ON COLUMN PASSPORT.EMPID IS
'职员';

COMMENT ON COLUMN PASSPORT.PASSPORTCODE IS
'账号编码';

COMMENT ON COLUMN PASSPORT.PASSPORT IS
'账号';

COMMENT ON COLUMN PASSPORT.PASSWORD IS
'密码';

COMMENT ON COLUMN PASSPORT.ISVOID IS
'禁用';

COMMENT ON COLUMN PASSPORT.MEMO IS
'备注';

COMMENT ON COLUMN PASSPORT.CREATED IS
'创建时间';

COMMENT ON COLUMN PASSPORT.CREATEDBY IS
'创建人';

COMMENT ON COLUMN PASSPORT.MODIFIED IS
'修改时间';

COMMENT ON COLUMN PASSPORT.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN PASSPORT.ORGANIZATIONID IS
'ORGANIZATIONID';

COMMENT ON COLUMN PASSPORT.SUITEID IS
'SUITEID';

/*==============================================================*/
/* Index: IDX_PASSPORT_EMPID_FK                                 */
/*==============================================================*/
CREATE INDEX IDX_PASSPORT_EMPID_FK ON PASSPORT (
   EMPID ASC
);

/*==============================================================*/
/* Index: PASSPORT_ORGANIZATIONID                               */
/*==============================================================*/
CREATE INDEX PASSPORT_ORGANIZATIONID ON PASSPORT (
   ORGANIZATIONID ASC
);

/*==============================================================*/
/* Table: PROJECT                                               */
/*==============================================================*/
CREATE TABLE PROJECT  (
   PROJECTID            VARCHAR2(40)                    NOT NULL,
   EMPID                VARCHAR2(40),
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
   ORGANIZATIONID       VARCHAR2(40),
   SUITEID              VARCHAR2(40),
   ISVOID               VARCHAR2(1),
   CONSTRAINT PK_PROJECT PRIMARY KEY (PROJECTID)
);

COMMENT ON TABLE PROJECT IS
'项目';

COMMENT ON COLUMN PROJECT.PROJECTID IS
'项目ID';

COMMENT ON COLUMN PROJECT.EMPID IS
'负责人';

COMMENT ON COLUMN PROJECT.PROJECTCODE IS
'项目编码';

COMMENT ON COLUMN PROJECT.PROJECTNAME IS
'项目名称';

COMMENT ON COLUMN PROJECT.TOTALWORKTIME IS
'总作业时间';

COMMENT ON COLUMN PROJECT.TOTALSCALE IS
'总规模';

COMMENT ON COLUMN PROJECT.ASSISTAMOUNT IS
'助理人数';

COMMENT ON COLUMN PROJECT.LEADERAMOUNT IS
'组长人数';

COMMENT ON COLUMN PROJECT.VISELEADERAMOUNT IS
'副组长人数';

COMMENT ON COLUMN PROJECT.TOTALWORKERAMOUNT IS
'总工人数';

COMMENT ON COLUMN PROJECT.MEMO IS
'备注';

COMMENT ON COLUMN PROJECT.CREATED IS
'创建时间';

COMMENT ON COLUMN PROJECT.CREATEDBY IS
'创建人';

COMMENT ON COLUMN PROJECT.MODIFIED IS
'修改时间';

COMMENT ON COLUMN PROJECT.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN PROJECT.ORGANIZATIONID IS
'ORGANIZATIONID';

COMMENT ON COLUMN PROJECT.SUITEID IS
'SUITEID';

COMMENT ON COLUMN PROJECT.ISVOID IS
'禁用';

/*==============================================================*/
/* Index: IDX_PROJECT_EMPID_FK                                  */
/*==============================================================*/
CREATE INDEX IDX_PROJECT_EMPID_FK ON PROJECT (
   EMPID ASC
);

/*==============================================================*/
/* Index: IDX_PROJECT_ORGANIZATIONID                            */
/*==============================================================*/
CREATE INDEX IDX_PROJECT_ORGANIZATIONID ON PROJECT (
   ORGANIZATIONID ASC
);

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
   LONGITUDE            NUMBER(17,14),
   LATITUDE             NUMBER(17,14),
   TYPE                 VARCHAR2(40),
   ORGANIZATIONID       VARCHAR2(40),
   SUITEID              VARCHAR2(40),
   ISVOID               VARCHAR2(1),
   QUALITYLEVEL         NUMBER,
   IMAGEURL             VARCHAR2(1000),
   CONSTRAINT PK_QUALITY PRIMARY KEY (QMID)
);

COMMENT ON TABLE QUALITY IS
'质量控制';

COMMENT ON COLUMN QUALITY.MEMO IS
'备注';

COMMENT ON COLUMN QUALITY.CREATED IS
'创建时间';

COMMENT ON COLUMN QUALITY.CREATEDBY IS
'创建人';

COMMENT ON COLUMN QUALITY.MODIFIED IS
'修改时间';

COMMENT ON COLUMN QUALITY.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN QUALITY.QMID IS
'QMID';

COMMENT ON COLUMN QUALITY.CHARGEPERSON IS
'责任人';

COMMENT ON COLUMN QUALITY.WORKUNIT IS
'作业单位';

COMMENT ON COLUMN QUALITY.STATUS IS
'状态';

COMMENT ON COLUMN QUALITY.MPID IS
'监控点ID';

COMMENT ON COLUMN QUALITY.EMERGENCYPERSON IS
'应急处理责任人';

COMMENT ON COLUMN QUALITY.QMCODE IS
'质控编码';

COMMENT ON COLUMN QUALITY.CHECKPERSON IS
'巡检员';

COMMENT ON COLUMN QUALITY.MATERIAL IS
'图片信息';

COMMENT ON COLUMN QUALITY.LONGITUDE IS
'数据采集地点经度';

COMMENT ON COLUMN QUALITY.LATITUDE IS
'数据采集地点纬度';

COMMENT ON COLUMN QUALITY.TYPE IS
'类型';

COMMENT ON COLUMN QUALITY.ORGANIZATIONID IS
'ORGANIZATIONID';

COMMENT ON COLUMN QUALITY.SUITEID IS
'SUITEID';

COMMENT ON COLUMN QUALITY.ISVOID IS
'禁用';

COMMENT ON COLUMN QUALITY.QUALITYLEVEL IS
'QUALITYLEVEL';

COMMENT ON COLUMN QUALITY.IMAGEURL IS
'图片URL';

/*==============================================================*/
/* Index: IDX_QUALITY_CHARGEPERSON_FK                           */
/*==============================================================*/
CREATE INDEX IDX_QUALITY_CHARGEPERSON_FK ON QUALITY (
   CHARGEPERSON ASC
);

/*==============================================================*/
/* Index: IDX_QUALITY_EMERGENCYPERSON_FK                        */
/*==============================================================*/
CREATE INDEX IDX_QUALITY_EMERGENCYPERSON_FK ON QUALITY (
   EMERGENCYPERSON ASC
);

/*==============================================================*/
/* Index: IDX_QUALITY_CHECKPERSON_FK                            */
/*==============================================================*/
CREATE INDEX IDX_QUALITY_CHECKPERSON_FK ON QUALITY (
   CHECKPERSON ASC
);

/*==============================================================*/
/* Index: IDX_QUALITY_WORKUNIT_FK                               */
/*==============================================================*/
CREATE INDEX IDX_QUALITY_WORKUNIT_FK ON QUALITY (
   WORKUNIT ASC
);

/*==============================================================*/
/* Index: IDX_QUALITY_MPID_FK                                   */
/*==============================================================*/
CREATE INDEX IDX_QUALITY_MPID_FK ON QUALITY (
   MPID ASC
);

/*==============================================================*/
/* Index: IDX_QUALITY_STATUS_FK                                 */
/*==============================================================*/
CREATE INDEX IDX_QUALITY_STATUS_FK ON QUALITY (
   STATUS ASC
);

/*==============================================================*/
/* Index: IDX_QUALITY_CREATED                                   */
/*==============================================================*/
CREATE INDEX IDX_QUALITY_CREATED ON QUALITY (
   CREATED DESC
);

/*==============================================================*/
/* Index: IDX_QUALITY_ORGANIZATIONID                            */
/*==============================================================*/
CREATE INDEX IDX_QUALITY_ORGANIZATIONID ON QUALITY (
   ORGANIZATIONID ASC
);

/*==============================================================*/
/* Table: RESOURCEITEM                                          */
/*==============================================================*/
CREATE TABLE RESOURCEITEM  (
   RESID                VARCHAR2(40)                    NOT NULL,
   RESCODE              VARCHAR2(40)                    NOT NULL,
   RESIDENTITY          VARCHAR2(200),
   VIEWNAME             VARCHAR2(512),
   RESNAME              VARCHAR2(60)                    NOT NULL,
   RESTYPE              VARCHAR2(60),
   LOCATION             VARCHAR2(600),
   ISVOID               CHAR(1),
   MEMO                 VARCHAR2(2000),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   ORGANIZATIONID       VARCHAR2(40),
   CONSTRAINT PK_RESOURCEITEM PRIMARY KEY (RESID)
);

COMMENT ON TABLE RESOURCEITEM IS
'资源';

COMMENT ON COLUMN RESOURCEITEM.RESID IS
'资源ID';

COMMENT ON COLUMN RESOURCEITEM.RESCODE IS
'资源编码';

COMMENT ON COLUMN RESOURCEITEM.RESIDENTITY IS
'资源标识';

COMMENT ON COLUMN RESOURCEITEM.VIEWNAME IS
'用于保存实际的页面文件名';

COMMENT ON COLUMN RESOURCEITEM.RESNAME IS
'自定义的资源点名称';

COMMENT ON COLUMN RESOURCEITEM.RESTYPE IS
'资源类型';

COMMENT ON COLUMN RESOURCEITEM.LOCATION IS
'资源位置';

COMMENT ON COLUMN RESOURCEITEM.ISVOID IS
'禁用';

COMMENT ON COLUMN RESOURCEITEM.MEMO IS
'备注';

COMMENT ON COLUMN RESOURCEITEM.CREATED IS
'创建时间';

COMMENT ON COLUMN RESOURCEITEM.CREATEDBY IS
'创建人';

COMMENT ON COLUMN RESOURCEITEM.MODIFIED IS
'修改时间';

COMMENT ON COLUMN RESOURCEITEM.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN RESOURCEITEM.ORGANIZATIONID IS
'ORGANIZATIONID';

/*==============================================================*/
/* Index: IDX_U_RESOURCE_RESIDENTITY                            */
/*==============================================================*/
CREATE UNIQUE INDEX IDX_U_RESOURCE_RESIDENTITY ON RESOURCEITEM (
   RESIDENTITY ASC
);

/*==============================================================*/
/* Index: RESOURCEITEM_ORGANIZATIONID                           */
/*==============================================================*/
CREATE INDEX RESOURCEITEM_ORGANIZATIONID ON RESOURCEITEM (
   ORGANIZATIONID ASC
);

/*==============================================================*/
/* Table: RESPERMISSION                                         */
/*==============================================================*/
CREATE TABLE RESPERMISSION  (
   ORGANIZATIONID       VARCHAR2(40),
   ROLEID               VARCHAR2(40)                    NOT NULL,
   RESID                VARCHAR2(40)                    NOT NULL,
   OPID                 VARCHAR2(40)                    NOT NULL,
   CONSTRAINT PK_RESPERMISSION PRIMARY KEY (ROLEID, RESID, OPID)
);

COMMENT ON TABLE RESPERMISSION IS
'资源权限';

COMMENT ON COLUMN RESPERMISSION.ORGANIZATIONID IS
'ORGANIZATIONID';

COMMENT ON COLUMN RESPERMISSION.ROLEID IS
'角色ID';

COMMENT ON COLUMN RESPERMISSION.RESID IS
'资源ID';

COMMENT ON COLUMN RESPERMISSION.OPID IS
'操作ID';

/*==============================================================*/
/* Index: IDX_RESPERM_ORGANIZATIONID                            */
/*==============================================================*/
CREATE INDEX IDX_RESPERM_ORGANIZATIONID ON RESPERMISSION (
   ORGANIZATIONID ASC
);

/*==============================================================*/
/* Index: IDX_RESPERMISSION_ROLEID_FK                           */
/*==============================================================*/
CREATE INDEX IDX_RESPERMISSION_ROLEID_FK ON RESPERMISSION (
   ROLEID ASC
);

/*==============================================================*/
/* Index: IDX_RESPERMISSION_OPID_FK                             */
/*==============================================================*/
CREATE INDEX IDX_RESPERMISSION_OPID_FK ON RESPERMISSION (
   OPID ASC
);

/*==============================================================*/
/* Index: IDX_RESPERMISSION_RESID_FK                            */
/*==============================================================*/
CREATE INDEX IDX_RESPERMISSION_RESID_FK ON RESPERMISSION (
   RESID ASC
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
   ISVOID               VARCHAR2(1),
   ORGANIZATIONID       VARCHAR2(40),
   SUITEID              VARCHAR2(40),
   CONSTRAINT PK_ROAD PRIMARY KEY (ROADID)
);

COMMENT ON TABLE ROAD IS
'路段';

COMMENT ON COLUMN ROAD.ROADID IS
'路段ID';

COMMENT ON COLUMN ROAD.PROJECTID IS
'项目ID';

COMMENT ON COLUMN ROAD.ROADCODE IS
'路段编码';

COMMENT ON COLUMN ROAD.ROADNAME IS
'路段名称';

COMMENT ON COLUMN ROAD.ROADTYPE IS
'路段类型';

COMMENT ON COLUMN ROAD.BEGINTIME IS
'作业开始时间';

COMMENT ON COLUMN ROAD.ENDTIME IS
'作业结束时间';

COMMENT ON COLUMN ROAD.WORKTIME IS
'作业时间';

COMMENT ON COLUMN ROAD.WORKERAMOUNT IS
'工作人数';

COMMENT ON COLUMN ROAD.MEMO IS
'备注';

COMMENT ON COLUMN ROAD.AVGWORKERAMOUNT IS
'工人人均量';

COMMENT ON COLUMN ROAD.CREATED IS
'创建时间';

COMMENT ON COLUMN ROAD.CREATEDBY IS
'创建人';

COMMENT ON COLUMN ROAD.MODIFIED IS
'修改时间';

COMMENT ON COLUMN ROAD.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN ROAD.ISVOID IS
'禁用';

COMMENT ON COLUMN ROAD.ORGANIZATIONID IS
'ORGANIZATIONID';

COMMENT ON COLUMN ROAD.SUITEID IS
'SUITEID';

/*==============================================================*/
/* Index: IDX_ROAD_PROJECTID_FK                                 */
/*==============================================================*/
CREATE INDEX IDX_ROAD_PROJECTID_FK ON ROAD (
   PROJECTID ASC
);

/*==============================================================*/
/* Index: IDX_ROAD_ORGAINZATIONID                               */
/*==============================================================*/
CREATE INDEX IDX_ROAD_ORGAINZATIONID ON ROAD (
   ORGANIZATIONID ASC
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
   ORGANIZATIONID       VARCHAR2(40),
   SUITEID              VARCHAR2(40),
   CONSTRAINT PK_ROLE PRIMARY KEY (ROLEID)
);

COMMENT ON TABLE ROLE IS
'角色';

COMMENT ON COLUMN ROLE.ROLEID IS
'角色ID';

COMMENT ON COLUMN ROLE.ROLECODE IS
'角色编码';

COMMENT ON COLUMN ROLE.ROLENAME IS
'角色名称';

COMMENT ON COLUMN ROLE.ISVOID IS
'禁用';

COMMENT ON COLUMN ROLE.MEMO IS
'备注';

COMMENT ON COLUMN ROLE.CREATED IS
'创建时间';

COMMENT ON COLUMN ROLE.CREATEDBY IS
'创建人';

COMMENT ON COLUMN ROLE.MODIFIED IS
'修改时间';

COMMENT ON COLUMN ROLE.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN ROLE.ORGANIZATIONID IS
'ORGANIZATIONID';

COMMENT ON COLUMN ROLE.SUITEID IS
'SUITEID';

/*==============================================================*/
/* Index: ROLE_ORGANIZATIONID                                   */
/*==============================================================*/
CREATE INDEX ROLE_ORGANIZATIONID ON ROLE (
   ORGANIZATIONID ASC
);

/*==============================================================*/
/* Table: TIME                                                  */
/*==============================================================*/
CREATE TABLE TIME  (
   TIMEID               VARCHAR2(40)                    NOT NULL,
   TIME                 VARCHAR2(100),
   CONSTRAINT PK_TIME PRIMARY KEY (TIMEID)
);

COMMENT ON TABLE TIME IS
'时间刻度';

COMMENT ON COLUMN TIME.TIMEID IS
'时间刻度ID';

COMMENT ON COLUMN TIME.TIME IS
'时间';

/*==============================================================*/
/* Table: TIMEITEM                                              */
/*==============================================================*/
CREATE TABLE TIMEITEM  (
   TIMEITEMID           VARCHAR2(40)                    NOT NULL,
   SCHEMAID             VARCHAR2(40),
   TIMEITEMTYPE         VARCHAR2(40),
   TIMESPOT             VARCHAR2(40),
   TIMESPAN             NUMBER,
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   TIMES                NUMBER,
   MODIFIEDBY           VARCHAR2(40),
   ORGANIZATIONID       VARCHAR2(40),
   CONSTRAINT PK_TIMEITEM PRIMARY KEY (TIMEITEMID)
);

COMMENT ON TABLE TIMEITEM IS
'时间项';

COMMENT ON COLUMN TIMEITEM.TIMEITEMID IS
'时间项ID';

COMMENT ON COLUMN TIMEITEM.SCHEMAID IS
'模版';

COMMENT ON COLUMN TIMEITEM.TIMEITEMTYPE IS
'时间项类型';

COMMENT ON COLUMN TIMEITEM.TIMESPOT IS
'时间点';

COMMENT ON COLUMN TIMEITEM.TIMESPAN IS
'时间间隔';

COMMENT ON COLUMN TIMEITEM.CREATED IS
'创建时间';

COMMENT ON COLUMN TIMEITEM.CREATEDBY IS
'创建人';

COMMENT ON COLUMN TIMEITEM.MODIFIED IS
'修改时间';

COMMENT ON COLUMN TIMEITEM.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN TIMEITEM.ORGANIZATIONID IS
'ORGANIZATIONID';

/*==============================================================*/
/* Index: IDX_TIMEITEM_ORGANIZATIONID                           */
/*==============================================================*/
CREATE INDEX IDX_TIMEITEM_ORGANIZATIONID ON TIMEITEM (
   ORGANIZATIONID ASC
);

/*==============================================================*/
/* Table: TIMESCHEMA                                            */
/*==============================================================*/
CREATE TABLE TIMESCHEMA  (
   SCHEMAID             VARCHAR2(40)                    NOT NULL,
   SCHEMANAME           VARCHAR2(60),
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   ORGANIZATIONID       VARCHAR2(40),
   FLOATTIME            NUMBER,
   BEGINTIME            DATE,
   ENDTIME              DATE,
   CONSTRAINT PK_TIMESCHEMA PRIMARY KEY (SCHEMAID)
);

COMMENT ON TABLE TIMESCHEMA IS
'时间模版';

COMMENT ON COLUMN TIMESCHEMA.SCHEMAID IS
'模版ID';

COMMENT ON COLUMN TIMESCHEMA.SCHEMANAME IS
'模版名称';

COMMENT ON COLUMN TIMESCHEMA.CREATED IS
'创建时间';

COMMENT ON COLUMN TIMESCHEMA.CREATEDBY IS
'创建人';

COMMENT ON COLUMN TIMESCHEMA.MODIFIED IS
'修改时间';

COMMENT ON COLUMN TIMESCHEMA.MODIFIEDBY IS
'修改人';

COMMENT ON COLUMN TIMESCHEMA.ORGANIZATIONID IS
'ORGANIZATIONID';

COMMENT ON COLUMN TIMESCHEMA.FLOATTIME IS
'浮动时间';

COMMENT ON COLUMN TIMESCHEMA.BEGINTIME IS
'开始时间';

COMMENT ON COLUMN TIMESCHEMA.ENDTIME IS
'结束时间';

COMMENT ON COLUMN TIMESCHEMA.TIMES IS
'巡检次数';

/*==============================================================*/
/* Index: IDX_TIMESCHEMA_ORGANIZATIONID                         */
/*==============================================================*/
CREATE INDEX IDX_TIMESCHEMA_ORGANIZATIONID ON TIMESCHEMA (
   ORGANIZATIONID ASC
);

/*==============================================================*/
/* Table: USERROLE                                              */
/*==============================================================*/
CREATE TABLE USERROLE  (
   ROLEID               VARCHAR2(40)                    NOT NULL,
   PASSPORTID           VARCHAR2(40)                    NOT NULL,
   ORGANIZATIONID       VARCHAR2(40)                    NOT NULL,
   CONSTRAINT PK_USERROLE PRIMARY KEY (ROLEID, PASSPORTID)
);

COMMENT ON TABLE USERROLE IS
'用户角色';

COMMENT ON COLUMN USERROLE.ROLEID IS
'角色ID';

COMMENT ON COLUMN USERROLE.PASSPORTID IS
'账号ID';

COMMENT ON COLUMN USERROLE.ORGANIZATIONID IS
'ORGANIZATIONID';

/*==============================================================*/
/* Index: IDX_USERROLE_ROLEID_FK                                */
/*==============================================================*/
CREATE INDEX IDX_USERROLE_ROLEID_FK ON USERROLE (
   ROLEID ASC
);

/*==============================================================*/
/* Index: IDX_USERROLE_PASSPORTID_FK                            */
/*==============================================================*/
CREATE INDEX IDX_USERROLE_PASSPORTID_FK ON USERROLE (
   PASSPORTID ASC
);

/*==============================================================*/
/* Index: IDX_USERROLE_ORGANIZATIONID                           */
/*==============================================================*/
CREATE INDEX IDX_USERROLE_ORGANIZATIONID ON USERROLE (
   ORGANIZATIONID ASC
);

/*==============================================================*/
/* Table: VIDEO                                                 */
/*==============================================================*/
CREATE TABLE VIDEO  (
   VIDEOID              VARCHAR2(40)                    NOT NULL,
   VIDEONAME            VARCHAR2(100),
   MEMO                 VARCHAR2(500),
   VIDEOURL             VARCHAR2(2000),
   TRACE                CLOB,
   CREATED              DATE,
   CREATEDBY            VARCHAR2(40),
   MODIFIED             DATE,
   MODIFIEDBY           VARCHAR2(40),
   ORGANIZATIONID       VARCHAR2(40),
   CONSTRAINT PK_VIDEO PRIMARY KEY (VIDEOID)
);

COMMENT ON TABLE VIDEO IS
'质量监控时采集的视频数据';

COMMENT ON COLUMN VIDEO.VIDEOID IS
'VideoId';

COMMENT ON COLUMN VIDEO.VIDEONAME IS
'VideoName';

COMMENT ON COLUMN VIDEO.MEMO IS
'Memo';

COMMENT ON COLUMN VIDEO.VIDEOURL IS
'VideoUrl';

COMMENT ON COLUMN VIDEO.TRACE IS
'Trace';

COMMENT ON COLUMN VIDEO.CREATED IS
'Created';

COMMENT ON COLUMN VIDEO.CREATEDBY IS
'CreatedBy';

COMMENT ON COLUMN VIDEO.MODIFIED IS
'Modified';

COMMENT ON COLUMN VIDEO.MODIFIEDBY IS
'ModifiedBy';

COMMENT ON COLUMN VIDEO.ORGANIZATIONID IS
'ORGANIZATIONID';

/*==============================================================*/
/* Index: IDX_ORGANIZATIONID                                    */
/*==============================================================*/
CREATE INDEX IDX_ORGANIZATIONID ON VIDEO (
   ORGANIZATIONID ASC
);

ALTER TABLE EMPLOYEE
   ADD CONSTRAINT FK_EMPLOYEE_EMP_DEPT__ORGANIZA FOREIGN KEY (DEPTID)
      REFERENCES ORGANIZATION (ORGID);

ALTER TABLE EMPLOYEE
   ADD CONSTRAINT FK_EMPLOYEE_EMP_ORG_R_ORGANIZA FOREIGN KEY (ORGANIZATIONID)
      REFERENCES ORGANIZATION (ORGID);

ALTER TABLE EMPLOYEE
   ADD CONSTRAINT FK_EMPLOYEE_REFERENCE_ENUMERAT FOREIGN KEY (DEGREE)
      REFERENCES ENUMERATION (ENUMID);

ALTER TABLE EMPLOYEE
   ADD CONSTRAINT FK_EMPLOYEE_RELATIONS_ENUMERAT FOREIGN KEY (SEX)
      REFERENCES ENUMERATION (ENUMID);

ALTER TABLE EMPLOYEE
   ADD CONSTRAINT FK_EMPLOYEE_RELEQUBIN_EQUIPMEN FOREIGN KEY (EQUID)
      REFERENCES EQUIPMENT (EQUID);

ALTER TABLE GEO
   ADD CONSTRAINT FK_GEO_RELGEO_GEO FOREIGN KEY (PARENTGEO)
      REFERENCES GEO (GEOID);

ALTER TABLE MONITORPOINTINVIDEO
   ADD CONSTRAINT FK_MONITORP_REFERENCE_VIDEO FOREIGN KEY (VIDEOID)
      REFERENCES VIDEO (VIDEOID);

ALTER TABLE MONITORPOINTINVIDEO
   ADD CONSTRAINT FK_MONITORP_REFERENCE_MPASSIGN FOREIGN KEY (MPID)
      REFERENCES MPASSIGNMENT (MPID);

ALTER TABLE MPASSIGNMENT
   ADD CONSTRAINT FK_MPASSIGN_REFERENCE_TIMESCHE FOREIGN KEY (SCHEMAID)
      REFERENCES TIMESCHEMA (SCHEMAID);

ALTER TABLE MPASSIGNMENT
   ADD CONSTRAINT FK_MPASSIGN_RELATIONS_ROAD FOREIGN KEY (ROADID)
      REFERENCES ROAD (ROADID);

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

ALTER TABLE PASSPORT
   ADD CONSTRAINT FK_PASSPORT_EMPPASSPO_EMPLOYEE FOREIGN KEY (EMPID)
      REFERENCES EMPLOYEE (EMPID);

ALTER TABLE PROJECT
   ADD CONSTRAINT FK_PROJECT_REFERENCE_EMPLOYEE FOREIGN KEY (EMPID)
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
   ADD CONSTRAINT FK_QUALITY_RELWORKUN_ORGANIZA FOREIGN KEY (WORKUNIT)
      REFERENCES ORGANIZATION (ORGID);

ALTER TABLE RESPERMISSION
   ADD CONSTRAINT FK_RESPERMI_REFERENCE_ROLE FOREIGN KEY (ROLEID)
      REFERENCES ROLE (ROLEID);

ALTER TABLE RESPERMISSION
   ADD CONSTRAINT FK_RESPERMI_REFERENCE_RESOURCE FOREIGN KEY (RESID)
      REFERENCES RESOURCEITEM (RESID);

ALTER TABLE RESPERMISSION
   ADD CONSTRAINT FK_RESPERMI_REFERENCE_OPERATIO FOREIGN KEY (OPID)
      REFERENCES OPERATION (OPID);

ALTER TABLE ROAD
   ADD CONSTRAINT FK_ROAD_RELATIONS_PROJECT FOREIGN KEY (PROJECTID)
      REFERENCES PROJECT (PROJECTID);

ALTER TABLE TIMEITEM
   ADD CONSTRAINT FK_TIMEITEM_REFERENCE_TIME FOREIGN KEY (TIMESPOT)
      REFERENCES TIME (TIMEID);

ALTER TABLE TIMEITEM
   ADD CONSTRAINT FK_TIMEITEM_REFERENCE_TIMESCHE FOREIGN KEY (SCHEMAID)
      REFERENCES TIMESCHEMA (SCHEMAID);

ALTER TABLE USERROLE
   ADD CONSTRAINT FK_USERROLE_USERROLE_ROLE FOREIGN KEY (ROLEID)
      REFERENCES ROLE (ROLEID);

ALTER TABLE USERROLE
   ADD CONSTRAINT FK_USERROLE_USERROLE2_PASSPORT FOREIGN KEY (PASSPORTID)
      REFERENCES PASSPORT (PASSPORTID);

