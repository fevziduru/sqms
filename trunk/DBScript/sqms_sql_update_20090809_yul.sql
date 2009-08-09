-- Add/modify columns 
alter table MPASSIGNMENT modify LONGITUDE NUMBER(17,14);
alter table MPASSIGNMENT modify LATITUDE NUMBER(17,14);

-- Add/modify columns 
alter table PROJECT add EMPID VARCHAR2(40);
-- Add comments to the columns 
comment on column PROJECT.EMPID
  is '������';
  
CREATE INDEX PROJECT_EMPOYEE_FK ON PROJECT (
   EMPID ASC
);

ALTER TABLE PROJECT
   ADD CONSTRAINT FK_PROJECT_FK_PROJEC_EMPLOYEE FOREIGN KEY (EMPID)
      REFERENCES EMPLOYEE (EMPID);
      
-- Add/modify columns 
alter table QUALITY modify LONGITUDE NUMBER(17,14);
alter table QUALITY modify LATITUDE NUMBER(17,14);


-- Add/modify columns 
alter table QUALITY add TYPE VARCHAR2(40);
-- Add comments to the columns 
comment on column QUALITY.TYPE
  is '�������ݵ����ͣ�_qc_type_normal��̬������ݣ�_qc_type_dynamicѲ�����ݣ�';
  