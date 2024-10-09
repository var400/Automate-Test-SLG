TRUNCATE TABLE slg.mst_group_common;
INSERT INTO slg.mst_group_common (profile_name,group_id,group_name,group_type,group_desc,is_active,group_seq,is_disable,default_value) VALUES
	 ('TRUE_MOBILE_PREPAID','cb60ed80-9eba-46b0-9b0f-b707a19f42b8','Grade','text','Grade',true,5,false,NULL),
	 ('TRUE_MOBILE_PREPAID','8b54828e-5659-4750-995b-e1e0bd66d902','Device','checkbox','Device',true,3,false,NULL),
	 ('TRUE_MOBILE_PREPAID','7c9e0eea-c3de-49cd-a6c2-31802a3e6d23','Subscriber Status','multi_dropdown','Subscriber Status',true,1,true,NULL),
	 ('TRUE_MOBILE_PREPAID','438b3e0a-a0b6-4938-b8e0-e1a1957bfd20','Customer Grade','text','TEST TEXT BOX',false,7,false,NULL),
	 ('TRUE_MOBILE_PREPAID','38ac0ac1-d88d-40fb-bcff-8d8c7c3daf12','Subscriber Type','radio','Subscriber Type',true,2,false,''),
	 ('TRUE_MOBILE_PREPAID','b5d40207-dd9f-4dab-8b8c-82f08f0f4e70','Thai  ID Card','dropdown','Thai  ID Card',true,4,false,''),
	 ('TRUE_MOBILE_PREPAID','87cdb94a-5d6b-4d6c-81e8-6718241e96f1','Turecard Type','listbox','Turecard Type',true,6,false,'Green'),
	 ('TRUE_MOBILE_PREPAID','1bd3cda0-f8d5-45ee-a260-bc4563a6f5f1','TEST COMMON DELETE 1','dropdown','TEST COMMON DELETE 1 DESCRIPTION',true,20,false,'SOCIAL'),
	 ('TRUE_MOBILE_PREPAID','d13d270d-114b-4f35-880c-fdb0981ca1bd','TEST COMMON DELETE 2','checkbox','TEST COMMON DELETE 2 DESCRIPTION',true,21,false,'Sub Dealer'),
	 ('TRUE_MOBILE_POSTPAID','7c9e0eea-c3de-49cd-a6c2-318222222222','Subscriber Status 12','checkbox','Subscriber Status 12',true,1,false,'');



