prompt PL/SQL Developer import file
prompt Created on 2009��9��7�� by puy
set feedback off
set define off
prompt Disabling triggers for DATABASE...
alter table DATABASE disable all triggers;
prompt Disabling triggers for PUBENUMERATION...
alter table PUBENUMERATION disable all triggers;
prompt Disabling triggers for PUBGEO...
alter table PUBGEO disable all triggers;
prompt Disabling triggers for PUBLOG...
alter table PUBLOG disable all triggers;
prompt Disabling triggers for SUITE...
alter table SUITE disable all triggers;
prompt Disabling triggers for PUBORGANIZATION...
alter table PUBORGANIZATION disable all triggers;
prompt Disabling foreign key constraints for PUBGEO...
alter table PUBGEO disable constraint FK_PUBGEO_REFERENCE_PUBGEO;
prompt Disabling foreign key constraints for SUITE...
alter table SUITE disable constraint FK_SUITE_FK_SUITE__DATABASE;
prompt Disabling foreign key constraints for PUBORGANIZATION...
alter table PUBORGANIZATION disable constraint FK_PUBORGAN_REFERENCE_DATABASE;
alter table PUBORGANIZATION disable constraint FK_PUBORGAN_REFERENCE_SUITE;
alter table PUBORGANIZATION disable constraint FK_PUBORGAN_REF_ORG_G_PUBGEO;
alter table PUBORGANIZATION disable constraint FK_PUBORGAN_REF_ORG_G_PUBGEO2;
alter table PUBORGANIZATION disable constraint FK_PUBORGAN_REF_ORG_G_PUBGEO3;
alter table PUBORGANIZATION disable constraint FK_PUBORGAN_REF_ORG_O_PUBENUME;
prompt Deleting PUBORGANIZATION...
delete from PUBORGANIZATION;
commit;
prompt Deleting SUITE...
delete from SUITE;
commit;
prompt Deleting PUBLOG...
delete from PUBLOG;
commit;
prompt Deleting PUBGEO...
delete from PUBGEO;
commit;
prompt Deleting PUBENUMERATION...
delete from PUBENUMERATION;
commit;
prompt Deleting DATABASE...
delete from DATABASE;
commit;
prompt Loading DATABASE...
insert into DATABASE (DATABASEID, CONNECTIONSTRING, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, PROVIDER, NAME)
values ('t1', 'Data Source=orcl;Persist Security Info=True;User ID=sqms_private_0815;Password=123456;Unicode=True', 'N', to_date('24-08-2009', 'dd-mm-yyyy'), 'admin', to_date('24-08-2009', 'dd-mm-yyyy'), 'admin', 'System.Data.OracleClient', 'sqms_private_0815');
insert into DATABASE (DATABASEID, CONNECTIONSTRING, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY, PROVIDER, NAME)
values ('t2', 'Data Source=orcl;Persist Security Info=True;User ID=sqms_private_0820;Password=123456;Unicode=True', 'N', to_date('24-08-2009', 'dd-mm-yyyy'), 'admin  ', to_date('24-08-2009', 'dd-mm-yyyy'), 'admin', 'System.Data.OracleClient', 'sqms_private_0820');
commit;
prompt 2 records loaded
prompt Loading PUBENUMERATION...
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_mun_main_road', '_road_type_mun_main_road', '��������·', '_road_type', null, null, null, null, null);
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_mun_normal_road', '_road_type_mun_normal_road', '������·', '_road_type', null, null, null, null, null);
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_industry', '_road_typeindustry', '��ҵ԰��', '_road_type', null, null, null, null, null);
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_comm_road', '_road_type_comm_road', '������·', '_road_type', null, null, null, null, null);
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_triple_confuse', '_road_type_triple_confuse', '������ҵ', '_road_type', null, null, null, null, null);
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_road_type_garden_road', '_road_type_garden_road', '԰����·', '_road_type', null, null, null, null, null);
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_qc_state_valid', '_qc_state_valid', '��Ч', '_qc_state', null, null, null, null, null);
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_qc_state_not_valid', '_qc_state_not_valid', '��Ч', '_qc_state', null, null, null, null, null);
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_qc_type_normal', '_qc_type_normal', '��̬���', '_qc_type', null, null, null, null, null);
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('_qc_type_dynamic', '_qc_type_dynamic', 'Ѳ��', '_qc_type', null, null, null, null, null);
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('incumbency', 'incumbency', '��ְ', '_empstatus', null, to_date('09-08-2009', 'dd-mm-yyyy'), 'admin', to_date('09-08-2009', 'dd-mm-yyyy'), 'adimin');
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('dimission', 'dimission', '��ְ', '_empstatus', null, to_date('09-08-2009', 'dd-mm-yyyy'), 'admin', to_date('09-08-2009', 'dd-mm-yyyy'), 'admin');
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('department', 'department', '����', '_org', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin');
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('organization', 'organization', '����', '_org', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', to_date('14-08-2009', 'dd-mm-yyyy'), 'admin');
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('midschool', 'midschool', '��ѧ', '_degree', null, to_date('09-08-2009', 'dd-mm-yyyy'), 'admin', to_date('09-08-2009', 'dd-mm-yyyy'), 'admin');
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('highschool', 'highschool', 'ѧʿ', '_degree', null, to_date('09-08-2009', 'dd-mm-yyyy'), 'admin', to_date('09-08-2009', 'dd-mm-yyyy'), 'admin');
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('master', 'master', '˶ʿ', '_degree', null, to_date('09-08-2009', 'dd-mm-yyyy'), 'admin', to_date('09-08-2009', 'dd-mm-yyyy'), 'admin');
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('male', 'male', '��', '_sex', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin');
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('female', 'female', 'Ů', '_sex', null, to_date('07-08-2009', 'dd-mm-yyyy'), 'admin', to_date('07-08-2009', 'dd-mm-yyyy'), 'admin');
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('picture', 'picture', 'ͼ��', '_quality_data_type', null, to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin');
insert into PUBENUMERATION (ENUMID, ENUMCODE, ENUMNAME, ENUMTYPE, MEMO, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('video', 'video', '��Ƶ', '_quality_data_type', null, to_date('21-08-2009', 'dd-mm-yyyy'), 'admin', to_date('21-08-2009', 'dd-mm-yyyy'), 'admin');
commit;
prompt 21 records loaded
prompt Loading PUBGEO...
prompt Table is empty
prompt Loading PUBLOG...
prompt Table is empty
prompt Loading SUITE...
insert into SUITE (SUITEID, DATABASEID, ISUSING, VERSION, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('t1', 't1', 'Y', '1', 'N', to_date('30-08-2009', 'dd-mm-yyyy'), 'admin', to_date('30-08-2009', 'dd-mm-yyyy'), 'admin');
insert into SUITE (SUITEID, DATABASEID, ISUSING, VERSION, ISVOID, CREATED, CREATEDBY, MODIFIED, MODIFIEDBY)
values ('t2', 't2', 'Y', '1', 'N', to_date('30-08-2009', 'dd-mm-yyyy'), 'admin', to_date('30-08-2009', 'dd-mm-yyyy'), 'admin');
commit;
prompt 2 records loaded
prompt Loading PUBORGANIZATION...
insert into PUBORGANIZATION (ORGID, PARENTORG, ORGCODE, ORGNAME, ORGTYPE, COUNTRY, PROVINCE, CITY, ORGALIAS, ORGSTATUS, ORGADDRESS, ZIPCODE, CONTACT, CONTACTTEL, EMAIL, MEMO, CREATED, CREATEDBY, MODIFIEDBY, ISVOID, SUITEID, DATABASEID, MODIFIED, ORGANIZATIONID)
values ('t1', null, 'MAINTEST_ORG', 'ר�ò��Ի���', 'organization', null, null, null, '���Ի���', '����', '������ɳƺ����', '400044', '����Ա', '13542154879', 'yinpsoft@gmail.com', null, to_date('14-08-2009', 'dd-mm-yyyy'), 'admin', 'admin', 'N', 't1', 't1', to_date('14-08-2009', 'dd-mm-yyyy'), null);
insert into PUBORGANIZATION (ORGID, PARENTORG, ORGCODE, ORGNAME, ORGTYPE, COUNTRY, PROVINCE, CITY, ORGALIAS, ORGSTATUS, ORGADDRESS, ZIPCODE, CONTACT, CONTACTTEL, EMAIL, MEMO, CREATED, CREATEDBY, MODIFIEDBY, ISVOID, SUITEID, DATABASEID, MODIFIED, ORGANIZATIONID)
values ('t3', 't1', 'MAINTEST_SUBORG', '���Է�֧����', 'organization', null, null, null, '���Ի���', '����', '���������ƺ', '400043', '����Ա', '132456789', 'yul@126.com', null, to_date('15-08-2009', 'dd-mm-yyyy'), 'admin', 'admin', 'N', 't2', 't2', to_date('15-08-2009', 'dd-mm-yyyy'), 't1');
commit;
prompt 2 records loaded
prompt Enabling foreign key constraints for PUBGEO...
alter table PUBGEO enable constraint FK_PUBGEO_REFERENCE_PUBGEO;
prompt Enabling foreign key constraints for SUITE...
alter table SUITE enable constraint FK_SUITE_FK_SUITE__DATABASE;
prompt Enabling foreign key constraints for PUBORGANIZATION...
alter table PUBORGANIZATION enable constraint FK_PUBORGAN_REFERENCE_DATABASE;
alter table PUBORGANIZATION enable constraint FK_PUBORGAN_REFERENCE_SUITE;
alter table PUBORGANIZATION enable constraint FK_PUBORGAN_REF_ORG_G_PUBGEO;
alter table PUBORGANIZATION enable constraint FK_PUBORGAN_REF_ORG_G_PUBGEO2;
alter table PUBORGANIZATION enable constraint FK_PUBORGAN_REF_ORG_G_PUBGEO3;
alter table PUBORGANIZATION enable constraint FK_PUBORGAN_REF_ORG_O_PUBENUME;
prompt Enabling triggers for DATABASE...
alter table DATABASE enable all triggers;
prompt Enabling triggers for PUBENUMERATION...
alter table PUBENUMERATION enable all triggers;
prompt Enabling triggers for PUBGEO...
alter table PUBGEO enable all triggers;
prompt Enabling triggers for PUBLOG...
alter table PUBLOG enable all triggers;
prompt Enabling triggers for SUITE...
alter table SUITE enable all triggers;
prompt Enabling triggers for PUBORGANIZATION...
alter table PUBORGANIZATION enable all triggers;
set feedback on
set define on
prompt Done.
