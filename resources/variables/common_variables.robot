*** Settings ***
Library    SeleniumLibrary
Variables    ../../resources/variables/src/common_data.yaml

*** Variables ***
${DELAY}    5s
${SQLFilePath}   test_cases/channel/clear_and_insert.sql
#ADD CHANNEL
${CHOOSE_KEY_INPUT_TEXT}    group_name,group_seq,group_desc,field_label,field_value,field_desc,field_seq
${CHOOSE_KEY_INPUT_CHECKBOX}    is_active,is_disable,is_checked,is_null
${CHOOSE_KEY_INPUT_SELECT_OPTION}    profile_name,group_type
${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    schema_name,table_name,field_name
${CHOOSE_KEY_COPPY_GROUP_DETAIL}    schema_name,table_name,field_name,field_label,field_value,field_desc,field_seq,is_active,is_checked,is_null
#CHANNEL LIST
${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    profile_name,group_name,group_seq,group_desc,group_type,default_value
${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}    is_active,is_disable
${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    field_label,field_value,field_desc,field_seq,schema_name,table_name,field_name
${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}    is_active,is_checked,is_null
${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL_DUPPLICATE}    field_seq,schema_name,table_name,field_name
${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DUPPLICATE}    is_active
#Update/Check Edit Page Channel
${CHOOSE_KEY_EDIT_AUTO_COMPLETE}    schema_name,table_name,field_name
${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    group_name,group_seq,group_desc,group_type,field_label,field_value,field_desc,field_seq
${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}    is_active,is_disable,is_checked,is_null
${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    profile_name,group_type
#CHECK_VALIDATE
${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    channel_name,channel_delimiter,channel_format,channel_label,channel_file_name_format,channel_temp_path,channel_target_path,channel_host,channel_user,channel_pass,channel_port,channel_file_type

#Set Variable Database
${TABLE_NAME}    slg.mst_channel_config
${COLUMN_ID}    channel_id

#GET DATA
${TC_001_DATA}    ${TC_001}