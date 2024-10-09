TRUNCATE TABLE slg.mst_profile;
INSERT INTO slg.mst_profile (profile_name,is_active,profile_group,profile_table,profile_label) VALUES
	 ('TRUE_MOBILE_PREPAID',true,'Product Type','CVMSBOX.CAMPAIGN_PREPAID_360','True mobile Prepaid'),
	 ('TRUE_MOBILE_POSTPAID',true,'Product Type','CVMSBOX.CAMPAIGN_POSTPAID_360','True mobile Postpaid'),
	 ('TRUE_ONLINE',true,'Product Type','CVMSBOX.CAMPAIGN_PREPAID_360','True Online'),
	 ('TRUE_VISION',true,'Product Type','CVMSBOX.CAMPAIGN_PREPAID_360','True Vision'),
	 ('TRUE_MOBILE_PREPAID_POSTPAID',true,'Product Type','SLG.CAMPAIGN_POSTPAID_PREPAID','True mobile Prepaid and Postpaid'),
	 ('Test Profile Delete 2',true,'Product Type','CVMSBOX.CAMPAIGN_PREPAID_360',NULL),
	 ('Test Profile Delete 1',true,'Product Type','CVMSBOX.CAMPAIGN_PREPAID_360',NULL);

