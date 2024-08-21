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

Test Keyword
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    # ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_001_DATA['condition']}
    # Click Edit Botton    ${CHANNEL_ID}
    Click Button Back
    # Auto Check Text Data Edit Page    ${TC_001_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
