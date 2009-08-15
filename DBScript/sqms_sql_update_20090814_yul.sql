-- Add/modify columns 
alter table MPASSIGNMENT add MPLEVEL VARCHAR2(40);
-- Add comments to the columns 
comment on column MPASSIGNMENT.MPLEVEL
  is '监控点级别，与Google地图缩放级别对应，与ENUMERATION表关联';
  
-- Add/modify columns 
alter table QUALITY add QUALITYLEVEL VARCHAR2(40);
-- Add comments to the columns 
comment on column QUALITY.QUALITYLEVEL
  is '质量级别，与ENUMERATION表关联，可自定义质量级别';
  
