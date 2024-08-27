*** Settings ***
Library    SeleniumLibrary
Variables    ../../resources/variables/src/exclude_data.yaml

*** Variables ***
${DELAY}    5s
${SQLFilePath}   test_cases/exclude/clear_and_insert.sql
#ADD CHANNEL
${CHOOSE_KEY_INPUT_TEXT}    group_name,group_seq,group_desc,field_label,field_value_yes,field_value_no,field_desc,field_seq
${CHOOSE_KEY_INPUT_CHECKBOX}    is_active,is_disable,is_authorize,is_checked,is_null
${CHOOSE_KEY_INPUT_SELECT_OPTION}    profile_name,group_type
${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    schema_name,table_name,field_name
${CHOOSE_KEY_COPPY_GROUP_DETAIL}    schema_name,table_name,field_name,field_label,field_value_yes,field_value_no,field_desc,field_seq,is_active,is_checked,is_null
#CHANNEL LIST
${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    profile_name,group_name,group_seq,group_desc,group_type,default_value
${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}    is_active,is_disable
${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    field_label,field_value_yes,field_value_no,field_desc,field_seq,schema_name,table_name,field_name
${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}    is_active,is_checked,is_null
${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL_DUPPLICATE}    field_seq,schema_name,table_name,field_name
${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DUPPLICATE}    is_active
#Update/Check Edit Page Channel
${CHOOSE_KEY_EDIT_PAGE_AUTO_COMPLETE}    schema_name,table_name,field_name
${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    group_name,group_seq,group_desc,group_type,field_label,field_value_yes,field_value_no,field_desc,field_seq
${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}    is_authorize,is_active,is_disable,is_checked,is_null
${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    profile_name,group_type
#CHECK_VALIDATE
${CHOOSE_KEY_VALIDATE_DATA}    profile_name,group_name,group_type,group_seq,field_seq
${CHOOSE_KEY_VALIDATE_DATA_AUTO_COMPLETE}    schema_name,table_name,field_name

#Set Variable Database
${TABLE_NAME}    slg.mst_channel_config
${COLUMN_ID}    channel_id

#GET DATA
${TC_001_DATA}    ${TC_001_TEST}

#CHECK SEQ
${SCRIPT_CHECK_SEQ_BASE_LIST_GROUP}=    select group_seq,profile_name,group_name from slg.mst_group_exclude where is_active='true' order by profile_name,group_seq;
${SCRIPT_CHECK_SEQ_BASE_LIST_GROUP_DETAIL}=    select field_seq,field_label from slg.mst_group_exclude join slg.mst_group_exclude_detail on slg.mst_group_exclude.group_id  = slg.mst_group_exclude_detail.group_id and group_name = 'TEST CREATE ALL FLAG' order by field_seq;

${SCRIPT_CHECK_SEQ_BASE_CREATE_CRITIRIA}=    select 'Product Type' as group_name UNION all select group_name from (select * from slg.mst_group_exclude where is_active='true' and profile_name='Prepaid' order by profile_name,group_seq)
${SCRIPT_CHECK_SEQ_BASE_CREATE_CRITIRIA_DETAIL}=    select field_label from slg.mst_group_exclude join slg.mst_group_exclude_detail on slg.mst_group_exclude.group_id  = slg.mst_group_exclude_detail.group_id and group_name = 'TEST CREATE ALL FLAG' order by field_seq;

${SCRIPT_CHECK_SEQ_BASE_CREATE_CRITIRIA_DETAIL_LISTBOX_IS_CHECKED}=    select field_label from slg.mst_group_exclude join slg.mst_group_exclude_detail on slg.mst_group_exclude.group_id  = slg.mst_group_exclude_detail.group_id and group_name = 'TEST CREATE ALL FLAG' where slg.mst_group_exclude_detail.is_checked = 'true' order by field_seq;
${SCRIPT_CHECK_SEQ_BASE_CREATE_CRITIRIA_DETAIL_LISTBOX}=    select field_label from slg.mst_group_exclude join slg.mst_group_exclude_detail on slg.mst_group_exclude.group_id  = slg.mst_group_exclude_detail.group_id and group_name = 'TEST CREATE ALL FLAG' where slg.mst_group_exclude_detail.is_checked = 'false' order by field_seq;