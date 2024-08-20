*** Settings ***
Library    SeleniumLibrary
Variables    ../../resources/variables/profile_data.yaml


*** Variables ***
${DELAY}    5s


#SET VARIABLE DATABASE
${TABLE_NAME}    slg.mst_profile
${COLUMN_ID}    profile_id


#GET DATA YAML
${TC_015_DATA}    ${TC_015}
${TC_016_DATA}    ${TC_016}
${TC_017_DATA}    ${TC_017} 
${TC_018_DATA}    ${TC_018}
${TC_019_DATA}    ${TC_019}
${TC_023_DATA}    ${TC_023}
${TC_024_DATA}    ${TC_024}
${TC_025_DATA}    ${TC_025}
${TC_026_DATA}    ${TC_026}
${TC_027_DATA}    ${TC_027}


#PROFILE LIST
${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    profile_name,profile_group,profile_table
${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}    is_active


#ADD PROFILE
${CHOOSE_KEY_INPUT_TEXT}    profile_name,profile_group,profile_table
${CHOOSE_KEY_INPUT_CHECKBOX}    is_active


#EDIT PROFILE
${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    profile_name,profile_group,profile_table
${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}    is_active


#CHECK_VALIDATE
${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    profile_name,profile_group,profile_table

