*** Settings ***
Library    SeleniumLibrary
Variables    ../../resources/variables/profile_data.yaml


*** Variables ***
${DELAY}    5s

#GET DATA YAML
${TC_015_DATA}    ${TC_015}
${TC_016_DATA}    ${TC_016}
${TC_017_DATA}    ${TC_017} 
${TC_018_DATA}    ${TC_018}
${TC_019_DATA}    ${TC_019}


#GET DATA CHOOSE
${CHOOSE_KEY_INPUT_TEXT}    profile_name,profile_group,profile_table
${CHOOSE_KEY_INPUT_CHECKBOX}    is_active


#Set Variable Database
${TABLE_NAME}    slg.mst_profile
${COLUMN_ID}    profile_id
${CONDITION}    profile_name


