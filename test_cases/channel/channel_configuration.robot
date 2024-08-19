*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Resource   ../../resources/Keywords/channel_keywords.robot
Resource   ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/channel_variables.robot

*** Test Cases ***
Test Keyword
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_001_CONDITION}
    Click Edit Botton    ${CHANNEL_ID}
    Check Text Data Is True    ${TC_001_DATA}    ${CHOOSE_KEY_EDIT_PAGE}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}


TC_001
    [Documentation]    ตรวจสอบกรณีผู้ใช้ทำการเพิ่ม/แก้ไข/ลบ  Channel
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    # Click Button Add
    # Auto Insert Data    ${TC_001_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    # Click Button Save
    # Alert Popup Message     ${TC_001_DATA.result.expected_result}
    # Click Button Back
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_001_CONDITION}
    Auto Check List Data   ${CHANNEL_ID}    ${TC_001_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Close Browser

TC_002
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Input Text Data      ${TC_002_DATA}    ${CHOOSE_KEY_INPUT_TEXT}
    Input Check Box Data    ${TC_002_DATA}    ${CHOOSE_KEY_INPUT_CHECKBOX}
    Input Select Option Data   ${TC_002_DATA}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Wait Until Keyword Succeeds   5x    5s     Page Should Contain     ${TC_002_DATA.result.expected_result}
    Sleep    ${DELAY}
    Close Browser

TC_003
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Input Data     ${TC_003_DATA}
    Click Button Save
    Wait Until Keyword Succeeds   5x    5s     Page Should Contain     ${TC_003_DATA.result.expected_result}
    Close Browser

# robot --test "READ DATA FROM YAML" path/to/your/test_cases/channel/TC_001.robot