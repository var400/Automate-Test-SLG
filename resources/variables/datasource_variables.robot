*** Settings ***
Library    SeleniumLibrary
Variables    ../../resources/variables/src/datasource_data.yaml

*** Variables ***
${DELAY}    5s


#SET VARIABLE DATABASE
${TABLE_NAME}    slg.mst_datasource
${COLUMN_ID}    id


#GET DATA YAML
${TC_011_DATA}    ${TC_011}
${TC_016_DATA}    ${TC_016}
${TC_017_DATA}    ${TC_017}
${TC_018_DATA}    ${TC_018}
${TC_019_DATA}    ${TC_019}
${TC_020_DATA}    ${TC_020}
${TC_021_DATA}    ${TC_021}
${TC_022_DATA}    ${TC_022}
${TC_023_DATA}    ${TC_023}
${TC_024_DATA}    ${TC_024}
${TC_028_DATA}    ${TC_028}
${TC_029_DATA}    ${TC_029}
${TC_030_DATA}    ${TC_030}
${TC_031_DATA}    ${TC_031}
${TC_032_DATA}    ${TC_032}
${TC_033_DATA}    ${TC_033}
${TC_034_DATA}    ${TC_034}
${TC_035_DATA}    ${TC_035}
${TC_036_DATA}    ${TC_036}


#DATASOURCE LIST
${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    datasource_name,datasource_type,datasource_desc,datasource_host,datasource_port,datasource_dbname,user_exec,user_batch
${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}    is_active


#ADD DATASOURCE
${CHOOSE_KEY_INPUT_TEXT}    datasource_name,datasource_host,datasource_dbname,datasource_port,default_schema_contact,default_schema_temp,user_exec,pass_exec,user_batch,pass_batch,datasource_desc,remark
${CHOOSE_KEY_INPUT_CHECKBOX}    is_active
${CHOOSE_KEY_INPUT_SELECT_OPTION}    datasource_type


#UPDATE/CHECK EDIT PAGE DATASOURCE
${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    datasource_name,datasource_host,datasource_dbname,datasource_port,default_schema_contact,default_schema_temp,user_exec,pass_exec,user_batch,pass_batch,datasource_desc,remark
${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}    is_active
${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    datasource_type


#CHECK_VALIDATE
${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    datasource_name
