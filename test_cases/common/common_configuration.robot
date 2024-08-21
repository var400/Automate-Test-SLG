*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    String
Resource   ../../resources/Keywords/common_keywords.robot
Resource   ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/common_variables.robot

*** Test Cases ***
Clear And Insert Data In Database
    ${sql_script} =    Get File    ${SQLFilePath}
    Clear Database    ${sql_script}

Test Variable 
    Log To Console    ${TC_001_DATA['TC_001_DETAIL']['DATA_1']}

Test Keyword
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    # Auto Insert Data    ${TC_001_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Add Detail
    Input Auto Complete Detail    ${TC_001_DATA['TC_001_DETAIL']['DATA_1']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}
    # Auto Insert Data Detail    ${TC_001_DATA['TC_001_DETAIL']['DATA_1']}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    # # Click Button Save Detail
    # Click Button Close Detail
    Sleep    5s
    # ${COMMON_CONFIG_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_001_DATA['condition']}
    # Click Edit Botton    ${COMMON_CONFIG_ID}
    # Click Button Back
    # Auto Check Text Data Edit Page    ${TC_001_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
