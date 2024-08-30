TRUNCATE TABLE slg.mst_datasource;
INSERT INTO slg.mst_datasource (id,datasource_name,datasource_desc,datasource_host,datasource_port,datasource_dbname,user_exec,pass_exec,user_batch,pass_batch,is_active,remark,datasource_type,default_schema_contact,default_schema_temp) VALUES
	 ('d095325f-2c0e-4156-a9f2-6772f240262e','Test Datasource Delete 2','Test Datasource Delete 2 Description','localhost','5433','dbadmin','dbadmin','password','dbadmin','password',true,'Test Datasource Delete 2 Remark','VerticaSQL','SLG','SLG'),
	 ('0D1DE801-5475-4C8C-934B-AC83DF07E029','SLG_POSTGRES','','localhost','5432','postgres','postgres','mysecretpassword','postgres','mysecretpassword',true,'','PostgreSQL','SLGAPPO','SLGSBOX'),
	 ('858819ff-fbff-4b1d-9929-51532cd3d2bc','Test Datasource Save Config','Test Datasource Save Config Description','localhost','5433','dbadmin','dbadmin','password','dbadmin','password',true,'Test Datasource Save Config Remark','VerticaSQL','SLG','SLG'),
	 ('1d96e27a-5063-4a62-a1d6-b8d279dfa1df','Test Datasource Delete 1','Test Datasource Delete 1 Description','localhost','5433','dbadmin','dbadmin','password','dbadmin','password',false,'Test Datasource Delete 1 Remark','VerticaSQL','SLG','SLG'),
	 ('c8296cd3-1077-4bc9-9975-1313e8440cab','SLG_VERTICA','','localhost','5433','dbadmin','dbadmin','password','dbadmin','password',true,'','VerticaSQL','SLGAPPO','SLGSBOX');
