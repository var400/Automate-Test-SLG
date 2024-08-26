*** Settings ***
Library    SeleniumLibrary
Variables    ../../resources/variables/src/datasource_data.yaml

*** Variables ***
${DELAY}    5s


#SET VARIABLE DATABASE
${TABLE_NAME}    slg.mst_datasource
${COLUMN_ID}    id


#GET DATA YAML
${TC_016_DATA}    ${TC_016}
${TC_017_DATA}    ${TC_017}
${TC_018_DATA}    ${TC_018}
${TC_019_DATA}    ${TC_019}






#DATASOURCE LIST
${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    datasource_name,datasource_type,datasource_desc,datasource_host,datasource_port,datasource_dbname,user_exec,user_batch
${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}    is_active


#ADD DATASOURCE
${CHOOSE_KEY_INPUT_TEXT}    datasource_name,datasource_host,datasource_dbname,datasource_port,default_schema,user_exec,pass_exec,user_batch,pass_batch,datasource_desc,remark
${CHOOSE_KEY_INPUT_CHECKBOX}    is_active
${CHOOSE_KEY_INPUT_SELECT_OPTION}    datasource_type
