TRUNCATE TABLE slg.mst_profile;
INSERT INTO slg.mst_profile (profile_name,is_active,profile_group,profile_table) VALUES
	 ('TVS',true,'Product Type','CVMSBOX.CAMPAIGN_PREPAID_360'),
	 ('Postpaid',true,'Product Type','CVMSBOX.CAMPAIGN_POSTPAID_360'),
	 ('Prepaid',true,'Product Type','CVMSBOX.CAMPAIGN_PREPAID_360'),
	 ('Test Profile Delete 1',true,'Product Type','CVMSBOX.CAMPAIGN_PREPAID_360'),
	 ('Test Profile Delete 2',true,'Product Type','CVMSBOX.CAMPAIGN_PREPAID_360'),
	 ('TOL',true,'Product Type','CVMSBOX.CAMPAIGN_PREPAID_360');

