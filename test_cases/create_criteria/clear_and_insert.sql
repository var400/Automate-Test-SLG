truncate slg.mst_group_common;
INSERT INTO slg.mst_group_common (profile_name,group_id,group_name,group_type,group_desc,is_active,group_seq,is_disable,default_value) VALUES
 ('Prepaid','b5d40207-dd9f-4dab-8b8c-82f08f0f4e70','Thai  ID Card','checkbox','Thai  ID Card',true,4,false,NULL),
 ('Postpaid','7c9e0eea-c3de-49cd-a6c2-318222222222','Subscriber Status 12','checkbox','Subscriber Status 12',true,1,false,NULL),
 ('Prepaid','7c9e0eea-c3de-49cd-a6c2-31802a3e6d23','Subscriber Status','multi_dropdown','Subscriber Status',true,1,false,NULL),
 ('Prepaid','8b54828e-5659-4750-995b-e1e0bd66d902','Device','checkbox','Device',true,3,false,NULL),
 ('Prepaid','38ac0ac1-d88d-40fb-bcff-8d8c7c3daf12','Subscriber Type','radio','Subscriber Type 1',true,2,false,''),
 ('Prepaid','87cdb94a-5d6b-4d6c-81e8-6718241e96f1','Turecard Type','listbox','Turecard Type',true,6,false,NULL),
 ('Prepaid','cb60ed80-9eba-46b0-9b0f-b707a19f42b8','Grade','text','Grade',true,5,false,NULL);

truncate slg.mst_group_common_detail;
INSERT INTO slg.mst_group_common_detail (group_id,field_label,field_value,field_desc,is_active,field_name,is_checked,field_seq,schema_name,table_name,join_source_field,join_target_field) VALUES
 ('38ac0ac1-d88d-40fb-bcff-8d8c7c3daf13','Subscriber Typex','','Subscriber Typex',false,'CERT_ID_FLAG',false,2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY'),
 ('b5d40207-dd9f-4dab-8b8c-82f08f0f4e70','No','N','No Thai ID Card',true,'CERT_ID_FLAG',false,2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY'),
 ('b5d40207-dd9f-4dab-8b8c-82f08f0f4e70','Yes','Y','Thai ID Card',true,'CERT_ID_FLAG',false,1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY'),
 ('7c9e0eea-c3de-49cd-a6c2-318222222222','Active','A','Active',true,'DWH_PROD_STAT',false,1,'CVMSBOX','CAMPAIGN_POSTPAID_360','PROD_KEY','PROD_KEY'),
 ('7c9e0eea-c3de-49cd-a6c2-318222222222','Soft Suspend','S','Soft Suspend',true,'DWH_PROD_STAT',false,2,'CVMSBOX','CAMPAIGN_POSTPAID_360','PROD_KEY','PROD_KEY'),
 ('7c9e0eea-c3de-49cd-a6c2-31802a3e6d23','Active','A','Active',true,'DWH_PROD_STAT',true,1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY'),
 ('7c9e0eea-c3de-49cd-a6c2-31802a3e6d23','Soft Suspend','D','Soft Suspend',true,'DWH_PROD_STAT',false,2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY'),
 ('7c9e0eea-c3de-49cd-a6c2-31802a3e6d23','Full Suspend','E','Full Suspend',true,'DWH_PROD_STAT',false,3,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY'),
 ('87cdb94a-5d6b-4d6c-81e8-6718241e96f1','Green','Green','Green',true,'TRUECARD_TYPE',false,1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY'),
 ('87cdb94a-5d6b-4d6c-81e8-6718241e96f1','White','White','White',true,'TRUECARD_TYPE',false,2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY');
INSERT INTO slg.mst_group_common_detail (group_id,field_label,field_value,field_desc,is_active,field_name,is_checked,field_seq,schema_name,table_name,join_source_field,join_target_field) VALUES
 ('87cdb94a-5d6b-4d6c-81e8-6718241e96f1','Blue','Blue','Blue',true,'TRUECARD_TYPE',false,3,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY'),
 ('87cdb94a-5d6b-4d6c-81e8-6718241e96f1','Red','Red','Red',true,'TRUECARD_TYPE',false,4,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY'),
 ('cb60ed80-9eba-46b0-9b0f-b707a19f42b8','Grade','','Grade',true,'GRADE',false,1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY'),
 ('8b54828e-5659-4750-995b-e1e0bd66d902','Smart Phone','Smartphone','Smart Phone',true,'CUR_TYPE_DEVICE',false,1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY'),
 ('8b54828e-5659-4750-995b-e1e0bd66d902','Feature phone','Mobile Phone/Feature phone','Feature phone',true,'CUR_TYPE_DEVICE',false,2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY'),
 ('8b54828e-5659-4750-995b-e1e0bd66d902','Tablet','Tablet','Tablet',true,'CUR_TYPE_DEVICE',false,3,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY'),
 ('8b54828e-5659-4750-995b-e1e0bd66d902','WLAN Router','WLAN Router','WLAN Router',true,'CUR_TYPE_DEVICE',false,4,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY'),
 ('38ac0ac1-d88d-40fb-bcff-8d8c7c3daf12','Indy','I','Indy',true,'CUST_CATEGORY',false,1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY'),
 ('38ac0ac1-d88d-40fb-bcff-8d8c7c3daf12','Corp',' ','Corp',true,'CUST_CATEGORY',false,2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY');