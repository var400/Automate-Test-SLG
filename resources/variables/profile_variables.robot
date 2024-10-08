*** Settings ***
Library    SeleniumLibrary
Variables    ../../resources/variables/src/profile_data.yaml


*** Variables ***
${DELAY}    5s


#CLEAR AND INSERT DATA
${SQLFilePath}   test_cases/profile/clear_and_insert.sql


#SET VARIABLE DATABASE
${TABLE_NAME}    slg.mst_profile
${COLUMN_ID}    profile_id


#GET DATA YAML
${TC_010_DATA}    ${TC_010}
${TC_012_DATA}    ${TC_012}
${TC_015_DATA}    ${TC_015}
${TC_016_DATA}    ${TC_016}
${TC_017_DATA}    ${TC_017} 
${TC_018_DATA}    ${TC_018}
${TC_019_DATA}    ${TC_019}
${TC_020_DATA}    ${TC_020}
${TC_024_DATA}    ${TC_024}
${TC_025_DATA}    ${TC_025}
${TC_026_DATA}    ${TC_026}
${TC_027_DATA}    ${TC_027}
${TC_028_DATA}    ${TC_028}
${TC_029_DATA}    ${TC_029}



#PROFILE LIST
${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    profile_name,profile_label,profile_group,profile_table
${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}    is_active


#ADD PROFILE
${CHOOSE_KEY_INPUT_TEXT}    profile_name,profile_label,profile_group,profile_table
${CHOOSE_KEY_INPUT_CHECKBOX}    is_active


#UPDATE/CHECK EDIT PAGE PROFILE
${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    profile_name,profile_label,profile_group,profile_table
${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}    is_active


#CHECK_VALIDATE
${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    profile_name,profile_label


