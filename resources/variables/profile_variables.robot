*** Settings ***
Library    SeleniumLibrary
Variables    ../../resources/variables/profile_data.yaml


*** Variables ***
${DELAY}    5s

#GET DATA
${TC_015_DATA}    ${TC_015}
${TC_016_DATA}    ${TC_016} 
${TC_017_DATA}    ${TC_017}


#TC_015
${CHOOSE_KEY_INPUT_TEXT}    profile_name,profile_group,profile_table
${CHOOSE_KEY_INPUT_CHECKBOX}    is_active


