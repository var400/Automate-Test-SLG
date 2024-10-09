-- DELETE FROM slg.mst_group_exclude_detail
-- USING slg.mst_group_exclude
-- WHERE slg.mst_group_exclude_detail.group_id = slg.mst_group_exclude.group_id
-- AND slg.mst_group_exclude.group_name = 'TEST CREATE ALL FLAG';

-- Delete from slg.mst_group_exclude
-- where group_name = 'TEST CREATE ALL FLAG';


TRUNCATE TABLE slg.mst_group_exclude;
INSERT INTO slg.mst_group_exclude (profile_name,group_id,group_name,group_type,group_desc,is_active,group_seq,is_disable,default_value,is_authorize) VALUES
	 ('TRUE_MOBILE_PREPAID','b5d40207-dd9f-4dab-8b8c-82f08f0f42222','Sweetheart/Hero','checkbox','Sweetheart/Hero',false,2,false,NULL,false),
	 ('TRUE_MOBILE_PREPAID','aaed06bb-3a72-4eb1-a18c-21250d0953ec','sadasd','checkbox','asdasdasdad',false,1,false,NULL,true),
	 ('TRUE_MOBILE_PREPAID','a922ef41-d95c-43df-87ee-1681684893da','asscx','checkbox','casdasddc',false,3,false,NULL,false),
	 ('TRUE_MOBILE_PREPAID','b5d40207-dd9f-4dab-8b8c-82f08f0f44444','Global Exclusion','checkbox','Global Exclusion',true,1,false,NULL,false),
	 ('TRUE_MOBILE_PREPAID','7d37b09d-528a-4708-a39a-1e59d12aa7ee','Ture Subscription','radio','TURE SUBSCRIPTION',true,2,false,'',true),
	 ('TRUE_MOBILE_PREPAID','fc612a35-85fe-48b7-a3c2-59bdb66bd65a','True ISV','checkbox','TRUE ISV',true,3,false,NULL,false),
	 ('TRUE_MOBILE_PREPAID','64f74db9-c3bb-4b41-a51f-0a1c85ee38c6','Last Buy Flag','listbox','Last buy flag',true,5,false,'',true),
	 ('TRUE_MOBILE_PREPAID','160742e4-dd30-4ad1-b424-899aa240a59b','True ID','checkbox','TRUE ID',true,10,false,'Y',true),
	 ('TRUE_MOBILE_PREPAID','9f4dfc9f-3f5c-4b92-84fc-ad7714ba4388','TEST CREATE ALL FLAG','listbox','TEST CREATE ALL FLAG DESCRIPTION',true,6,false,'Y',false),
	 ('TRUE_MOBILE_POSTPAID','11111111-dd9f-4dab-8b8c-82f08f0f44444','Global Exclusion test','checkbox','Global Exclusion',true,1,false,NULL,false);