TRUNCATE TABLE slg.mst_group_common_detail;
INSERT INTO slg.mst_group_common_detail (group_id,field_label,field_value,field_desc,is_active,field_name,is_checked,field_seq,schema_name,table_name,join_source_field,join_target_field,is_null) VALUES
	 ('38ac0ac1-d88d-40fb-bcff-8d8c7c3daf13','Subscriber Typex','','Subscriber Typex',false,'CERT_ID_FLAG',false,2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('438b3e0a-a0b6-4938-b8e0-e1a1957bfd20','G1','G1','G1',true,'GRADE',false,1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('cb60ed80-9eba-46b0-9b0f-b707a19f42b8','Grade','','Grade',true,'GRADE',false,1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('7c9e0eea-c3de-49cd-a6c2-31802a3e6d23','Active','A','Active',true,'DWH_PROD_STAT',false,1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('7c9e0eea-c3de-49cd-a6c2-31802a3e6d23','Soft Suspend','D','Soft Suspend',true,'DWH_PROD_STAT',false,2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('7c9e0eea-c3de-49cd-a6c2-31802a3e6d23','Full Suspend','E','Full Suspend',true,'DWH_PROD_STAT',false,3,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('8b54828e-5659-4750-995b-e1e0bd66d902','Smart Phone','Smartphone','Smart Phone',true,'CUR_TYPE_DEVICE',true,1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('8b54828e-5659-4750-995b-e1e0bd66d902','Feature phone','Mobile Phone/Feature phone','Feature phone',true,'CUR_TYPE_DEVICE',false,2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('8b54828e-5659-4750-995b-e1e0bd66d902','Tablet','Tablet','Tablet',true,'CUR_TYPE_DEVICE',false,3,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('8b54828e-5659-4750-995b-e1e0bd66d902','WLAN Router','WLAN Router','WLAN Router',true,'CUR_TYPE_DEVICE',false,4,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL);
INSERT INTO slg.mst_group_common_detail (group_id,field_label,field_value,field_desc,is_active,field_name,is_checked,field_seq,schema_name,table_name,join_source_field,join_target_field,is_null) VALUES
	 ('38ac0ac1-d88d-40fb-bcff-8d8c7c3daf12','Indy','I','Indy',true,'CUST_CATEGORY',false,1,'SLG','CUSTOMER_SUBSCRIBER_TYPE','PROD_KEY','PROD_KEY',false),
	 ('38ac0ac1-d88d-40fb-bcff-8d8c7c3daf12','Corp',' ','Corp',true,'CUST_CATEGORY',false,2,'SLG','CUSTOMER_SUBSCRIBER_TYPE','PROD_KEY','PROD_KEY',NULL),
	 ('7c9e0eea-c3de-49cd-a6c2-318222222222','Active','A','Active',true,'DWH_PROD_STAT',false,1,'CVMSBOX','CAMPAIGN_POSTPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('7c9e0eea-c3de-49cd-a6c2-318222222222','Soft Suspend','S','Soft Suspend',true,'DWH_PROD_STAT',false,2,'CVMSBOX','CAMPAIGN_POSTPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('b5d40207-dd9f-4dab-8b8c-82f08f0f4e70','No','N','No Thai ID Card',true,'CERT_ID_FLAG',false,2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',false),
	 ('b5d40207-dd9f-4dab-8b8c-82f08f0f4e70','Yes','Y','Thai ID Card',true,'CERT_ID_FLAG',false,1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',false),
	 ('87cdb94a-5d6b-4d6c-81e8-6718241e96f1','Green','Green','Green',true,'TRUECARD_TYPE',true,1,'SLG','CUSTOMER_SUBSCRIBER_TYPE','PROD_KEY','PROD_KEY',NULL),
	 ('87cdb94a-5d6b-4d6c-81e8-6718241e96f1','White','White','White',true,'TRUECARD_TYPE',false,2,'SLG','CUSTOMER_SUBSCRIBER_TYPE','PROD_KEY','PROD_KEY',NULL),
	 ('87cdb94a-5d6b-4d6c-81e8-6718241e96f1','Blue','Blue','Blue',true,'TRUECARD_TYPE',false,3,'SLG','CUSTOMER_SUBSCRIBER_TYPE','PROD_KEY','PROD_KEY',NULL),
	 ('87cdb94a-5d6b-4d6c-81e8-6718241e96f1','Red','Red','Red',true,'TRUECARD_TYPE',false,4,'SLG','CUSTOMER_SUBSCRIBER_TYPE','PROD_KEY','PROD_KEY',NULL);
INSERT INTO slg.mst_group_common_detail (group_id,field_label,field_value,field_desc,is_active,field_name,is_checked,field_seq,schema_name,table_name,join_source_field,join_target_field,is_null) VALUES
	 ('1bd3cda0-f8d5-45ee-a260-bc4563a6f5f1','SOCIAL','SOCIAL','SOCIAL DESCRIPTION',true,'FIRST_GP_SIM_TYPE',true,1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',false),
	 ('1bd3cda0-f8d5-45ee-a260-bc4563a6f5f1','E-SPORT','E-SPORT','E-SPORT DESCRIPTION',true,'FIRST_GP_SIM_TYPE',false,2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',false),
	 ('d13d270d-114b-4f35-880c-fdb0981ca1bd','SUB DEALER','Sub Dealer','SUB DEALER DESCRIPTION',true,'ACTV_PARTNER_TYPE',true,1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',false),
	 ('d13d270d-114b-4f35-880c-fdb0981ca1bd','TRUE CENTER','True Center','TRUE CENTER DESCRIPTION',true,'ACTV_PARTNER_TYPE',false,2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',false);
