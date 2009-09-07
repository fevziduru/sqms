prompt PL/SQL Developer import file
prompt Created on 2009年9月7日 by puy
set feedback off
set define off
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
prompt Disabling triggers for LOG...
alter table LOG disable all triggers;
prompt Disabling triggers for MENU...
alter table MENU disable all triggers;
prompt Disabling triggers for PROJECT...
alter table PROJECT disable all triggers;
prompt Disabling triggers for ROAD...
alter table ROAD disable all triggers;
prompt Disabling triggers for TIMESCHEMA...
alter table TIMESCHEMA disable all triggers;
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
prompt Disabling triggers for TIME...
alter table TIME disable all triggers;
prompt Disabling triggers for TIMEITEM...
alter table TIMEITEM disable all triggers;
prompt Disabling triggers for USERROLE...
alter table USERROLE disable all triggers;
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
prompt Disabling foreign key constraints for PROJECT...
alter table PROJECT disable constraint FK_PROJECT_REFERENCE_EMPLOYEE;
prompt Disabling foreign key constraints for MPASSIGNMENT...
alter table MPASSIGNMENT disable constraint FK_MPASSIGN_REFERENCE_TIMESCHE;
alter table MPASSIGNMENT disable constraint FK_MPASSIGN_RELATIONS_ROAD;
prompt Disabling foreign key constraints for MONITORPOINTINVIDEO...
alter table MONITORPOINTINVIDEO disable constraint FK_MONITORP_REFERENCE_MPASSIGN;
prompt Disabling foreign key constraints for PASSPORT...
alter table PASSPORT disable constraint FK_PASSPORT_EMPPASSPO_EMPLOYEE;
prompt Disabling foreign key constraints for QUALITY...
alter table QUALITY disable constraint FK_QUALITY_RELATIONS_ENUMERAT;
alter table QUALITY disable constraint FK_QUALITY_RELATIONS_MPASSIGN;
alter table QUALITY disable constraint FK_QUALITY_RELCHARGE_EMPLOYEE;
alter table QUALITY disable constraint FK_QUALITY_RELEMERGE_EMPLOYEE;
alter table QUALITY disable constraint FK_QUALITY_RELEMPLOY_EMPLOYEE;
alter table QUALITY disable constraint FK_QUALITY_RELWORKUN_ORGANIZA;
prompt Disabling foreign key constraints for RESPERMISSION...
alter table RESPERMISSION disable constraint FK_RESPERMI_REFERENCE_OPERATIO;
alter table RESPERMISSION disable constraint FK_RESPERMI_REFERENCE_RESOURCE;
alter table RESPERMISSION disable constraint FK_RESPERMI_REFERENCE_ROLE;
prompt Disabling foreign key constraints for TIMEITEM...
alter table TIMEITEM disable constraint FK_TIMEITEM_REFERENCE_TIME;
alter table TIMEITEM disable constraint FK_TIMEITEM_REFERENCE_TIMESCHE;
prompt Disabling foreign key constraints for USERROLE...
alter table USERROLE disable constraint FK_USERROLE_USERROLE2_PASSPORT;
alter table USERROLE disable constraint FK_USERROLE_USERROLE_ROLE;
prompt Deleting USERROLE...
delete from USERROLE;
commit;
prompt Deleting TIMEITEM...
delete from TIMEITEM;
commit;
prompt Deleting TIME...
delete from TIME;
commit;
prompt Deleting RESPERMISSION...
delete from RESPERMISSION;
commit;
prompt Deleting ROLE...
delete from ROLE;
commit;
prompt Deleting RESOURCEITEM...
delete from RESOURCEITEM;
commit;
prompt Deleting QUALITY...
delete from QUALITY;
commit;
prompt Deleting PASSPORT...
delete from PASSPORT;
commit;
prompt Deleting OPERATION...
delete from OPERATION;
commit;
prompt Deleting MONITORPOINTINVIDEO...
delete from MONITORPOINTINVIDEO;
commit;
prompt Deleting MPASSIGNMENT...
delete from MPASSIGNMENT;
commit;
prompt Deleting TIMESCHEMA...
delete from TIMESCHEMA;
commit;
prompt Deleting ROAD...
delete from ROAD;
commit;
prompt Deleting PROJECT...
delete from PROJECT;
commit;
prompt Deleting MENU...
delete from MENU;
commit;
prompt Deleting LOG...
delete from LOG;
commit;
prompt Deleting EMPLOYEE...
delete from EMPLOYEE;
commit;
prompt Deleting ORGANIZATION...
delete from ORGANIZATION;
commit;
prompt Deleting GEO...
delete from GEO;
commit;
prompt Deleting EQUIPMENT...
delete from EQUIPMENT;
commit;
prompt Deleting ENUMERATION...
delete from ENUMERATION;
commit;
prompt Loading ENUMERATION...
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_mun_main_road', '_road_type_mun_main_road', '市政主道路', '_road_type', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_mun_normal_road', '_road_type_mun_normal_road', '市政道路', '_road_type', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_industry', '_road_typeindustry', '工业园区', '_road_type', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_comm_road', '_road_type_comm_road', '社区道路', '_road_type', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_triple_confuse', '_road_type_triple_confuse', '三乱作业', '_road_type', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_garden_road', '_road_type_garden_road', '园区道路', '_road_type', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_qc_state_valid', '_qc_state_valid', '有效', '_qc_state', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_qc_state_not_valid', '_qc_state_not_valid', '无效', '_qc_state', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_qc_type_normal', '_qc_type_normal', '常态监控', '_qc_type', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_qc_type_dynamic', '_qc_type_dynamic', '巡检', '_qc_type', null, null, null, null, null);
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('incumbency', 'incumbency', '在职', '_empstatus', null, to_date('09-08-2009', 'dd-mm-yyyy'), 'admin', to_date('09-08-2009', 'dd-mm-yyyy'), 'adimin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('dimission', 'dimission', '离职', '_empstatus', null, to_date('09-08-2009', 'dd-mm-yyyy'), 'admin', to_date('09-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('department', 'department', '部门', '_org', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('organization', 'organization', '机构', '_org', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('midschool', 'midschool', '中学', '_degree', null, to_date('09-08-2009', 'dd-mm-yyyy'), 'admin', to_date('09-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('highschool', 'highschool', '学士', '_degree', null, to_date('09-08-2009', 'dd-mm-yyyy'), 'admin', to_date('09-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('master', 'master', '硕士', '_degree', null, to_date('09-08-2009', 'dd-mm-yyyy'), 'admin', to_date('09-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('male', 'male', '男', '_sex', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('female', 'female', '女', '_sex', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('picture', 'picture', '图像', '_quality_data_type', null, to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('video', 'video', '视频', '_quality_data_type', null, to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('2', 'mp_emergency', '紧急', '_mp_importance', null, to_date('05-09-2009', 'dd-mm-yyyy'), 'admin', to_date('05-09-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('1', 'mp_critical', '关键', '_mp_importance', null, to_date('05-09-2009', 'dd-mm-yyyy'), 'admin', to_date('05-09-2009', 'dd-mm-yyyy'), 'admin');
insert into ENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('0', 'mp_normal', '普通', '_mp_importance', null, to_date('05-09-2009', 'dd-mm-yyyy'), 'admin', to_date('05-09-2009', 'dd-mm-yyyy'), 'admin');
commit;
prompt 24 records loaded
prompt Loading EQUIPMENT...
insert into EQUIPMENT (EQUID, EQUCODE, EQUNAME, IDENTIFY, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('t2', 'EQ0002', '设备2', '13252145785', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 'N', 't1', null);
insert into EQUIPMENT (EQUID, EQUCODE, EQUNAME, IDENTIFY, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('t3', 'EQ0003', '设备3', '15425123658', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 't1', 'N', 't1', null);
insert into EQUIPMENT (EQUID, EQUCODE, EQUNAME, IDENTIFY, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('t4', 'EQ0004', '设备4', '15425123652', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('25-08-2009', 'dd-mm-yyyy'), 't2', 'N', 't1', null);
insert into EQUIPMENT (EQUID, EQUCODE, EQUNAME, IDENTIFY, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('t5', 'EQ0005', '设备5', '15421547896', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 'N', 't1', null);
insert into EQUIPMENT (EQUID, EQUCODE, EQUNAME, IDENTIFY, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('t6', 'EQ0006', '设备6', '13021458789', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 'N', 't1', null);
insert into EQUIPMENT (EQUID, EQUCODE, EQUNAME, IDENTIFY, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('t7', 'EQ0007', '设备7', '13458452369', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 'N', 't1', null);
insert into EQUIPMENT (EQUID, EQUCODE, EQUNAME, IDENTIFY, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('t8', 'EQ0008', '设备8', '14574589652', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 'N', 't1', null);
insert into EQUIPMENT (EQUID, EQUCODE, EQUNAME, IDENTIFY, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('t9', 'EQ0009', '设备9', '16547845265', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 'N', 't1', null);
commit;
prompt 8 records loaded
prompt Loading GEO...
prompt Table is empty
prompt Loading ORGANIZATION...
insert into ORGANIZATION (ORGID, COUNTRY, CITY, PARENTORG, PROVINCE, ORGCODE, ORGNAME, ORGTYPE, ORGALIAS, ORGSTATUS, ORGADDRESS, ZIPCODE, CONTACT, CONTACTTEL, EMAIL, MEMO, CREATED, CREATEDBY, MODIFIEDBY, ISVOID, SUITEID, DATABASEID, MODIFIED, ORGANIZATIONID)
values ('t1', null, null, null, null, 'MAINTEST_ORG', '专用测试机构', 'organization', '测试机构', '正常', '重庆市沙坪坝区', '400044', '测试员', '13542154879', 'yinpsoft@gmail.com', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 'admin', 'N', null, null, to_date('14-08-2009', 'dd-mm-yyyy'), null);
insert into ORGANIZATION (ORGID, COUNTRY, CITY, PARENTORG, PROVINCE, ORGCODE, ORGNAME, ORGTYPE, ORGALIAS, ORGSTATUS, ORGADDRESS, ZIPCODE, CONTACT, CONTACTTEL, EMAIL, MEMO, CREATED, CREATEDBY, MODIFIEDBY, ISVOID, SUITEID, DATABASEID, MODIFIED, ORGANIZATIONID)
values ('t2', null, null, 't1', null, 'MAINTEST_DEPT', '专用测试部门', 'department', '测试部门', '正常', '重庆市沙坪坝区', '400044', '测试员', '13542154879', 'fishtrees@gmail.com', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 'admin', 'N', null, null, to_date('14-08-2009', 'dd-mm-yyyy'), 't1');
insert into ORGANIZATION (ORGID, COUNTRY, CITY, PARENTORG, PROVINCE, ORGCODE, ORGNAME, ORGTYPE, ORGALIAS, ORGSTATUS, ORGADDRESS, ZIPCODE, CONTACT, CONTACTTEL, EMAIL, MEMO, CREATED, CREATEDBY, MODIFIEDBY, ISVOID, SUITEID, DATABASEID, MODIFIED, ORGANIZATIONID)
values ('t3', null, null, 't1', null, 'MAINTEST_SUBORG', '测试分支机构', 'organization', '测试机构', '正常', '重庆市杨家坪', '400043', '测试员', '132456789', 'yul@126.com', null, to_date('15-08-2009', 'dd-mm-yyyy'), 'admin', 'admin', 'N', null, null, to_date('15-08-2009', 'dd-mm-yyyy'), 't1');
insert into ORGANIZATION (ORGID, COUNTRY, CITY, PARENTORG, PROVINCE, ORGCODE, ORGNAME, ORGTYPE, ORGALIAS, ORGSTATUS, ORGADDRESS, ZIPCODE, CONTACT, CONTACTTEL, EMAIL, MEMO, CREATED, CREATEDBY, MODIFIEDBY, ISVOID, SUITEID, DATABASEID, MODIFIED, ORGANIZATIONID)
values ('t4', null, null, 't2', null, 'MAINTEST_SUBDEPT', '测试分支部门', 'department', '测试部门', '正常', '重庆市九龙坡', '400021', '测试员', '423423423432', 'yin.p.soft@gmail.com', null, to_date('15-08-2009', 'dd-mm-yyyy'), 'admin', 'admin', 'N', null, null, to_date('15-08-2009', 'dd-mm-yyyy'), 't1');
commit;
prompt 4 records loaded
prompt Loading EMPLOYEE...
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('400', 't2', 't5', 'male', 'demo2', 'EM-633865768122968750', 'incumbency', '2342342', 'N', null, '45345', null, 'midschool', null, to_date('22-08-2009', 'dd-mm-yyyy'), 't2', 't2', to_date('22-08-2009 22:27:38', 'dd-mm-yyyy hh24:mi:ss'), 't1', null, 'Y');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('357', 't2', 't2', 'male', '超级用户', 'EM-633858074279843751', 'incumbency', '234324', 'N', 'admin', '23432', to_date('21-08-2009', 'dd-mm-yyyy'), 'midschool', null, to_date('30-08-2009', 'dd-mm-yyyy'), 'admin', 't2', to_date('30-08-2009 20:17:14', 'dd-mm-yyyy hh24:mi:ss'), 't1', null, 'Y');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('58', 't2', 't3', 'male', 'admin', 'EM-633853491247656250', 'incumbency', '34234243', 'N', 'asdf', '23432', null, 'midschool', null, to_date('13-08-2009', 'dd-mm-yyyy'), null, 't1', to_date('13-08-2009 23:53:12', 'dd-mm-yyyy hh24:mi:ss'), 't1', null, 'Y');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('59', 't2', 't4', 'male', 'admin', 'EM-633853491247656250', 'asdf', '34234243', null, 'asdf', '23432', null, 'midschool', null, to_date('08-08-2009', 'dd-mm-yyyy'), null, null, to_date('08-08-2009', 'dd-mm-yyyy'), 't1', null, 'Y');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('117', 't2', 't7', 'male', '蒲胤', 'EM-633853725689375000', 'incumbency', '435324523', 'N', 'ad', '234324', null, 'midschool', null, to_date('11-08-2009', 'dd-mm-yyyy'), 'devuser', 'devuser', to_date('11-08-2009', 'dd-mm-yyyy'), 't1', null, 'Y');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('144', 't2', 't2', 'male', '测试参照', 'EM-633854550213281250', 'incumbency', '32424', 'N', null, '24324223', null, 'midschool', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'devuser', 't1', to_date('14-08-2009 22:55:03', 'dd-mm-yyyy hh24:mi:ss'), 't1', null, 'N');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('65', 't2', 't9', 'male', 'admin', 'EM-633853498841562500', 'asdf', '324324', null, 'sdfs', '23432', null, 'midschool', null, to_date('08-08-2009', 'dd-mm-yyyy'), null, null, to_date('08-08-2009', 'dd-mm-yyyy'), 't1', null, 'Y');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('1', 't2', 't8', 'male', 'test1_modified', 'code0001', 'incumbency', null, 'N', null, null, to_date('11-08-2009', 'dd-mm-yyyy'), 'midschool', null, to_date('11-08-2009', 'dd-mm-yyyy'), 'devuser', 'devuser', to_date('11-08-2009', 'dd-mm-yyyy'), 't1', null, 'Y');
insert into EMPLOYEE (EMPID, DEPTID, EQUID, SEX, EMPNAME, EMPCODE, EMPSTATUS, MOBILE, ISVOID, JOBTITLE, CONTACTTEL, BIRTHDAY, DEGREE, MEMO, CREATED, CREATEDBY, MODIFIEDBY, MODIFIED, ORGANIZATIONID, SUITEID, ISEQUACTIVATE)
values ('356', 't2', 't6', 'male', 'testemployee', 'EM-633858074279843750', 'incumbency', '4352342342', 'N', null, '435324', null, 'midschool', null, to_date('14-08-2009', 'dd-mm-yyyy'), 't1', 't1', to_date('14-08-2009 00:45:12', 'dd-mm-yyyy hh24:mi:ss'), 't1', null, 'Y');
commit;
prompt 9 records loaded
prompt Loading LOG...
prompt Table is empty
prompt Loading MENU...
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_projectlist', '项目列表', '/Views/Project/ProjectList.aspx?p=projectlist', 'projectlist', null, '_qm', '14', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_exit', '退出', '/Views/Security/Login.aspx?status=q', '__pub__', null, '_app', '3', '_pub');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_app', '应用程序根', null, '_app', null, '_root', '0', '_pub');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_qm', '质量监控管理', null, 'qualitymonitor', null, '_app', '1', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_companyqualitymonitor', '环卫公司质量监控', '/Views/Quality/CompanyQualityMonitor.aspx?p=QualityCompanyQualityMonitor', 'QualityCompanyQualityMonitor', null, '_qm', '10', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_mam', '市政管理质量监控', '/Views/Quality/MunicipalAdminMonitor.aspx?p=QualityMunicipalAdminMonitor', 'QualityMunicipalAdminMonitor', null, '_qm', '11', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_som', '环卫监督质量监控', '/Views/Quality/SanitationOfficeMonitor.aspx?p=QualitySanitationOfficeMonitor', 'QualitySanitationOfficeMonitor', null, '_qm', '12', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_basedata', '基础数据管理', null, 'basedata', null, '_app', '2', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_dept', '组织机构管理', '/Views/Basedata/OrganizationList.aspx?p=OrganizationList', 'OrganizationList', null, '_basedata', '20', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_employeelist', '职员管理', '/Views/Basedata/EmployeeList.aspx?p=employeelist', 'employeelist', null, '_basedata', '21', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_equlist', '设备管理', '/Views/Basedata/EquipmentList.aspx?p=equlist', 'equlist', null, '_basedata', '22', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_rolelist', '角色管理', '/Views/Basedata/RoleList.aspx?p=rolelist', 'rolelist', null, '_basedata', '23', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_reslist', '资源管理', '/Views/Basedata/ResourceList.aspx?p=reslist', 'reslist', null, '_basedata', '24', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_operationlist', '操作管理', '/Views/Basedata/OperationList.aspx?p=operationlist', 'operationlist', null, '_basedata', '25', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_RoadList', '路段管理', '/Views/Road/RoadList.aspx?p=roadlist', 'roadlist', null, '_qm', '13', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_mplist', '监控点管理', '/Views/Quality/MonitorPointList.aspx?p=mplist', 'mplist', null, '_qm', '14', '_func');
insert into MENU (MENUID, TITLE, URL, RESOURCEKEY, MEMO, PARENTMENU, ITEMORDER, TYPE)
values ('_tslist', '监控时间段设置', '/Views/Quality/TimeSchemaList.aspx?p=timeschemalist', 'timeschemalist', null, '_qm', '15', '_func');
commit;
prompt 17 records loaded
prompt Loading PROJECT...
insert into PROJECT (PROJECTID, EMPID, PROJECTCODE, PROJECTNAME, TOTALWORKTIME, TOTALSCALE, ASSISTAMOUNT, LEADERAMOUNT, VISELEADERAMOUNT, TOTALWORKERAMOUNT, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID)
values ('A00001', '1', 'A00001', '海尔路', null, 206191.29, null, null, null, null, null, to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', 't1', null, null);
commit;
prompt 1 records loaded
prompt Loading ROAD...
insert into ROAD (ROADID, PROJECTID, ROADCODE, ROADNAME, ROADTYPE, BEGINTIME, ENDTIME, WORKTIME, WORKERAMOUNT, MEMO, AVGWORKERAMOUNT, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('A00001', 'A00001', 'A00001', '海尔路干道', '_city_main_road', null, null, null, null, null, null, null, null, null, null, 'N', 't1', null);
insert into ROAD (ROADID, PROJECTID, ROADCODE, ROADNAME, ROADTYPE, BEGINTIME, ENDTIME, WORKTIME, WORKERAMOUNT, MEMO, AVGWORKERAMOUNT, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('A00002', 'A00001', 'A00002', '金渝路', '_city_road', null, null, null, null, null, null, null, null, null, null, 'N', 't1', null);
insert into ROAD (ROADID, PROJECTID, ROADCODE, ROADNAME, ROADTYPE, BEGINTIME, ENDTIME, WORKTIME, WORKERAMOUNT, MEMO, AVGWORKERAMOUNT, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('A00003', 'A00001', 'A00003', '行政中心周边', '_city_road', null, null, null, null, null, null, null, null, null, null, 'N', 't1', null);
insert into ROAD (ROADID, PROJECTID, ROADCODE, ROADNAME, ROADTYPE, BEGINTIME, ENDTIME, WORKTIME, WORKERAMOUNT, MEMO, AVGWORKERAMOUNT, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('A00004', 'A00002', 'A00004', '港城A区', '_industry_region', null, null, null, null, null, null, null, null, null, null, 'N', 't1', null);
insert into ROAD (ROADID, PROJECTID, ROADCODE, ROADNAME, ROADTYPE, BEGINTIME, ENDTIME, WORKTIME, WORKERAMOUNT, MEMO, AVGWORKERAMOUNT, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('A00005', 'A00002', 'A00005', '港城D区', '_industry_region', null, null, null, null, null, null, null, null, null, null, 'N', 't1', null);
insert into ROAD (ROADID, PROJECTID, ROADCODE, ROADNAME, ROADTYPE, BEGINTIME, ENDTIME, WORKTIME, WORKERAMOUNT, MEMO, AVGWORKERAMOUNT, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('A00006', 'A00003', 'A00006', '海关', '_community_road', null, null, null, null, null, null, null, null, null, null, 'N', 't1', null);
insert into ROAD (ROADID, PROJECTID, ROADCODE, ROADNAME, ROADTYPE, BEGINTIME, ENDTIME, WORKTIME, WORKERAMOUNT, MEMO, AVGWORKERAMOUNT, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, SUITEID)
values ('A00007', 'A00003', 'A00007', '塔坪', '_community_road', null, null, null, null, null, null, null, null, null, null, 'N', 't1', null);
commit;
prompt 7 records loaded
prompt Loading TIMESCHEMA...
prompt Table is empty
prompt Loading MPASSIGNMENT...
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1098', 'A00001', null, 'A1098', '海尔路监控点A101', 106.60284098205601, 29.6263526343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1099', 'A00001', null, 'A1099', '海尔路监控点A102', 106.60223098205601, 29.6257926343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1100', 'A00001', null, 'A1100', '海尔路监控点A103', 106.60701098205601, 29.6226826343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A00001', 'A00001', null, 'A00001', '海尔路主干道监控点1', 106.599740982056, 29.6218926343159, null, to_date('09-08-2009', 'dd-mm-yyyy'), null, null, null, null, null, null, 14, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A00002', 'A00001', null, 'A00002', '海尔路主干道监控点2', 106.650810241699, 29.6006256449822, null, to_date('09-08-2009', 'dd-mm-yyyy'), null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1000', 'A00001', null, 'A1000', '海尔路监控点A3', 106.60361098205601, 29.6220326343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1001', 'A00001', null, 'A1001', '海尔路监控点A4', 106.60631098205601, 29.6247326343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1002', 'A00001', null, 'A1002', '海尔路监控点A5', 106.60958098205601, 29.6318426343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1003', 'A00001', null, 'A1003', '海尔路监控点A6', 106.60932098205601, 29.6265626343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1004', 'A00001', null, 'A1004', '海尔路监控点A7', 106.60133098205601, 29.6251126343159, 'dasdfdasf', null, null, to_date('01-09-2009', 'dd-mm-yyyy'), 't2', 't1', null, 'N', 16, 5, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1005', 'A00001', null, 'A1005', '海尔路监控点A8', 106.60324098205601, 29.6282826343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1006', 'A00001', null, 'A1006', '海尔路监控点A9', 106.60020098205601, 29.6264926343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1007', 'A00001', null, 'A1007', '海尔路监控点A10', 106.60828098205601, 29.6315026343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1008', 'A00001', null, 'A1008', '海尔路监控点A11', 106.60009098205601, 29.6290026343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1009', 'A00001', null, 'A1009', '海尔路监控点A12', 106.60533098205601, 29.6236526343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1010', 'A00001', null, 'A1010', '海尔路监控点A13', 106.60130098205601, 29.6226426343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1011', 'A00001', null, 'A1011', '海尔路监控点A14', 106.60157098205601, 29.6262726343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1012', 'A00001', null, 'A1012', '海尔路监控点A15', 106.60702098205601, 29.6290626343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1013', 'A00001', null, 'A1013', '海尔路监控点A16', 106.60025098205601, 29.6242226343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1014', 'A00001', null, 'A1014', '海尔路监控点A17', 106.60557098205601, 29.6251626343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1015', 'A00001', null, 'A1015', '海尔路监控点A18', 106.60427098205601, 29.6260226343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1016', 'A00001', null, 'A1016', '海尔路监控点A19', 106.60497098205601, 29.6312426343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1017', 'A00001', null, 'A1017', '海尔路监控点A20', 106.60790098205601, 29.6232526343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1018', 'A00001', null, 'A1018', '海尔路监控点A21', 106.60216098205601, 29.6248326343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1019', 'A00001', null, 'A1019', '海尔路监控点A22', 106.60358098205601, 29.6242726343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1020', 'A00001', null, 'A1020', '海尔路监控点A23', 106.60553098205601, 29.6314626343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1021', 'A00001', null, 'A1021', '海尔路监控点A24', 106.60910098205601, 29.6254926343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1022', 'A00001', null, 'A1022', '海尔路监控点A25', 106.60608098205601, 29.6249826343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1023', 'A00001', null, 'A1023', '海尔路监控点A26', 106.60914098205601, 29.6312026343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1024', 'A00001', null, 'A1024', '海尔路监控点A27', 106.60182098205601, 29.6314626343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1025', 'A00001', null, 'A1025', '海尔路监控点A28', 106.60908098205601, 29.6248926343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1026', 'A00001', null, 'A1026', '海尔路监控点A29', 106.60080098205601, 29.6301926343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1027', 'A00001', null, 'A1027', '海尔路监控点A30', 106.60057098205601, 29.6234726343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1028', 'A00001', null, 'A1028', '海尔路监控点A31', 106.60844098205601, 29.6249626343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1029', 'A00001', null, 'A1029', '海尔路监控点A32', 106.60290098205601, 29.6223126343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1030', 'A00001', null, 'A1030', '海尔路监控点A33', 106.60206098205601, 29.6226926343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1031', 'A00001', null, 'A1031', '海尔路监控点A34', 106.60364098205601, 29.6234326343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1032', 'A00001', null, 'A1032', '海尔路监控点A35', 106.60102098205601, 29.6247326343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1033', 'A00001', null, 'A1033', '海尔路监控点A36', 106.60868098205601, 29.6267226343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1034', 'A00001', null, 'A1034', '海尔路监控点A37', 106.60899098205601, 29.6264026343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1035', 'A00001', null, 'A1035', '海尔路监控点A38', 106.60955098205601, 29.6230726343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1036', 'A00001', null, 'A1036', '海尔路监控点A39', 106.60862098205601, 29.6222226343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1037', 'A00001', null, 'A1037', '海尔路监控点A40', 106.60238098205601, 29.6234326343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1038', 'A00001', null, 'A1038', '海尔路监控点A41', 106.60128098205601, 29.6233126343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1039', 'A00001', null, 'A1039', '海尔路监控点A42', 106.60861098205601, 29.6308026343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1040', 'A00001', null, 'A1040', '海尔路监控点A43', 106.60860098205601, 29.6290126343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1041', 'A00001', null, 'A1041', '海尔路监控点A44', 106.60483098205601, 29.6285126343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1042', 'A00001', null, 'A1042', '海尔路监控点A45', 106.60876098205601, 29.6314726343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1043', 'A00001', null, 'A1043', '海尔路监控点A46', 106.60569098205601, 29.6246826343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1044', 'A00001', null, 'A1044', '海尔路监控点A47', 106.60505098205601, 29.6318426343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1045', 'A00001', null, 'A1045', '海尔路监控点A48', 106.60836098205601, 29.6233826343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1046', 'A00001', null, 'A1046', '海尔路监控点A49', 106.60706098205601, 29.6282626343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1047', 'A00001', null, 'A1047', '海尔路监控点A50', 106.60294098205601, 29.6306326343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1048', 'A00001', null, 'A1048', '海尔路监控点A51', 106.60745098205601, 29.6313026343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1049', 'A00001', null, 'A1049', '海尔路监控点A52', 106.60480098205601, 29.6300826343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1050', 'A00001', null, 'A1050', '海尔路监控点A53', 106.60376098205601, 29.6254726343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1051', 'A00001', null, 'A1051', '海尔路监控点A54', 106.60632098205601, 29.6291626343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1052', 'A00001', null, 'A1052', '海尔路监控点A55', 106.60781098205601, 29.6274226343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1053', 'A00001', null, 'A1053', '海尔路监控点A56', 106.60934098205601, 29.6250826343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1054', 'A00001', null, 'A1054', '海尔路监控点A57', 106.60890098205601, 29.6279026343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1055', 'A00001', null, 'A1055', '海尔路监控点A58', 106.60346098205601, 29.6303426343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1056', 'A00001', null, 'A1056', '海尔路监控点A59', 106.60003098205601, 29.6308126343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1057', 'A00001', null, 'A1057', '海尔路监控点A60', 106.60364098205601, 29.6303026343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1058', 'A00001', null, 'A1058', '海尔路监控点A61', 106.60759098205601, 29.6267526343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1059', 'A00001', null, 'A1059', '海尔路监控点A62', 106.60606098205601, 29.6263126343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1060', 'A00001', null, 'A1060', '海尔路监控点A63', 106.60958098205601, 29.6317726343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1061', 'A00001', null, 'A1061', '海尔路监控点A64', 106.60414098205601, 29.6286926343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1062', 'A00001', null, 'A1062', '海尔路监控点A65', 106.60319098205601, 29.6219726343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1063', 'A00001', null, 'A1063', '海尔路监控点A66', 106.60649098205601, 29.6249826343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1064', 'A00001', null, 'A1064', '海尔路监控点A67', 106.60299098205601, 29.6295326343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1065', 'A00001', null, 'A1065', '海尔路监控点A68', 106.60121098205601, 29.6308026343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1066', 'A00001', null, 'A1066', '海尔路监控点A69', 106.60943098205601, 29.6258926343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1067', 'A00001', null, 'A1067', '海尔路监控点A70', 106.60357098205601, 29.6306526343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1068', 'A00001', null, 'A1068', '海尔路监控点A71', 106.60280098205601, 29.6314426343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1069', 'A00001', null, 'A1069', '海尔路监控点A72', 106.59979098205601, 29.6238526343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1070', 'A00001', null, 'A1070', '海尔路监控点A73', 106.60450098205601, 29.6285126343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1071', 'A00001', null, 'A1071', '海尔路监控点A74', 106.60518098205601, 29.6250926343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1072', 'A00001', null, 'A1072', '海尔路监控点A75', 106.60930098205601, 29.6227626343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1073', 'A00001', null, 'A1073', '海尔路监控点A76', 106.60500098205601, 29.6236426343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1074', 'A00001', null, 'A1074', '海尔路监控点A77', 106.60189098205601, 29.6289126343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1075', 'A00001', null, 'A1075', '海尔路监控点A78', 106.60255098205601, 29.6252526343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1076', 'A00001', null, 'A1076', '海尔路监控点A79', 106.60761098205601, 29.6308126343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1077', 'A00001', null, 'A1077', '海尔路监控点A80', 106.60272098205601, 29.6277026343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1078', 'A00001', null, 'A1078', '海尔路监控点A81', 106.60039098205601, 29.6228926343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1079', 'A00001', null, 'A1079', '海尔路监控点A82', 106.60411098205601, 29.6250326343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1080', 'A00001', null, 'A1080', '海尔路监控点A83', 106.60536098205601, 29.6270526343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1081', 'A00001', null, 'A1081', '海尔路监控点A84', 106.60823098205601, 29.6302326343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1082', 'A00001', null, 'A1082', '海尔路监控点A85', 106.60591098205601, 29.6288926343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1083', 'A00001', null, 'A1083', '海尔路监控点A86', 106.60776098205601, 29.6284726343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1084', 'A00001', null, 'A1084', '海尔路监控点A87', 106.60362098205601, 29.6287726343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1085', 'A00001', null, 'A1085', '海尔路监控点A88', 106.60445098205601, 29.6244326343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1086', 'A00001', null, 'A1086', '海尔路监控点A89', 106.60500098205601, 29.6257526343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1087', 'A00001', null, 'A1087', '海尔路监控点A90', 106.60547098205601, 29.6274926343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1088', 'A00001', null, 'A1088', '海尔路监控点A91', 106.60181098205601, 29.6248226343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1089', 'A00001', null, 'A1089', '海尔路监控点A92', 106.60316098205601, 29.6275026343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1090', 'A00001', null, 'A1090', '海尔路监控点A93', 106.60648098205601, 29.6296726343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1091', 'A00001', null, 'A1091', '海尔路监控点A94', 106.60966098205601, 29.6223226343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1092', 'A00001', null, 'A1092', '海尔路监控点A95', 106.60312098205601, 29.6265426343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1093', 'A00001', null, 'A1093', '海尔路监控点A96', 106.60322098205601, 29.6239326343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1094', 'A00001', null, 'A1094', '海尔路监控点A97', 106.60516098205601, 29.6257526343159, null, null, null, null, null, null, null, null, 16, null, null);
commit;
prompt 100 records committed...
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1095', 'A00001', null, 'A1095', '海尔路监控点A98', 106.60152098205601, 29.6278226343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1096', 'A00001', null, 'A1096', '海尔路监控点A99', 106.60592098205601, 29.6296826343159, null, null, null, null, null, null, null, null, 16, null, null);
insert into MPASSIGNMENT (MPID, ROADID, SCHEMAID, MPCODE, MPNAME, LONGITUDE, LATITUDE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID, ISVOID, MPLEVEL, FLOATDIST, IMPORTANCE)
values ('A1097', 'A00001', null, 'A1097', '海尔路监控点A100', 106.60660098205601, 29.6299226343159, null, null, null, null, null, null, null, null, 16, null, null);
commit;
prompt 103 records loaded
prompt Loading MONITORPOINTINVIDEO...
insert into MONITORPOINTINVIDEO (VIDEOID, MPID)
values ('A00001', 'A00001');
commit;
prompt 1 records loaded
prompt Loading OPERATION...
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('saveandnew', 'OP0005', '保存并新增', null, to_date('17-08-2009', 'dd-mm-yyyy'), 'admin', to_date('17-08-2009', 'dd-mm-yyyy'), 't1', 'N', 't1', 2, 'editandnew');
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('test', 'test', 'test', null, null, null, null, 't1', 'Y', 't1', 5, 'test');
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('1', 'OP0001', '导入', null, null, null, null, null, 'Y', 't1', null, null);
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('19', 'OP-633853714211406250', 'sdfasdf', 'asdfasdf', to_date('08-08-2009', 'dd-mm-yyyy'), null, to_date('08-08-2009', 'dd-mm-yyyy'), null, 'Y', 't1', null, null);
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('14', 'OP-633853713052812500', 'hhhh', 'fdsfsd', to_date('08-08-2009', 'dd-mm-yyyy'), null, to_date('08-08-2009', 'dd-mm-yyyy'), null, 'Y', 't1', null, null);
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('17', 'OP-633853713052812500', 'dfsdfds', 'dasfsdf', to_date('08-08-2009', 'dd-mm-yyyy'), null, to_date('08-08-2009', 'dd-mm-yyyy'), null, 'Y', 't1', null, null);
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('61', 'OP-633858014620625000', '操作测试', '载顶戴要塔顶塔顶塔顶地', to_date('13-08-2009', 'dd-mm-yyyy'), 't1', to_date('13-08-2009', 'dd-mm-yyyy'), 't1', 'Y', 't1', null, null);
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('create', 'OP0001', '新增', null, to_date('10-08-2009', 'dd-mm-yyyy'), 'admin', to_date('10-08-2009', 'dd-mm-yyyy'), 'admin', 'N', 't1', 0, 'create');
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('delete', 'OP0002', '删除', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 'N', 't1', 4, 'delete');
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('edit', 'OP0003', '保存', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 'N', 't1', 1, 'edit');
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('view', 'OP0004', '浏览', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 'N', 't1', 2, 'view');
insert into OPERATION (OPID, OPCODE, OPNAME, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ISVOID, ORGANIZATIONID, OPORDER, OPIDENTITY)
values ('default', 'default', '默认', null, to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', to_date('16-08-2009', 'dd-mm-yyyy'), 't1', 'N', 't1', -1, 'default');
commit;
prompt 12 records loaded
prompt Loading PASSPORT...
insert into PASSPORT (PASSPORTID, EMPID, PASSPORTCODE, PASSPORT, PASSWORD, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('40', '400', 'PA-633865768582656250', 'demoadmin', 'admin', 'N', null, to_date('22-08-2009', 'dd-mm-yyyy'), 'demo', to_date('22-08-2009', 'dd-mm-yyyy'), 'demo', 't1', null);
insert into PASSPORT (PASSPORTID, EMPID, PASSPORTCODE, PASSPORT, PASSWORD, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('t2', '357', 'P0002', 'demo', 'demo', 'N', null, to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', 't1', null);
insert into PASSPORT (PASSPORTID, EMPID, PASSPORTCODE, PASSPORT, PASSWORD, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('t1', '1', 'P0001', 'admin', 'admin', 'N', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 't1', null);
commit;
prompt 3 records loaded
prompt Loading QUALITY...
insert into QUALITY (MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, MATERIAL, LONGITUDE, LATITUDE, TYPE, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values (null, to_date('09-08-2009', 'dd-mm-yyyy'), null, to_date('09-08-2009', 'dd-mm-yyyy'), null, 'A00001', '1', 't1', '_qc_state_valid', 'A00001', '1', 'A00001', null, 'http://images.beijing-2008.org/20070412/Img214033995.jpg', 106.59974098205601, 29.6006256449822, '_qc_type_normal', 't1', null, null, 6, null, null);
insert into QUALITY (MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, MATERIAL, LONGITUDE, LATITUDE, TYPE, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values (null, to_date('10-08-2009', 'dd-mm-yyyy'), null, to_date('10-08-2009', 'dd-mm-yyyy'), null, 'A00002', '1', 't1', '_qc_state_valid', 'A00001', '1', 'A00002', '1', 'http://www.dreams-travel.com/pic/Three%20Gorges/重庆夜景2.jpg', 106.59974098205601, 29.6006256449822, '_qc_type_dynamic', 't1', null, null, null, null, null);
insert into QUALITY (MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, QMID, CHARGEPERSON, WORKUNIT, STATUS, MPID, EMERGENCYPERSON, QMCODE, CHECKPERSON, MATERIAL, LONGITUDE, LATITUDE, TYPE, ORGANIZATIONID, SUITEID, ISVOID, QUALITYLEVEL, IMAGEURL, VIDEOURL)
values (null, to_date('10-08-2009', 'dd-mm-yyyy'), null, to_date('10-08-2009', 'dd-mm-yyyy'), null, 'A00003', '1', 't1', '_qc_state_valid', 'A00001', '1', 'A00003', null, 'http://upload.17u.com/uploadfile/2005/09/22/3/2005092216050981398.jpg', 106.59974098205601, 29.6006256449822, '_qc_type_normal', 't1', null, null, null, null, null);
commit;
prompt 3 records loaded
prompt Loading RESOURCEITEM...
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('projectnew', 'RES00030', 'projectnew', '/Views/Project/ProjectEdit.aspx', '项目新增', '项目管理', '/Project', 'N', null, to_date('23-08-2009', 'dd-mm-yyyy'), 'admin', to_date('23-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('projectview', 'res_projectview', 'projectview', '/Views/Project/ProjectView.aspx', '项目浏览', '项目管理', '/Project', 'N', null, to_date('25-08-2009', 'dd-mm-yyyy'), 'admin', to_date('25-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('roadview', 'res_roadview', 'roadview', '/Views/Road/RoadView.aspx', '路段浏览', '路段管理', '/Road', 'N', null, to_date('25-08-2009', 'dd-mm-yyyy'), 'admin', to_date('25-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('mpedit', 'RES_mpedit', 'mpedit', '/Views/Quality/MonitorPointEdit.aspx', '监控点编辑', '监控点管理', '/Quality', 'N', null, to_date('31-08-2009', 'dd-mm-yyyy'), 'admin', to_date('31-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('mpnew', 'RES_mpnew', 'mpnew', '/Views/Quality/MonitorPointEdit.aspx', '监控点新增', '监控点管理', '/Quality', 'N', null, to_date('31-08-2009', 'dd-mm-yyyy'), 'admin', to_date('31-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('mpview', 'RES_mpview', 'mpview', '/Views/Quality/MonitorPointView.aspx', '监控点浏览', '监控点管理', '/Quality', 'N', null, to_date('31-08-2009', 'dd-mm-yyyy'), 'admin', to_date('31-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('mplist', 'RES_mplist', 'mplist', '/Views/Quality/MonitorPointList.aspx', '监控点列表', '监控点管理', '/Quality', 'N', null, to_date('31-08-2009', 'dd-mm-yyyy'), 'admin', to_date('31-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('projectlist', 'RES00028', 'projectlist', '/Views/Project/ProjectList.aspx', '项目列表', '项目管理', '/Project', 'N', null, to_date('23-08-2009', 'dd-mm-yyyy'), 'admin', to_date('23-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('projectedit', 'RES00029', 'projectedit', '/Views/Project/ProjectEdit.aspx', '项目编辑', '项目管理', '/Project', 'N', null, to_date('23-08-2009', 'dd-mm-yyyy'), 'admin', to_date('23-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t24', 'RES00028', 'OrganizationView', '/Views/Basedata/OrganizationView.aspx', '组织浏览', '组织管理', '/Basedata', 'N', null, to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t25', 'RES00029', 'OrganizationEdit', '/Views/Basedata/OrganizationEdit.aspx', '组织编辑', '组织管理', '/Basedata', 'N', null, to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t26', 'RES00030', 'OrganizationList', '/Views/Basedata/OrganizationList.aspx', '组织列表', '组织管理', '/Basedata', 'N', null, to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t27', 'RES00031', 'OrganizationNew', '/Views/Basedata/OrganizationEdit.aspx', '组织新增', '组织管理', '/Basedata', 'N', null, to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('AjaxVideo', 'RES00025', 'AjaxServicesQualityControlVideo', '/Views/AjaxServices/QualityControl/Video.aspx', '视频AJAX服务', '质量监控', '/AjaxServices/QualityControl', 'N', null, to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('MunicipalAdminMonitor', 'RES0016', 'QualityMunicipalAdminMonitor', '/Views/Quality/MunicipalAdminMonitor.aspx', '市政管理质量监控', '质量监控', '/Quality', 'N', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('SanitationOfficeMonitor', 'RES0017', 'QualitySanitationOfficeMonitor', '/Views/Quality/SanitationOfficeMonitor.aspx', '环卫监督质量监控', '质量监控', '/Quality', 'N', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('CompanyQualityMonitor', 'RES0003', 'QualityCompanyQualityMonitor', '/Views/Quality/CompanyQualityMonitor.aspx', '环卫公司质量监控', '质量监控', '/Quality', 'N', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('MonitorPoint', 'RES0005', 'AjaxServicesQualityControlMonitorPoint', '/Views/AjaxServices/QualityControl/MonitorPoint.aspx', '监控点AJAX服务', '质量监控', '/AjaxServices/QualityControl', 'N', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('QualityMonitorPointMap', 'RES0004', 'QualityQualityMonitorPointMap', '/Views/Quality/QualityMonitorPointMap.aspx', '监控点地图窗口', '质量监控', '/Quality', 'N', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('MonitorPointDetail', 'RES0006', 'QualityMonitorPointDetail', '/Views/Quality/MonitorPointDetail.aspx', '监控点详细信息浏览', '质量监控', '/Quality', 'N', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('RoadEdit', 'RES00026', 'roadedit', '/Views/Road/RoadEdit.aspx', '路段编辑', '路段管理', '/Road', 'N', null, to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('RoadList', 'RES0018', 'roadlist', '/Views/Road/RoadList.aspx', '路段列表', '路段管理', '/Road', 'N', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t3', 'RES0005', 'operationedit', '/Views/Basedata/OperationEdit.aspx', '操作编辑', '操作管理', '/Basedata', 'N', null, to_date('08-08-2009', 'dd-mm-yyyy'), 'admin', to_date('08-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t4', 'RES0006', 'operationview', '/Views/Basedata/OperationView.aspx', '操作浏览', '操作管理', '/Basedata', 'N', null, to_date('08-08-2009', 'dd-mm-yyyy'), 'admin', to_date('08-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t5', 'RES0007', 'employeelist', '/Views/Basedata/EmployeeList.aspx', '职员列表', '职员管理', '/Basedata', 'N', null, to_date('08-08-2009', 'dd-mm-yyyy'), 'admin', to_date('08-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t15', 'RES00016', 'equnew', '/Views/Basedata/EquipmentEdit.aspx', '设备新增', '设备管理', '/Basedata', 'N', null, to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t16', 'RES00017', 'equedit', '/Views/Basedata/EquipmentEdit.aspx', '设备编辑', '设备管理', '/Basedata', 'N', null, to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009 15:29:55', 'dd-mm-yyyy hh24:mi:ss'), 't1', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t17', 'RES00018', 'equview', '/Views/Basedata/EquipmentView.aspx', '设备浏览', '设备管理', '/Basedata', 'N', null, to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t18', 'RES00019', 'equlist', '/Views/Basedata/EquipmentList.aspx', '设备列表', '设备管理', '/Basedata', 'N', null, to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('15-08-2009 16:04:01', 'dd-mm-yyyy hh24:mi:ss'), 't1', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t19', 'RES00020', 'resnew', '/Views/Basedata/ResourceEdit.aspx', '资源新增', '资源管理', '/Basedata', 'N', null, to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t20', 'RES00021', 'resedit', '/Views/Basedata/ResourceEdit.aspx', '资源编辑', '资源管理', '/Basedata', 'N', null, to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t21', 'RES00022', 'resview', '/Views/Basedata/ResourceView.aspx', '资源浏览', '资源管理', '/Basedata', 'N', null, to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t22', 'RES00023', 'reslist', '/Views/Basedata/ResourceList.aspx', '资源列表', '资源管理', '/Basedata', 'N', null, to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t6', 'RES0008', 'companyqualitymonitor', '/Views/Quality/CompanyQualityMonitor.aspx', '质量监控', '质量监控', '/Quality', 'N', null, to_date('10-08-2009', 'dd-mm-yyyy'), 'admin', to_date('10-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t7', 'RES0009', 'operationlist', '/Views/Basedata/OperationList.aspx', '操作列表', '操作管理', '/Basedata', 'N', null, to_date('10-08-2009', 'dd-mm-yyyy'), 'admin', to_date('10-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t8', 'RES0010', 'employeenew', '/Views/Basedata/EmployeeEdit.aspx', '职员新增', '职员管理', '/Basedata', 'N', null, to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t9', 'RES00012', 'rolelist', '/Views/Basedata/RoleList.aspx', '角色列表', '角色管理', '/Basedata', 'N', null, to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t12', 'RES13', 'roleedit', '/Views/Basedata/RoleEdit.aspx', '角色编辑', '角色管理', '/Basedata', 'N', null, to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t13', 'RES00014', 'rolenew', '/Views/Basedata/RoleEdit.aspx', '角色新增', '角色管理', '/Basedata', 'N', null, to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t14', 'RES00015', 'roleview', '/Views/Basedata/RoleView.aspx', '角色浏览', '角色管理', '/Basedata', 'N', null, to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', to_date('11-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t10', 'RES0001', 'employeeedit', '/Views/Basedata/EmployeeEdit.aspx', '职员编辑', '职员管理', '/Basedata', 'N', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t11', 'RES0002', 'employeeview', '/Views/Basedata/EmployeeView.aspx', '职员浏览', '职员管理', '/Basedata', 'N', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('t23', 'RES00024', 'operationnew', '/Views/Basedata/OperationEdit.aspx', '操作新增', '操作管理', '/Basedata', 'N', null, to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('RoadNew', 'RES00027', 'roadnew', '/Views/Road/RoadEdit.aspx', '路段新增', '路段管理', '/Road', 'N', null, to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', to_date('12-08-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('qualityappraisal', 'res_qualityappraisal', 'qualityappraisal', '/Views/Quality/QualityAppraisal.aspx', '质量评估', '质量监控', '/Quality', 'N', null, to_date('04-09-2009', 'dd-mm-yyyy'), 'admin', to_date('04-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('qualityappraisallist', 'res_qualityappraisallist', 'qalist', '/Views/Quality/QualityAppraisalList.aspx', '质量评估列表', '质量监控', '/Quality', 'N', null, to_date('04-09-2009', 'dd-mm-yyyy'), 'admin', to_date('04-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('timeschemanew', 'res_timeschemanew', 'timeschemanew', '/Views/Quality/TimeSchemaEdit.aspx', '时间段设置新增', '质量监控', '/Quality', 'N', null, to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('timeschemaedit', 'res_timeschemaedit', 'timeschemaedit', '/Views/Quality/TimeSchemaEdit.aspx', '时间段设置编辑', '质量监控', '/Quality', 'N', null, to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('timeschemalist', 'res_timeschemalist', 'timeschemalist', '/Views/Quality/TimeSchemaList.aspx', '时间段设置列表', '质量监控', '/Quality', 'N', null, to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
insert into RESOURCEITEM (RESID, RESCODE, RESIDENTITY, VIEWNAME, RESNAME, RESTYPE, LOCATION, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID)
values ('timeschemaview', 'res_timeschemaview', 'timeschemaview', '/Views/Quality/TimeSchemaView.aspx', '时间段设置浏览', '质量监控', '/Quality', 'N', null, to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', to_date('06-09-2009', 'dd-mm-yyyy'), 'admin', 't1');
commit;
prompt 50 records loaded
prompt Loading ROLE...
insert into ROLE (ROLEID, ROLECODE, ROLENAME, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('t4', 'R0003', '演示角色', 'N', '系统演示使用角色', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009 10:51:52', 'dd-mm-yyyy hh24:mi:ss'), 't2', 't1', null);
insert into ROLE (ROLEID, ROLECODE, ROLENAME, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('150', 'test', 'test', 'N', 'asdfasdfasdf', null, null, null, null, 't1', null);
insert into ROLE (ROLEID, ROLECODE, ROLENAME, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('t1', 'R0001', '角色一', 'N', '处理角色一的事务', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('15-08-2009 22:09:45', 'dd-mm-yyyy hh24:mi:ss'), 't1', 't1', null);
insert into ROLE (ROLEID, ROLECODE, ROLENAME, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('t2', 'R0002', '角色二', 'N', '处理角色二的事务', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1', null);
insert into ROLE (ROLEID, ROLECODE, ROLENAME, ISVOID, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, ORGANIZATIONID, SUITEID)
values ('t3', 'R0003', '角色三', 'N', '处理角色三的事务', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', 't1', null);
commit;
prompt 5 records loaded
prompt Loading RESPERMISSION...
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
commit;
prompt 100 records committed...
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
commit;
prompt 200 records committed...
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
commit;
prompt 300 records committed...
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
commit;
prompt 341 records loaded
prompt Loading TIME...
prompt Table is empty
prompt Loading TIMEITEM...
prompt Table is empty
prompt Loading USERROLE...
insert into USERROLE (ROLEID, PASSPORTID, ORGANIZATIONID)
values ('t1', '40', 't1');
insert into USERROLE (ROLEID, PASSPORTID, ORGANIZATIONID)
values ('t1', 't1', 't1');
insert into USERROLE (ROLEID, PASSPORTID, ORGANIZATIONID)
values ('t2', '40', 't1');
insert into USERROLE (ROLEID, PASSPORTID, ORGANIZATIONID)
values ('t2', 't1', 't1');
insert into USERROLE (ROLEID, PASSPORTID, ORGANIZATIONID)
values ('t4', '40', 't1');
insert into USERROLE (ROLEID, PASSPORTID, ORGANIZATIONID)
values ('t4', 't2', 't1');
commit;
prompt 6 records loaded
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
prompt Enabling foreign key constraints for PROJECT...
alter table PROJECT enable constraint FK_PROJECT_REFERENCE_EMPLOYEE;
prompt Enabling foreign key constraints for MPASSIGNMENT...
alter table MPASSIGNMENT enable constraint FK_MPASSIGN_REFERENCE_TIMESCHE;
alter table MPASSIGNMENT enable constraint FK_MPASSIGN_RELATIONS_ROAD;
prompt Enabling foreign key constraints for MONITORPOINTINVIDEO...
alter table MONITORPOINTINVIDEO enable constraint FK_MONITORP_REFERENCE_MPASSIGN;
prompt Enabling foreign key constraints for PASSPORT...
alter table PASSPORT enable constraint FK_PASSPORT_EMPPASSPO_EMPLOYEE;
prompt Enabling foreign key constraints for QUALITY...
alter table QUALITY enable constraint FK_QUALITY_RELATIONS_ENUMERAT;
alter table QUALITY enable constraint FK_QUALITY_RELATIONS_MPASSIGN;
alter table QUALITY enable constraint FK_QUALITY_RELCHARGE_EMPLOYEE;
alter table QUALITY enable constraint FK_QUALITY_RELEMERGE_EMPLOYEE;
alter table QUALITY enable constraint FK_QUALITY_RELEMPLOY_EMPLOYEE;
alter table QUALITY enable constraint FK_QUALITY_RELWORKUN_ORGANIZA;
prompt Enabling foreign key constraints for RESPERMISSION...
alter table RESPERMISSION enable constraint FK_RESPERMI_REFERENCE_OPERATIO;
alter table RESPERMISSION enable constraint FK_RESPERMI_REFERENCE_RESOURCE;
alter table RESPERMISSION enable constraint FK_RESPERMI_REFERENCE_ROLE;
prompt Enabling foreign key constraints for TIMEITEM...
alter table TIMEITEM enable constraint FK_TIMEITEM_REFERENCE_TIME;
alter table TIMEITEM enable constraint FK_TIMEITEM_REFERENCE_TIMESCHE;
prompt Enabling foreign key constraints for USERROLE...
alter table USERROLE enable constraint FK_USERROLE_USERROLE2_PASSPORT;
alter table USERROLE enable constraint FK_USERROLE_USERROLE_ROLE;
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
prompt Enabling triggers for LOG...
alter table LOG enable all triggers;
prompt Enabling triggers for MENU...
alter table MENU enable all triggers;
prompt Enabling triggers for PROJECT...
alter table PROJECT enable all triggers;
prompt Enabling triggers for ROAD...
alter table ROAD enable all triggers;
prompt Enabling triggers for TIMESCHEMA...
alter table TIMESCHEMA enable all triggers;
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
prompt Enabling triggers for TIME...
alter table TIME enable all triggers;
prompt Enabling triggers for TIMEITEM...
alter table TIMEITEM enable all triggers;
prompt Enabling triggers for USERROLE...
alter table USERROLE enable all triggers;
set feedback on
set define on
prompt Done.