TRUNCATE TABLE slg.mst_group_exclude_detail;
INSERT INTO slg.mst_group_exclude_detail (group_id,field_label,field_value_yes,field_value_no,field_desc,is_checked,is_active,field_name,field_seq,schema_name,table_name,join_source_field,join_target_field,is_null) VALUES
	 ('b5d40207-dd9f-4dab-8b8c-82f08f0f42222','Yes','I','I','Yes',false,true,'CUST_CATEGORY',1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('aaed06bb-3a72-4eb1-a18c-21250d0953ec','sadasda','asdasd','asdad','ddsad',true,true,'ACTV_PROVINCE_KEY',1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('aaed06bb-3a72-4eb1-a18c-21250d0953ec','sadxxxx','xxzzz','cccc','csadddd',true,true,'ACTV_PROVINCE_KEY',1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('aaed06bb-3a72-4eb1-a18c-21250d0953ec','asddd','ssss','ddcc','sss',false,true,'ACTV_LATITUDE',3,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('a922ef41-d95c-43df-87ee-1681684893da','asdddd','yy','nn','ddsad',true,true,'ACTV_PROVINCE_KEY',1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('a922ef41-d95c-43df-87ee-1681684893da','dasda','sss','sdd','sdxccc',true,true,'CERT_ID',2,'SLG','CAMPAIGN_CUSTOMER_DETAIL','PROD_KEY','PROD_KEY',NULL),
	 ('a922ef41-d95c-43df-87ee-1681684893da','asdddd','ssss','cccc','ddsad',false,true,'ACTV_PROVINCE',1,'SLG','CAMPAIGN_CUSTOMER_COUNTRY','PROD_KEY','PROD_KEY',NULL),
	 ('a922ef41-d95c-43df-87ee-1681684893da','dsad','cxzzz','xxx','dddd',true,true,'ACTV_PARTNER_NAME',2,'SLG','CAMPAIGN_CUSTOMER_DETAIL','PROD_KEY','PROD_KEY',NULL),
	 ('fc612a35-85fe-48b7-a3c2-59bdb66bd65a','TRUE ISV FLAG','Y','N','TRUE ISV FLAG',false,true,'TRUE_ISV_FLAG',1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('fc612a35-85fe-48b7-a3c2-59bdb66bd65a','ACTIVE','Y','N','TRUE ISV FLAG STATUS',false,true,'TRUE_ISV_ACTIVE',2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL);
INSERT INTO slg.mst_group_exclude_detail (group_id,field_label,field_value_yes,field_value_no,field_desc,is_checked,is_active,field_name,field_seq,schema_name,table_name,join_source_field,join_target_field,is_null) VALUES
	 ('11111111-dd9f-4dab-8b8c-82f08f0f44444','VIP','Y','N','VIP',false,true,'VIP_FLAG',1,'CVMSBOX','CAMPAIGN_POSTPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('b5d40207-dd9f-4dab-8b8c-82f08f0f44444','True Emp','Y','N','True Emp',false,false,'TRUE_EMP_FLAG',2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('b5d40207-dd9f-4dab-8b8c-82f08f0f44444','Bar MMS','Y','N','Bar MMS',false,false,'SMS_BAR_ALL_FLAG',6,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('b5d40207-dd9f-4dab-8b8c-82f08f0f44444','Bar IVR OB','Y','N','Bar IVR OB',false,false,'SMS_BAR_ALL_FLAG',7,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('b5d40207-dd9f-4dab-8b8c-82f08f0f44444','Bar Flash SMS','Y','N','Bar Flash SMS',false,false,'SMS_BAR_ALL_FLAG',8,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('b5d40207-dd9f-4dab-8b8c-82f08f0f44444','VIP','Y','N','VIP',false,true,'VIP_FLAG',1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('b5d40207-dd9f-4dab-8b8c-82f08f0f44444','Tourist SIM','Y','N','Tourist SIM',false,true,'SIM_TOURIST_FLAG',4,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('b5d40207-dd9f-4dab-8b8c-82f08f0f44444','Corp&SM SIM','Y','N','Corp&SM SIM',false,true,'SIM_TRAVEL_FLAG',3,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('b5d40207-dd9f-4dab-8b8c-82f08f0f44444','Bar SMS','Y','N','Bar SMS',false,true,'SMS_BAR_ALL_FLAG',5,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('7d37b09d-528a-4708-a39a-1e59d12aa7ee','POSTPAID SUBS','Y','N','POSTPAID SUBS',false,true,'TMH_POSTPAID_SUBS',1,'SLG','CUSTOMER_SUBSCRIPTION','PROD_KEY','PROD_KEY',NULL);
INSERT INTO slg.mst_group_exclude_detail (group_id,field_label,field_value_yes,field_value_no,field_desc,is_checked,is_active,field_name,field_seq,schema_name,table_name,join_source_field,join_target_field,is_null) VALUES
	 ('7d37b09d-528a-4708-a39a-1e59d12aa7ee','TOL SUBS','Y','N','TOL SUBS',false,true,'TOL_SUBS',2,'SLG','CUSTOMER_SUBSCRIPTION','PROD_KEY','PROD_KEY',NULL),
	 ('7d37b09d-528a-4708-a39a-1e59d12aa7ee','TVS SUBS','Y','N','TVS SUBS',false,true,'TVS_SUBS',3,'SLG','CUSTOMER_SUBSCRIPTION','PROD_KEY','PROD_KEY',NULL),
	 ('64f74db9-c3bb-4b41-a51f-0a1c85ee38c6','LAST BUY FLAG','Y','N','LAST BUY FLAG',false,true,'LAST_BUY_OC_EXP_FLAG',1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',false),
	 ('64f74db9-c3bb-4b41-a51f-0a1c85ee38c6','EXP FLAG','Y','N','EXP FLAG',false,true,'LAST_BUY_EXP_FLAG',2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('64f74db9-c3bb-4b41-a51f-0a1c85ee38c6','IPK ULM FLAG','Y','N','IPK ULM FLAG',false,true,'LAST_BUY_IPK_ULM_FLAG',3,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('64f74db9-c3bb-4b41-a51f-0a1c85ee38c6','IPK FUP FLAG','Y','N','IPK FUP FLAG',false,true,'LAST_BUY_IPK_FUP_FLAG',4,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('64f74db9-c3bb-4b41-a51f-0a1c85ee38c6','RC EXP FLAG','Y','N','RC EXP FLAG',false,true,'LAST_BUY_RC_EXP_FLAG',5,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('160742e4-dd30-4ad1-b424-899aa240a59b','TURE ID FLAG','Y','N','TURE ID FLAG',true,true,'TRUE_ID_FLAG',1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',NULL),
	 ('160742e4-dd30-4ad1-b424-899aa240a59b','TOL','Y','N','TRUE ID ACTIVE',false,true,'TRUE_ID_ACTIVE',2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',false),
	 ('9f4dfc9f-3f5c-4b92-84fc-ad7714ba4388','DEALER FLAG','Y','N','DEALER FLAG DESCRIPTION',true,true,'DEALER_FLAG',1,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',true);
INSERT INTO slg.mst_group_exclude_detail (group_id,field_label,field_value_yes,field_value_no,field_desc,is_checked,is_active,field_name,field_seq,schema_name,table_name,join_source_field,join_target_field,is_null) VALUES
	 ('9f4dfc9f-3f5c-4b92-84fc-ad7714ba4388','TMH FLAG','Y','N','TMH FLAG DESCRIPTION',false,true,'BLACK_LIST_TMH_FLAG',2,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',false),
	 ('9f4dfc9f-3f5c-4b92-84fc-ad7714ba4388','TOL FLAG','Y','N','TOL FLAG DESCRIPTION',false,true,'BLACK_LIST_TOL_FLAG',3,'CVMSBOX','CAMPAIGN_PREPAID_360','PROD_KEY','PROD_KEY',false);

