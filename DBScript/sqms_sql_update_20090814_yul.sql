-- Add/modify columns 
alter table MPASSIGNMENT add MPLEVEL VARCHAR2(40);
-- Add comments to the columns 
comment on column MPASSIGNMENT.MPLEVEL
  is '��ص㼶����Google��ͼ���ż����Ӧ����ENUMERATION�����';
  
-- Add/modify columns 
alter table QUALITY add QUALITYLEVEL VARCHAR2(40);
-- Add comments to the columns 
comment on column QUALITY.QUALITYLEVEL
  is '����������ENUMERATION����������Զ�����������';
  
